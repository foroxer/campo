using BitacoraLib.services;
using Business;
using Microsoft.Reporting.WinForms;
using Models.venta;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace View.reports
{
    public partial class VentaViewer : Form
    {
        VentaService ventaService = new VentaService();
        List<Venta> ventaList = new List<Venta>();
        public VentaViewer()
        {
            InitializeComponent();

            ventaList = ventaService.getAll();
        }

        private void VentaViewer_Load( object sender, EventArgs e )
        {

            
            bindingSource1.DataSource = ventaList;
            WindowState = FormWindowState.Maximized;
            reportViewer1.ZoomMode = ZoomMode.PageWidth;
            this.reportViewer1.RefreshReport();
        }

        private void button1_Click( object sender, EventArgs e )
        {
            try
            {
                var bytes = reportViewer1.LocalReport.Render(format: "PDF", deviceInfo: "");


                SaveFileDialog saveFileDialog1 = new SaveFileDialog();

                saveFileDialog1.Filter = "pdf files (*.pdf)|*.pdf";
                saveFileDialog1.FilterIndex = 2;
                saveFileDialog1.RestoreDirectory = true;
                saveFileDialog1.DefaultExt = "json";
                saveFileDialog1.FileName = "report_" + DateTime.Now.ToString("dd-MM-yyyy");

                if ( saveFileDialog1.ShowDialog() == DialogResult.OK )
                {

                    File.WriteAllBytes(saveFileDialog1.FileName, bytes);
                    System.Diagnostics.Process.Start(saveFileDialog1.FileName);
                }

            }
            catch
            {
                MessageBox.Show("Ocurrio un problema al crear el PDF");
            }
        }

      
    }
}
