﻿using Models.language;
using Models.interfaces;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Models;
using Business;

namespace View
{
    public partial class frmUsuariosA : Form,ILanguageObserber
    {
        UserService userService;

        public frmUsuariosA()
        {
            InitializeComponent();
            userService = new UserService();
            Session.GetInstance.addObserber(this);
        }
        private void frmAMUsuarios_Load(object sender, EventArgs e)
        {
            updateLanguage(Session.GetInstance.language);
        }
        private void frmAMUsuarios_FormClosed(object sender, FormClosedEventArgs e)
        {
            Session.GetInstance.removeObserber(this);
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
        private void createBtn_Click(object sender, EventArgs e)
        {
            User user = new User
            {
                LastName = LNameCreation.Text,
                Name = NameCreation.Text,
                Adress = AdressCreation.Text,
                Mail = MailCreation.Text,
                Nic = NICCreation.Text,
                Phone = PhoneCreation.Text,
                Dni = DNICreation.Text
            };

            try
            {
                userService.CreateUser(user);
                cleanCreationControls();
               
                MessageBox.Show("El usuario se creo con exito");
            }
            catch (Exception)
            {
                MessageBox.Show("ocurrio un error al intentar crear el usuario");
            }
            Close();
        }
        private void cleanCreationControls()
        {
            LNameCreation.Text = string.Empty;
            NameCreation.Text = string.Empty;
            AdressCreation.Text = string.Empty;
            MailCreation.Text = string.Empty;
            NICCreation.Text = string.Empty;
            PhoneCreation.Text = string.Empty;
            DNICreation.Text = string.Empty;
            NICCreation.Focus();
        }
    }
}