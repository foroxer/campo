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
    public partial class frmUsuariosM : Form, ILanguageObserber
    {

        private UserService userService;
        private User selected;
        public frmUsuariosM()
        {
            InitializeComponent();
            userService = new UserService();

            bloquearBtn.Visible = false;
            desbloquearBtn.Visible = false;
            blockedLabel.ForeColor = Color.Red;
            blockedLabel.Visible = false;
        }


        private void updateBtn_Click(object sender, EventArgs e)
        {
            try
            {
                selected.Nic = NICUpdate.GetStringMinLength(4);
                selected.Name = NameUpdate.GetStringMinLength(2);
                selected.LastName = LNameUpdate.GetStringMinLength(2);
                selected.Dni = DNIUpdate.GetInt().ToString();
                selected.Phone = PhoneUpdate.GetInt().ToString();
                selected.Mail = MailUpdate.GetMail();
                selected.Adress = AdressUpdate.GetStringMinLength(4);

                userService.UpdateUser(selected);

                MessageBox.Show("El user se actualizo con exito");
            }
            catch (Exception)
            {
                MessageBox.Show($"ocurrio un error al intentar actualizar el user {selected.Nic}");
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
            Translator.translate(this);
        }
        private void frmMUsuarios_FormClosed(object sender, FormClosedEventArgs e)
        {
        }
        private void bloquearBtn_Click(object sender, EventArgs e)
        {
            //int index = cboUsuarios.SelectedIndex;
            try
            {
                userService.BlockUser(selected);
                cboUsuarios.DataSource = userService.GetAll();
            }
            catch
            {
                MessageBox.Show($"Ocurrio un error al intentar bloquear el user {selected.Nic}");
            }
            //cboUsuarios.SelectedIndex = index;
            Close();

        }
        private void desbloquearBtn_Click(object sender, EventArgs e)
        {
            //int index = cboUsuarios.SelectedIndex;
            try
            {
                userService.UnblockUser(selected);
                userService.ResetTries(selected);
                cboUsuarios.DataSource = userService.GetAll();
            }
            catch
            {
                MessageBox.Show($"Ocurrio un error al intentar desbloquear el user {selected.Nic}");
            }
            //cboUsuarios.SelectedIndex = index;
            Close();
        }
        private void cboUsuarios_SelectedIndexChanged(object sender, EventArgs e)
        {
            selected = (User)cboUsuarios.SelectedItem;
            loadFields(selected);
        }
        public void setUser(User user)
        {
            if (user != null)
            {
                cboUsuarios.Text = "";
                cboUsuarios.Enabled = false;
                selected = user;
                loadFields(user);
            }
        }
        private void loadFields(User user)
        {
            LNameUpdate.Text = user.LastName;
            NameUpdate.Text = user.Name;
            AdressUpdate.Text = user.Adress;
            MailUpdate.Text = user.Mail;
            NICUpdate.Text = user.Nic;
            PhoneUpdate.Text = user.Phone;
            DNIUpdate.Text = user.Dni;

            desbloquearBtn.Visible = user.Blocked || user.Tries > SessionService.REINTENTOS_MAXIMOS_LOGIN;
            bloquearBtn.Visible = !user.Blocked;
            blockedLabel.Visible = user.Blocked;
            updateBtn.Focus();
        }
    }
}
