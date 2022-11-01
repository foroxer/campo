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

namespace View.changeControl
{
    public partial class frmUserChangeControl : Form, ILanguageObserber
    {
        ChangesControlService changesControlService;
        UserService userService;
        DataTable changesTable;
        public frmUserChangeControl()
        {
            InitializeComponent();
            updateLanguage(null);

            changesControlService = new ChangesControlService();
            changesTable = changesControlService.getAllChanges();

            userService = new UserService();

            dataGridView1.AllowUserToAddRows = false;
            dataGridView1.AllowUserToDeleteRows = false;
            dataGridView1.AllowUserToResizeRows = false;
            dataGridView1.RowHeadersWidthSizeMode = DataGridViewRowHeadersWidthSizeMode.DisableResizing;
            dataGridView1.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.DisableResizing;
            dataGridView1.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dataGridView1.ReadOnly = true;
            dataGridView1.SelectionMode = DataGridViewSelectionMode.FullRowSelect;

            foreach ( DataRow dr in changesTable.Rows ) // search whole table
            {
                dr["fecha"] = new DateTime(long.Parse(dr["fecha"].ToString()));
            }

            DataGridViewButtonColumn restoreButton = new DataGridViewButtonColumn();
            restoreButton.Name = "restaurar";
            restoreButton.Tag = "restaurar";
            restoreButton.Text = "restaurar";
            restoreButton.UseColumnTextForButtonValue = true;

            int columnIndex = 0;
            if ( dataGridView1.Columns["restaurar"] == null )
            {
                dataGridView1.Columns.Insert(columnIndex, restoreButton);
            }
        }

        public void updateLanguage( Language language )
        {
            Translator.translate(this);
        }

        private void UserChangeControl_Load( object sender, EventArgs e )
        {
            dataGridView1.DataSource = changesTable;
        }

        private void dataGridView1_CellClick( object sender, DataGridViewCellEventArgs e )
        {
            if ( e.ColumnIndex == dataGridView1.Columns["restaurar"].Index && DialogResult.OK == MessageBox.Show("Esta seguro que desea continuar", "", MessageBoxButtons.OKCancel) )
            {
                //TODO restaurar usuario
                //userService.UpdateUser();
            }
        }

        private void dataGridView1_DataBindingComplete( object sender, DataGridViewBindingCompleteEventArgs e )
        {
            if ( dataGridView1.Rows.Count > 0)
            {
                dataGridView1.Columns["id"].Visible = false;
            }
        }

        private void searchBtn_Click( object sender, EventArgs e )
        {

            StringBuilder builder = new StringBuilder();
            if ( idTxt.Text.Length > 0 ) builder.Append($@"id_usuario = {idTxt.Text}");
            if ( dniTxt.Text.Length > 0 ) builder.Append($@"{( idTxt.Text.Length > 0 ? " AND " : " " )} dni LIKE  '{dniTxt.Text}*' ");
            if ( nameTxt.Text.Length > 0 ) builder.Append($@"{( dniTxt.Text.Length > 0 ? " AND " : " " )} nombre LIKE  '{nameTxt.Text}*' ");
            if ( lastNameTxt.Text.Length > 0 ) builder.Append($@"{( nameTxt.Text.Length > 0 ? " AND " : " " )} apellido LIKE  '{lastNameTxt.Text}*' ");
            dataGridView1.DataSource = changesTable.Select(builder.ToString()).CopyToDataTable();
        }
    }
}
