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
using Utiles;

namespace View.reports
{
    public partial class frmVentasReportViewer : Form
    {
        VentaService ventaService = new VentaService();
        List<Venta> ventas = new List<Venta>();
        public frmVentasReportViewer()
        {
            InitializeComponent();
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
                saveFileDialog1.DefaultExt = "pdf";
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


        private void button2_Click( object sender, EventArgs e )
        {
            try
            {

                SaveFileDialog saveFileDialog1 = new SaveFileDialog();

                saveFileDialog1.Filter = "json files (*.json)|*.json";
                saveFileDialog1.FilterIndex = 2;
                saveFileDialog1.RestoreDirectory = true;
                saveFileDialog1.DefaultExt = "json";
                saveFileDialog1.FileName = "report_" + DateTime.Now.ToString("dd-MM-yyyy");


                if ( saveFileDialog1.ShowDialog() == DialogResult.OK )
                {
                    Serializer.serializeAndSave(saveFileDialog1.FileName, ventas);
                    System.Diagnostics.Process.Start(saveFileDialog1.FileName);
                }
            }
            catch ( Exception ex )
            {
            }
        }

        private void frmVentasReportViewer_Load( object sender, EventArgs e )
        {
            ventas = ventaService.getAll().OrderBy(x => x.date).ToList();
            ventas.ForEach(v => v.date = new DateTime(v.date.Year,v.date.Month,v.date.Day));
            ventaBindingSource.DataSource = ventas;
            WindowState = FormWindowState.Maximized;
            reportViewer1.ZoomMode = ZoomMode.PageWidth;
            this.reportViewer1.RefreshReport();
        }
    }
}
