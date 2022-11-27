using BitacoraLib.entities;
using BitacoraLib.services;
using Business;
using Models;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace View
{
    public partial class PreCheck : Form
    {
        IntegrityService integrityChecker;
        List<String> listErrors;
        public PreCheck()
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
            this.Icon = Properties.Resources.icon;

        }

        private void PreCheck_Load( object sender, EventArgs e )
        {
        }

        private void PreCheck_Shown( object sender, EventArgs e )
        {
            pictureBox1.Hide();
            listErrors = integrityChecker.check();

            dataGridView1.DataSource = listErrors.Select(er => new { error = er }).ToList();
            if ( dataGridView1.CurrentCell != null ) dataGridView1.CurrentCell.Selected = false;

            if ( listErrors.Count == 0 )
            {
                Hide();
                Form login = new frmLogin();
                login.Show();
                return;
            }

            Hide();
            var response = MessageBox.Show("Ocurrio un Error , por favor comuniquese con un admin. \nSi es un admin de click en aceptar", "ERROR", MessageBoxButtons.OKCancel);
            if ( DialogResult.OK.Equals(response))
            {
                Show();
                return;
            }
            Close();

        }


        private void button1_Click( object sender, EventArgs e )
        {
            Hide();
            Form login = new frmLogin(true);
            login.Show();
        }
    }
}
