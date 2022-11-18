using Business;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace View
{
    public partial class frmDV : Form
    {
        private IntegrityService integrityChecker;
        private List<string> listErrors;

        public frmDV()
        {
            InitializeComponent();
            integrityChecker = new IntegrityService();

            dataGridView1.AllowUserToAddRows = false;
            dataGridView1.AllowUserToDeleteRows = false;
            dataGridView1.AllowUserToResizeRows = false;
            dataGridView1.RowHeadersWidthSizeMode = DataGridViewRowHeadersWidthSizeMode.DisableResizing;
            dataGridView1.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.DisableResizing;
            dataGridView1.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dataGridView1.ReadOnly = true;
            dataGridView1.SelectionMode = DataGridViewSelectionMode.CellSelect;
            dataGridView1.RowHeadersVisible = false;


        }

        private void frmDV_Load( object sender, EventArgs e )
        {
            listErrors = integrityChecker.check();

            dataGridView1.DataSource = listErrors.Select(er => new { error = er }).ToList();

            if( dataGridView1.CurrentCell != null) dataGridView1.CurrentCell.Selected = false;
        }

        private void button1_Click( object sender, EventArgs e )
        {
            integrityChecker.recalcDV();
            frmDV_Load(null,null);
        }
    }
}
