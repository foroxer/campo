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

namespace View
{
    public partial class frmUsuariosM : Form,ILanguageObserber
    {

        UserService userService;
        public frmUsuariosM()
        {
            InitializeComponent();
            userService = new UserService();
            Session.GetInstance.addObserber(this);

            bloquearBtn.Visible = false;
            desbloquearBtn.Visible = false;
            blockedLabel.ForeColor = Color.Red;
            blockedLabel.Visible = false;
        }


        private void updateBtn_Click(object sender, EventArgs e)
        {
            User user = (User)cboUsuarios.SelectedItem;
            user.LastName = LNameUpdate.Text;
            user.Name = NameUpdate.Text;
            user.Adress = AdressUpdate.Text;
            user.Mail = MailUpdate.Text;
            user.Nic = NICUpdate.Text;
            user.Phone = PhoneUpdate.Text;
            user.Dni = DNIUpdate.Text;

            try
            {
                userService.UpdateUser(user);

                MessageBox.Show("El usuario se actualizo con exito");
            }
            catch (Exception)
            {
                MessageBox.Show($"ocurrio un error al intentar actualizar el usuario {user.Nic}");
            }
            Close();
        }

        private void cboUsuarios_SelectionChangeCommitted(object sender, EventArgs e)
        {
            
        }
        private void frmMUsuarios_Load(object sender, EventArgs e)
        {
            cboUsuarios.DataSource = userService.GetAll();
            cboUsuarios.DisplayMember = "nic";
            updateLanguage(Session.GetInstance.language);
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
        private void frmMUsuarios_FormClosed(object sender, FormClosedEventArgs e)
        {
            Session.GetInstance.removeObserber(this);
        }
        private void bloquearBtn_Click(object sender, EventArgs e)
        {
            User user = (User)cboUsuarios.SelectedItem;
            int index = cboUsuarios.SelectedIndex;
            try
            {
                userService.blockUser(user);
                cboUsuarios.DataSource = userService.GetAll();
            }
            catch
            {
                MessageBox.Show($"Ocurrio un error al intentar bloquear el usuario {user.Nic}");
            }
            cboUsuarios.SelectedIndex = index;

        }
        private void desbloquearBtn_Click(object sender, EventArgs e)
        {
            User user = (User)cboUsuarios.SelectedItem;
            int index = cboUsuarios.SelectedIndex;
            try
            {
                userService.unblockUser(user);
                cboUsuarios.DataSource = userService.GetAll();
            }
            catch
            {
                MessageBox.Show($"Ocurrio un error al intentar bloquear el usuario {user.Nic}");
            }
            cboUsuarios.SelectedIndex = index;
        }
        private void cboUsuarios_SelectedIndexChanged(object sender, EventArgs e)
        {
            User user = (User)cboUsuarios.SelectedItem;
            LNameUpdate.Text = user.LastName;
            NameUpdate.Text = user.Name;
            AdressUpdate.Text = user.Adress;
            MailUpdate.Text = user.Mail;
            NICUpdate.Text = user.Nic;
            PhoneUpdate.Text = user.Phone;
            DNIUpdate.Text = user.Dni;

            desbloquearBtn.Visible = user.blocked;
            bloquearBtn.Visible = !user.blocked;
            blockedLabel.Visible = user.blocked;
            updateBtn.Focus();
        }
    }
}
