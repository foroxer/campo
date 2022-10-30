using BitacoraLib.entities;
using BitacoraLib.services;
using Business;
using Models;
using Models.interfaces;
using Models.language;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Utiles;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace View.bitacora
{
    public partial class frmBitacora : Form, ILanguageObserber
    {
        UserService userService;
        List<IRegistry> bitacoraList;
        public frmBitacora()
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
            userService = new UserService();
        }

        private void button1_Click( object sender, EventArgs e )
        {
            dataGridView1.DataSource = bitacoraList.Where(register =>
  
                register.dateTime.Ticks > dateTimePicker1.Value.Date.Ticks && register.dateTime.Ticks < dateTimePicker2.Value.Date.Ticks
                && (priorityCheck.Checked ? register.priority.Equals(priorityCombo.SelectedItem) :true ) //devuelve true cuando el check esta desactivado
                && (userCheck.Checked ? register.user.Trim().Equals((userCombo.SelectedItem as User).Id.ToString() ) : true )  //devuelve true cuando el check esta desactivado

          ).ToList();

        }

        private void Bitacora_Load( object sender, EventArgs e )
        {
            dateTimePicker2.Value = DateTime.Today.AddDays(1);
            dataGridView1.DataSource = bitacoraList;
            priorityCombo.DataSource = Enum.GetValues(typeof(PriorityEnum));

            foreach ( DataGridViewColumn column in dataGridView1.Columns )
            {
                column.Tag = "table" + column.HeaderText.ToLower().RemoveWhitespaces();
            }

            userCombo.DataSource = userService.GetAll();
            userCombo.ValueMember = "name";

            userCombo.Enabled = userCheck.Checked;
            priorityCombo.Enabled = priorityCheck.Checked;
        }

        public void updateLanguage( Language language )
        {
            Translator.translate(this);
        }

        private void restoreBtn_Click( object sender, EventArgs e )
        {
            this.Bitacora_Load(null, null);
        }

        private void priorityCheck_CheckedChanged( object sender, EventArgs e )
        {
            priorityCombo.Enabled = priorityCheck.Checked;
        }

        private void userCheck_CheckedChanged( object sender, EventArgs e )
        {
            userCombo.Enabled = userCheck.Checked;
        }
    }
}
