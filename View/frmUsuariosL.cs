using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Business;
using Models;
using Utiles;

namespace View
{
    public partial class frmUsuariosL : Form
    {
        UserService userService;
        public frmUsuariosL()
        {
            InitializeComponent();
            userService = new UserService();
        }

        private void frmUsuariosL_Load(object sender, EventArgs e)
        {
            dataGridView1.DataSource = userService.GetAll();
            Dock = DockStyle.Fill;
            dataGridView1.Dock = DockStyle.Fill;

            dataGridView1.AllowUserToAddRows = false;
            dataGridView1.AllowUserToDeleteRows = false;
            dataGridView1.AllowUserToResizeRows = false;
            dataGridView1.RowHeadersWidthSizeMode = DataGridViewRowHeadersWidthSizeMode.DisableResizing;
            dataGridView1.ColumnHeadersHeightSizeMode =  DataGridViewColumnHeadersHeightSizeMode.DisableResizing;
            dataGridView1.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dataGridView1.ReadOnly = true;

            dataGridView1.Columns["tries"].Visible = false;
            dataGridView1.Columns["language"].Visible = false;
            dataGridView1.Columns["password"].Visible = false;
        }

        private void textBox1_KeyPress(object sender, KeyPressEventArgs e)
        {
           
            
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {
            List<User> lista = userService.GetAll();

            dataGridView1.DataSource = lista.Where(user =>

            user.Name.Contains(textBox1.Text) &&
            user.LastName.Contains(textBox2.Text) && 
            user.Dni.Contains(textBox3.Text)
            ).ToList();
        }
    }
}
