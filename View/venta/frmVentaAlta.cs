using Business;
using iTextSharp.text;
using iTextSharp.text.pdf;
using Models.venta;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Drawing.Printing;
using System.IO;
using System.Linq;
using System.Security.AccessControl;
using System.Security.Principal;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Xml.Linq;
using View.reports;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.ProgressBar;
using Chunk = iTextSharp.text.Chunk;

namespace View.venta
{
    public partial class frmVentaAlta : Form
    {
        UserService userService = new UserService();
        ProductService productService = new ProductService();
        VentaService ventaService = new VentaService();

        public frmVentaAlta()
        {
            InitializeComponent();
        }

        Venta preventa = new Venta();
        private void frmVentaAlta_Load( object sender, EventArgs e )
        {

            MinimizeBox = false;
            MaximizeBox = false;
            AutoCompleteStringCollection usersAC = new AutoCompleteStringCollection();


            usersAC.AddRange(userService.GetAll().Select(x => x.Dni).ToArray());
            UsuarioTxt.AutoCompleteMode = AutoCompleteMode.Suggest;
            UsuarioTxt.AutoCompleteSource = AutoCompleteSource.CustomSource;
            UsuarioTxt.AutoCompleteCustomSource = usersAC;
            AutoCompleteStringCollection productsAC = new AutoCompleteStringCollection();

            comboBox1.DataSource = productService.getAll();
            comboBox1.DisplayMember = "Name";
            percentualIcon.Visible = false;


        }

        private void button1_Click( object sender, EventArgs e )
        {
            try
            {
                preventa.products = new List<Product> { { ( comboBox1.SelectedItem as Product ) } };
                try
                {
                    preventa.user = userService.getByDni(UsuarioTxt.GetInt());

                }
                catch ( Exception )
                {

                    throw new Exception("Usiario Invalido");
                }
                preventa = ventaService.createPreventa(preventa);
                refreshPreventa(preventa);
            }
            catch ( Exception ex )
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void button4_Click( object sender, EventArgs e )
        {
            this.Close();
        }


        private void refreshPreventa( Venta preventa )
        {
            usuarioVenta.Text = preventa.user.Name + " " + preventa.user.LastName;
            productoVenta.Text = preventa.products.First()?.description ?? "";
            cuponVenta.Text = preventa.coupon?.code ?? "No aplica";
            subtotalVenta.Text = String.Format("{0:0.00}", preventa.subTotal);
            totalVenta.Text = String.Format("{0:0.00}", preventa.total);
            descuentoCuponVenta.Text = preventa.coupon?.discount.ToString() ?? "";
            percentualIcon.Visible = CouponType.Percentage.Equals(preventa.coupon?.type);
        }

        private void button2_Click( object sender, EventArgs e )
        {
            if ( preventa.user == null )
            {
                MessageBox.Show("Por favor primero carge un usuario y un producto");
                return;
            }
            try
            {
                preventa = ventaService.createPreventa(preventa, cuponTxt.GetStringMinLength(3));
                refreshPreventa(preventa);
            }
            catch ( Exception ex )
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void button3_Click( object sender, EventArgs e )
        {
            try
            {

                if ( preventa.user == null )
                {
                    MessageBox.Show("Por favor primero carge un usuario y un producto");
                    return;
                }
                createPDF( ventaService.save(preventa));

            }
            catch ( Exception )
            {

                MessageBox.Show("Se produjo un error al ejecutar la venta");
            }
            MessageBox.Show("Venta exitosa");

        }

        private void button5_Click( object sender, EventArgs e )
        {
            Form form = ( (frmMain)MdiParent ).createForm(typeof(frmUsuariosL));
        }

        private void createPDF( Venta venta )
        {

            SaveFileDialog saveFileDialog1 = new SaveFileDialog();

            saveFileDialog1.Filter = "pdf files (*.pdf)|*.pdf";
            saveFileDialog1.FilterIndex = 2;
            saveFileDialog1.RestoreDirectory = true;
            saveFileDialog1.DefaultExt = "pdf";
            saveFileDialog1.FileName = "venta-"+venta.user.LastName+"-"+ venta.user.Name + DateTime.Now.ToString("dd-MM-yyyy");

            if ( saveFileDialog1.ShowDialog() == DialogResult.OK )
            {
                ventaService.PDF(venta,saveFileDialog1.FileName);
                System.Diagnostics.Process.Start(saveFileDialog1.FileName);
            }
        }
    }
}
