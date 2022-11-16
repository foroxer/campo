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
        IntegrityChecker integrityChecker;
        List<String> listErrors;
        public PreCheck()
        {
            InitializeComponent();
            integrityChecker = new IntegrityChecker();

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

        private void PreCheck_Load( object sender, EventArgs e )
        {

        }

        private void PreCheck_Shown( object sender, EventArgs e )
        {
            listErrors = integrityChecker.check();

            dataGridView1.DataSource = listErrors.Select(er => new { error = er }).ToList();
            dataGridView1.CurrentCell.Selected = false;

            pictureBox1.Hide();
            if ( listErrors.Count == 0 )
            {
                Hide();
                Form login = new frmLogin();
                login.Show();
            }
        }


        private void button1_Click( object sender, EventArgs e )
        {
            Hide();
            Form login = new frmLogin(true);
            login.Show();
        }
    }
}
