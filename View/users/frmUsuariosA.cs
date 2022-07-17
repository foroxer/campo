using Models.language;
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
    public partial class frmUsuariosA : Form, ILanguageObserber
    {
        UserService userService;

        public frmUsuariosA()
        {
            InitializeComponent();
            userService = new UserService();
        }
        private void frmAMUsuarios_Load(object sender, EventArgs e)
        {
            updateLanguage(Session.GetInstance.language);
        }
        private void frmAMUsuarios_FormClosed(object sender, FormClosedEventArgs e)
        {
        }
        public void updateLanguage(Language language)
        {
            Translator.translate(this);
        }
        private void createBtn_Click(object sender, EventArgs e)
        {
            try
            {
                User user = new User
                {
                    Nic = NICCreation.GetStringMinLength(4),
                    Name = NameCreation.GetStringMinLength(2),
                    LastName = LNameCreation.GetStringMinLength(2),
                    Dni = DNICreation.GetInt().ToString(),
                    Phone = PhoneCreation.GetInt().ToString(),
                    Mail = MailCreation.GetMail(),
                    Adress = AdressCreation.GetStringMinLength(4),
                };


                userService.CreateUser(user);
                cleanCreationControls();

                MessageBox.Show("El usuario se creo con exito");
                Close();
            }
            catch (Exception)
            {
                MessageBox.Show("ocurrio un error al intentar crear el usuario");
            }
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
