using Business;
using Models.bussines;
using Models.interfaces;
using Models.language;
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

namespace View.business
{
    public partial class frmMachineTypes : Form, ILanguageObserber
    {
        ExerciseService exersiceService;
        public frmMachineTypes()
        {
            InitializeComponent();
            exersiceService = new ExerciseService();
        }

        private void frmMachinetypes_Load(object sender, EventArgs e)
        {
            dataGridView1.DataSource = exersiceService.GetAllMachineTypes();

            dataGridView1.AllowUserToAddRows = false;
            dataGridView1.AllowUserToDeleteRows = false;
            dataGridView1.AllowUserToResizeRows = false;
            dataGridView1.RowHeadersWidthSizeMode = DataGridViewRowHeadersWidthSizeMode.DisableResizing;
            dataGridView1.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.DisableResizing;
            dataGridView1.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dataGridView1.ReadOnly = true;
            dataGridView1.SelectionMode = DataGridViewSelectionMode.FullRowSelect;


            dataGridView1.Columns["id"].Visible = false;
            foreach (DataGridViewColumn column in dataGridView1.Columns)
            {
                column.Tag = "table" + column.HeaderText.ToLower().RemoveWhitespaces();
            }

            DataGridViewButtonColumn button = new DataGridViewButtonColumn();
            button.Name = "borrar";
            button.Tag = "borrar";
            button.Text = "borrar";
            button.UseColumnTextForButtonValue = true;

            int columnIndex = 0;
            if (dataGridView1.Columns["uninstall_column"] == null)
            {
                dataGridView1.Columns.Insert(columnIndex, button);
            }
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.ColumnIndex == dataGridView1.Columns["borrar"].Index && DialogResult.OK == MessageBox.Show("Esta seguro que desea continuar", "", MessageBoxButtons.OKCancel))
            {
                exersiceService.DeleteMachineType(dataGridView1.Rows[e.RowIndex].DataBoundItem as MachineType);
                dataGridView1.DataSource = exersiceService.GetAllMachineTypes();
            }
        }

        public void updateLanguage(Language language)
        {
            Translator.translate(this);
        }

        private void button1_Click(object sender, EventArgs e)
        {

            try
            {
                exersiceService.CreateMachineType(textBox1.GetStringMinLength(3));
                dataGridView1.DataSource = exersiceService.GetAllMachineTypes();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
    }
}
