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
                var bytes = reportViewer1.LocalReport.Render(format:"PDF", deviceInfo: "" );

                string filePath = Environment.GetFolderPath(Environment.SpecialFolder.Desktop) + "\\report.pdf";
                File.WriteAllBytes(filePath, bytes);
                System.Diagnostics.Process.Start(filePath);
            }
            catch
            {
                MessageBox.Show("ocurrio un problema al crear el PDF");
            }
        }

        private void frmReportViewer_HelpRequested( object sender, HelpEventArgs hlpevent )
        {
            Help.ShowHelp(reportViewer1, AppContext.BaseDirectory+ @"Resources\testfile.chm");
        }
    }
}
