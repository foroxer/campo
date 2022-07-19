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

namespace View.business
{
    public partial class frmExersiceAssign : Form, ILanguageObserber
    {
        UserService userService;
        ExerciseService exerciseService;
        private List<User> userList;
        public frmExersiceAssign()
        {
            InitializeComponent();
            userService = new UserService();
            exerciseService = new ExerciseService();
        }

        private void frmExersiceAssign_Load(object sender, EventArgs e)
        {
            userList = (from user in userService.GetAll() select new User() { Id = user.Id, Name = user.Name, LastName = user.LastName, Dni = user.Dni }).ToList<User>();
            dataGridView1.DataSource = userList;
            dataGridView2.DataSource = exerciseService.GetAllMuscularGroups();
            dataGridView3.DataSource = exerciseService.GetAssignedMuscularGroupBy(userList.First().Id);
            dataGridView3.DataMember = "mitabla";

            configDatagrid(dataGridView1);
            configDatagrid(dataGridView2);
            configDatagrid(dataGridView3);

            dataGridView1.Columns["tries"].Visible = false;
            dataGridView1.Columns["language"].Visible = false;
            dataGridView1.Columns["password"].Visible = false;
            dataGridView1.Columns["nic"].Visible = false;
            dataGridView1.Columns["mail"].Visible = false;
            dataGridView1.Columns["phone"].Visible = false;
            dataGridView1.Columns["adress"].Visible = false;
            dataGridView1.Columns["blocked"].Visible = false;
            dataGridView1.Columns["id"].Visible = false;
            dataGridView2.Columns["id"].Visible = false;

            if (dataGridView3.Columns.Count > 0)
            {
                dataGridView3.Columns["id_grupo_muscular"].Visible = false;
                dataGridView3.Columns["id_usuario"].Visible = false;
            }

            DataGridViewButtonColumn button = new DataGridViewButtonColumn();
            button.Name = "borrar";
            button.Tag = "borrar";
            button.Text = "borrar";
            button.UseColumnTextForButtonValue = true;

            int columnIndex = 0;
            if (dataGridView3.Columns["borrar"] == null)
            {
                dataGridView3.Columns.Insert(columnIndex, button);
            }

            updateLanguage(null);
        }
        public void updateLanguage(Language language)
        {
            Translator.translate(this);
        }

        private void search_TextChanged(object sender, EventArgs e)
        {
            dataGridView1.DataSource = userList.Where(user =>

            user.Name.Contains(textBox1.Text) &&
            user.LastName.Contains(textBox2.Text) &&
            user.Dni.Contains(textBox3.Text)
            ).ToList();
        }

        private void dataGridView1_SelectionChanged(object sender, EventArgs e)
        {

            try
            {
                if (dataGridView1.SelectedRows.Count != 0)
                {
                    User selected = dataGridView1?.SelectedRows[0]?.DataBoundItem as User;

                    dataGridView3.DataSource = exerciseService.GetAssignedMuscularGroupBy(selected.Id);
                }

            }
            catch (Exception)
            {


            }
        }
        private void configDatagrid(DataGridView dataGridView)
        {
            dataGridView.AllowUserToAddRows = false;
            dataGridView.AllowUserToDeleteRows = false;
            dataGridView.AllowUserToResizeRows = false;
            dataGridView.RowHeadersWidthSizeMode = DataGridViewRowHeadersWidthSizeMode.DisableResizing;
            dataGridView.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.DisableResizing;
            dataGridView.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dataGridView.ReadOnly = true;
            dataGridView.SelectionMode = DataGridViewSelectionMode.FullRowSelect;

            foreach (DataGridViewColumn column in dataGridView.Columns)
            {
                column.Tag = "table" + column.HeaderText.ToLower().RemoveWhitespaces();
            }
        }

        private void button3_Click(object sender, EventArgs e)
        {
            try
            {
                User user = dataGridView1?.SelectedRows[0]?.DataBoundItem as User;
                MuscularGroup muscularGroup = dataGridView2?.SelectedRows[0]?.DataBoundItem as MuscularGroup;
                exerciseService.AssingMuscularGroup(user, muscularGroup, Convert.ToInt32(repetitions.Value), Convert.ToDouble(weight.Value));
                dataGridView3.DataSource = exerciseService.GetAssignedMuscularGroupBy(user.Id);
            }
            catch (Exception)
            {
                MessageBox.Show("Ocurrio un error, por favor verifique los campos ingresados");
            }
        }

        private void dataGridView3_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            try
            {
                if (e.ColumnIndex == dataGridView3.Columns["borrar"].Index && DialogResult.OK == MessageBox.Show("Esta seguro que desea continuar", "", MessageBoxButtons.OKCancel))
                {
                    int columnId = dataGridView3.Columns["id_grupo_muscular"].Index;
                    int muscularGroupId = int.Parse(dataGridView3.Rows[e.RowIndex].Cells[columnId].Value.ToString());


                    User user = dataGridView1?.SelectedRows[0]?.DataBoundItem as User;
                    exerciseService.UnassingMuscularGroup(user.Id, muscularGroupId);



                    dataGridView3.DataSource = exerciseService.GetAssignedMuscularGroupBy(user.Id);
                }
            }
            catch (Exception)
            {
                MessageBox.Show("Ocurrio un error");
            }
        }
    }
}
