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
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Utiles;

namespace View
{
    public partial class frmResetPassword : Form,ILanguageObserber
    {
        UserService userService;
        public frmResetPassword()
        {
            userService = new UserService();
            InitializeComponent();
        }

        public void updateLanguage(Language language)
        {
            Translator.translate(this, language);
        }

        private void frmResetPassword_Load(object sender, EventArgs e)
        {
            passTxt.Focus();

        }

        private void button1_Click(object sender, EventArgs e)
        {
            User user = Session.GetInstance.user;
            if ((Crypto.HashSha256(passTxt.Text) == user?.Password) && (npass2Txt.Text.Equals(npassTxt.Text)))
            {
                try
                {
                    userService.ChangePassword(passTxt.Text, npassTxt.Text, user);
                    MessageBox.Show("Actualización exitosa");
                    this.Close();
                } 
                catch
                {
                    CleanForm();
                    MessageBox.Show("Ocurrio un error por favor reintente");
                }
                
            }
            else
            {
                CleanForm();
                MessageBox.Show("Por favor reintente");
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void CleanForm()
        {
            npass2Txt.Clear();
            npassTxt.Clear();
            passTxt.Clear();
        }
    }
}
