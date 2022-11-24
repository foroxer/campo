using Business;
using Models;
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

namespace View
{
    public partial class frmExercisesVisualization : Form, ILanguageObserber
    {
        ExerciseService exerciseService;
        public frmExercisesVisualization()
        {
            InitializeComponent();
            exerciseService = new ExerciseService();
        }
        private void Rutines_FormClosed( object sender, FormClosedEventArgs e )
        {
        }
        private void Rutines_Load( object sender, EventArgs e )
        {

            dataGridView1.DataSource = exerciseService.GetAssignedMuscularGroupBy(Session.GetInstance.user.Id);
            dataGridView1.DataMember = "mitabla";


            configDatagrid(dataGridView1);
            configDatagrid(dataGridView2);
            updateLanguage(null);
        }
        public void updateLanguage( Language language )
        {
            Translator.translate(this);
        }
        private void configDatagrid( DataGridView dataGridView )
        {
            dataGridView.AllowUserToAddRows = false;
            dataGridView.AllowUserToDeleteRows = false;
            dataGridView.AllowUserToResizeRows = false;
            dataGridView.RowHeadersWidthSizeMode = DataGridViewRowHeadersWidthSizeMode.DisableResizing;
            dataGridView.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.DisableResizing;
            dataGridView.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dataGridView.ReadOnly = true;
            dataGridView.SelectionMode = DataGridViewSelectionMode.FullRowSelect;

            foreach ( DataGridViewColumn column in dataGridView.Columns )
            {
                column.Tag = "table" + column.HeaderText.ToLower().RemoveWhitespaces();
            }
        }

        private void dataGridView1_SelectionChanged( object sender, EventArgs e )
        {
            try
            {
                if ( dataGridView1.SelectedRows.Count != 0 )
                {
                    int columnId = dataGridView1.Columns["id_grupo_muscular"].Index;
                    int muscularGroupId = int.Parse(dataGridView1.SelectedRows[0].Cells[columnId].Value.ToString());

                    dataGridView2.DataSource = exerciseService.GetExercisesBy(new MuscularGroup() { Id = muscularGroupId });
                }
            }
            catch ( Exception )
            {

            }
        }

        private void dataGridView1_DataBindingComplete( object sender, DataGridViewBindingCompleteEventArgs e )
        {
            if ( dataGridView1.Rows.Count > 0 )
            {
                dataGridView1.Columns["id_usuario"].Visible = false;
                dataGridView1.Columns["id_grupo_muscular"].Visible = false;

            }
        }

        private void dataGridView2_DataBindingComplete( object sender, DataGridViewBindingCompleteEventArgs e )
        {
            dataGridView2.Columns["id"].Visible = false;
        }
    }
}
