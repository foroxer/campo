using BitacoraLib.entities;
using BitacoraLib.services;
using Business;
using Models;
using Models.interfaces;
using Models.language;
using Models.venta;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Utiles;

namespace View.coupon
{
    public partial class frmCoupon : Form, ILanguageObserber
    {
        CouponsService couponsService = new CouponsService();
        List<Coupon> coupons = new List<Coupon>();
        public frmCoupon()
        {
            InitializeComponent();
            updateLanguage(null);

        }

        public void updateLanguage( Language language )
        {
            Translator.translate(this);
        }

        private void Coupon_Load( object sender, EventArgs e )
        {
            coupons = couponsService.getAll();
            dateTimePicker1.MinDate = DateTime.Now;
            enableDatePicker.MinDate = DateTime.Now;
            enableBtn.Visible = false;
            disableBtn.Visible = false;
            enableDatePicker.Visible = false;

            comboBox1.DataSource = Enum.GetValues(typeof(CouponType));
            comboBox1_SelectedIndexChanged(null, null);
            dataGridView1.DataSource = coupons;


            dataGridView1.AllowUserToAddRows = false;
            dataGridView1.AllowUserToDeleteRows = false;
            dataGridView1.AllowUserToResizeRows = false;
            dataGridView1.RowHeadersWidthSizeMode = DataGridViewRowHeadersWidthSizeMode.DisableResizing;
            dataGridView1.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.DisableResizing;
            dataGridView1.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dataGridView1.ReadOnly = true;
            dataGridView1.SelectionMode = DataGridViewSelectionMode.FullRowSelect;

            foreach ( DataGridViewColumn column in dataGridView1.Columns )
            {
                column.Tag = "table" + column.HeaderText.ToLower().RemoveWhitespaces();
            }

        }

        private void comboBox1_SelectedIndexChanged( object sender, EventArgs e )
        {
            if ( CouponType.Percentage.Equals((CouponType)comboBox1.SelectedItem) )
            {
                numericUpDown1.Maximum = 100;
                return;
            }
            numericUpDown1.Maximum = Int32.MaxValue;

        }

        private void AltaBtn_Click( object sender, EventArgs e )
        {

            try
            {
                string code = couponCodeAlta.GetStringMinLength(3);
                Coupon coupon = new Coupon
                {
                    code = code,
                    discount = ( (int)numericUpDown1.Value ),
                    type = (CouponType)comboBox1.SelectedItem,
                    expirationDate = dateTimePicker1.Value
                };
                couponsService.create(coupon);
                BitacoraService.register(PriorityEnum.Low, "Alta cupon " + couponCodeAlta.Text + ", descuento " + ( (int)numericUpDown1.Value ), Session.GetInstance.user.Id.ToString());
                Coupon_Load(null, null);
            }
            catch ( Exception )
            {
                BitacoraService.register(PriorityEnum.High, "Error alta cupon " + couponCodeAlta.Text + ", descuento " + ( (int)numericUpDown1.Value ), Session.GetInstance.user.Id.ToString());
                MessageBox.Show("hubo un error al crear el cupon");
            }
        }

        private void dataGridView1_DataBindingComplete( object sender, DataGridViewBindingCompleteEventArgs e )
        {
            if ( dataGridView1.Rows.Count > 0 )
            {
                dataGridView1.Columns["dvh"].Visible = false;
                dataGridView1.Columns["id"].Visible = false;
                dataGridView1.ClearSelection();

            }
            foreach ( DataGridViewRow Myrow in dataGridView1.Rows )
            { 
                if ( DateTime.Parse( Myrow.Cells["expirationDate"].Value.ToString()).Ticks < DateTime.Now.Ticks )// Or your condition 
                {
                    Myrow.DefaultCellStyle.BackColor = Color.Gray;
                }
  
            }
        }

        private void couponCodeAlta_TextChanged( object sender, EventArgs e )
        {
            dataGridView1.DataSource = coupons.Where(x => x.code.StartsWith(couponCodeAlta.Text)).ToList();

        }

        private void dataGridView1_CellClick( object sender, DataGridViewCellEventArgs e )
        {
            if ( dataGridView1?.SelectedRows.Count == 1 )
            {
                Coupon selected = dataGridView1?.SelectedRows[0]?.DataBoundItem as Coupon;
                if ( selected != null )
                {
                    if ( selected.expirationDate.Ticks < DateTime.Now.Ticks )
                    {
                        enableBtn.Visible = true;
                        disableBtn.Visible = false;
                        enableDatePicker.Visible = true;
                    }
                    else
                    {
                        enableBtn.Visible = false;
                        disableBtn.Visible = true;
                        enableDatePicker.Visible = false;
                    }
                }
            }
        }

        private void enableBtn_Click( object sender, EventArgs e )
        {
            if ( dataGridView1?.SelectedRows.Count == 1 )
            {
                Coupon selected = dataGridView1?.SelectedRows[0]?.DataBoundItem as Coupon;
                if ( selected != null )
                {
                    if ( enableDatePicker.Value.Ticks > DateTime.Now.Ticks )
                    {
                        selected.expirationDate = enableDatePicker.Value;
                        couponsService.update(selected);
                        Coupon_Load(null, null);

                    }
                    else
                    {
                        MessageBox.Show("la fecha seleccionada no es valida");
                    }
                }
            }
        }

        private void disableBtn_Click( object sender, EventArgs e )
        {
            if ( dataGridView1?.SelectedRows.Count == 1 )
            {
                Coupon selected = dataGridView1?.SelectedRows[0]?.DataBoundItem as Coupon;
                if ( selected != null )
                {
                    selected.expirationDate = DateTime.Now.AddDays(-1);
                    couponsService.update(selected);
                    Coupon_Load(null, null);
                }
            }
        }
    }
}
