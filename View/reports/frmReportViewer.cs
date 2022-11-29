using BitacoraLib.entities;
using BitacoraLib.services;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Windows.Forms;
using Microsoft.Reporting.WinForms;
using System.IO;
using View.Properties;
using Utiles;

namespace View.reports
{
    public partial class frmReportViewer : Form
    {
        List<IRegistry> registries = new List<IRegistry>();
        public frmReportViewer()
        {
            InitializeComponent();
        }

        private void frmReportViewer_Load( object sender, EventArgs e )
        {
            registries = BitacoraService.getRegisters().OrderBy(x => x.dateTime).ToList();
            iRegistryBindingSource.DataSource = registries;
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

        private void frmReportViewer_HelpRequested( object sender, HelpEventArgs hlpevent )
        {
            string path = System.AppDomain.CurrentDomain.BaseDirectory + @"help\Help.chm.chm";
#if DEBUG
            path = Environment.GetFolderPath(Environment.SpecialFolder.DesktopDirectory) + @"\help\Help.chm";
#endif
            Help.ShowHelp(this, path);
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
                    Serializer.serializeAndSave(saveFileDialog1.FileName, registries);
                    System.Diagnostics.Process.Start(saveFileDialog1.FileName);
                }
            }
            catch ( Exception )
            {

                MessageBox.Show("Ocurrio un problema al Serializar");
            }
        }
    }
}
