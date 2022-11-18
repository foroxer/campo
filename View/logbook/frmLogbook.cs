using BitacoraLib.entities;
using BitacoraLib.services;
using Business;
using Models;
using Models.interfaces;
using Models.language;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Utiles;

namespace View.logbook
{
    public partial class frmLogbook : Form, ILanguageObserber
    {
        List<IRegistry> bitacoraList;
        public frmLogbook()
        {
            InitializeComponent();
            updateLanguage(null);

            dataGridView1.AllowUserToAddRows = false;
            dataGridView1.AllowUserToDeleteRows = false;
            dataGridView1.AllowUserToResizeRows = false;
            dataGridView1.RowHeadersWidthSizeMode = DataGridViewRowHeadersWidthSizeMode.DisableResizing;
            dataGridView1.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.DisableResizing;
            dataGridView1.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dataGridView1.ReadOnly = true;
            dataGridView1.SelectionMode = DataGridViewSelectionMode.FullRowSelect;

            bitacoraList = BitacoraService.getRegisters();
        }

        private void searchBtn_Click( object sender, EventArgs e )
        {
            dataGridView1.DataSource = bitacoraList.Where(register =>

                register.dateTime.Ticks > dateTimePicker1.Value.Date.Ticks && register.dateTime.Ticks < dateTimePicker2.Value.Date.AddHours(23).AddMinutes(59).AddSeconds(59).Ticks
                && ( priorityCheck.Checked ? register.priority.Equals(priorityCombo.SelectedItem) : true ) //devuelve true cuando el check esta desactivado
                && ( userTxt.Text.Length > 0 ? register.user.Trim().Equals(userTxt.Text) : true )  //devuelve true cuando el check esta desactivado

          ).ToList();

        }

        private void Logbook_Load( object sender, EventArgs e )
        {

            dataGridView1.DataSource = bitacoraList;
            priorityCombo.DataSource = Enum.GetValues(typeof(PriorityEnum));
            userTxt.Text = "";

            foreach ( DataGridViewColumn column in dataGridView1.Columns )
            {
                column.Tag = "table" + column.HeaderText.ToLower().RemoveWhitespaces();
            }

            priorityCombo.Enabled = priorityCheck.Checked;

        }

        public void updateLanguage( Language language )
        {
            Translator.translate(this);
        }

        private void restoreBtn_Click( object sender, EventArgs e )
        {
            this.Logbook_Load(null, null);
        }

        private void priorityCheck_CheckedChanged( object sender, EventArgs e )
        {
            priorityCombo.Enabled = priorityCheck.Checked;
        }
    }
}
