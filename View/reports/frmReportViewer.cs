using BitacoraLib.entities;
using BitacoraLib.services;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

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
            reportViewer1.ZoomMode = Microsoft.Reporting.WinForms.ZoomMode.PageWidth;
            this.reportViewer1.RefreshReport();
        }
    }
}
