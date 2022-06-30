﻿using System;
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
using Models.interfaces;
using Models.language;
using Utiles;

namespace View
{
    public partial class frmUsuariosL : Form,ILanguageObserber
    {
        UserService userService;
        public frmUsuariosL()
        {
            InitializeComponent();
            userService = new UserService();
        }

        private void frmUsuariosL_Load(object sender, EventArgs e)
        {
            Session.GetInstance.addObserber(this);
            dataGridView1.DataSource = userService.GetAll();
            updateLanguage(Session.GetInstance.language);

            
            Dock = DockStyle.Fill;
            dataGridView1.Dock = DockStyle.Fill;

            dataGridView1.AllowUserToAddRows = false;
            dataGridView1.AllowUserToDeleteRows = false;
            dataGridView1.AllowUserToResizeRows = false;
            dataGridView1.RowHeadersWidthSizeMode = DataGridViewRowHeadersWidthSizeMode.DisableResizing;
            dataGridView1.ColumnHeadersHeightSizeMode =  DataGridViewColumnHeadersHeightSizeMode.DisableResizing;
            dataGridView1.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dataGridView1.ReadOnly = true;
            dataGridView1.SelectionMode = DataGridViewSelectionMode.FullRowSelect;


            dataGridView1.Columns["tries"].Visible = false;
            dataGridView1.Columns["language"].Visible = false;
            dataGridView1.Columns["password"].Visible = false;
        }

        private void search_TextChanged(object sender, EventArgs e)
        {
            List<User> lista = userService.GetAll();

            dataGridView1.DataSource = lista.Where(user =>

            user.Name.Contains(textBox1.Text) &&
            user.LastName.Contains(textBox2.Text) && 
            user.Dni.Contains(textBox3.Text)
            ).ToList();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            User selected = dataGridView1?.SelectedRows[0]?.DataBoundItem as User;
            if (selected != null)
            {
                Form form = ((frmMain)MdiParent).createForm(typeof(frmUsuariosM));
                ((frmUsuariosM)form).setUser(selected);
            }
        }

        private void frmUsuariosL_Activated(object sender, EventArgs e)
        {
            frmUsuariosL_Load(null, null);
        }
        public void updateLanguage(Language language)
        {
            foreach (Control control in Controls)
            {
                control.Text = language.Translations.Find(
                        (translation) => translation.Key.Equals(control.Tag)
                    )?.Translate ?? control.Text;
                if (control.Controls.Count != 0)
                {
                    updateLanguageRecursiveControls(language, control.Controls);
                }
            }
        }
        private void updateLanguageRecursiveControls(Language language, Control.ControlCollection parent)
        {
            foreach (Control control in parent)
            {
                control.Text = language.Translations.Find(
                        (translation) => translation.Key.Equals(control.Tag)
                    )?.Translate ?? control.Text;

                if (control.Controls.Count != 0)
                {
                    updateLanguageRecursiveControls(language, control.Controls);
                }
            }
        }

        private void frmUsuariosL_FormClosed(object sender, FormClosedEventArgs e)
        {
            Session.GetInstance.removeObserber(this);
        }
    }
}