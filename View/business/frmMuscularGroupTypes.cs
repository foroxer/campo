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
    public partial class frmMuscularGroupTypes : Form,ILanguageObserber
    {
        ExerciseService exersiceService;
        public frmMuscularGroupTypes()
        {
            InitializeComponent();
            exersiceService = new ExerciseService();
        }

        private void frmMuscularGoupTypes_Load(object sender, EventArgs e)
        {
            dataGridView1.DataSource = exersiceService.GetAllMuscularGroups();

            dataGridView1.AllowUserToAddRows = false;
            dataGridView1.AllowUserToDeleteRows = false;
            dataGridView1.AllowUserToResizeRows = false;
            dataGridView1.RowHeadersWidthSizeMode = DataGridViewRowHeadersWidthSizeMode.DisableResizing;
            dataGridView1.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.DisableResizing;
            dataGridView1.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dataGridView1.ReadOnly = true;
            dataGridView1.SelectionMode = DataGridViewSelectionMode.FullRowSelect;

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
                exersiceService.DeleteMuscularGroup(dataGridView1.Rows[e.RowIndex].DataBoundItem as MuscularGroup);
                dataGridView1.DataSource = exersiceService.GetAllMuscularGroups();
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
                exersiceService.CreateMuscularGroup(textBox1.GetStringMinLength(3));
                dataGridView1.DataSource = exersiceService.GetAllMuscularGroups();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void dataGridView1_DataBindingComplete( object sender, DataGridViewBindingCompleteEventArgs e )
        {
            if ( dataGridView1.Rows.Count > 0 )
                dataGridView1.Columns["id"].Visible = false;
        }
    }
}
