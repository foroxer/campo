using Models;
using Business;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace View
{
    public partial class frmUsuarios : Form
    {
        private UserService userService;
        private PermissionsService permissionsService;
        private User user;

        public frmUsuarios()
        {
            InitializeComponent();
        }
        private void frmUsuarios_Load(object sender, EventArgs e)
        {
            userService = new UserService();
            permissionsService = new PermissionsService();
            this.cboUsuarios.DataSource = userService.GetAll();

            this.cboFamilias.DataSource = permissionsService.GetAllFamilies();
            this.cboPatentes.DataSource = permissionsService.GetAllPatentes();

            eliminarFamiliaBtn.Enabled = false;
            agregarFamiliaBtn.Enabled = false;
            eliminarPatenteBtn.Enabled = false;
            agregarPatenteBtn.Enabled = false;

            guardarPermisosBtn.Enabled = false;
            resetPasswordBtn.Enabled = false;
            validateButtons();
        }
        private void LlenarTreeView(TreeNode padre, Component componente)
        {
            TreeNode hijo = new TreeNode(componente.Nombre);
            hijo.Tag = componente;
            padre.Nodes.Add(hijo);

            foreach (var item in componente.Childs)
            {
                LlenarTreeView(hijo, item);
            }

        }
        private void MostrarPermisos(User userToShow)
        {
            this.treeView1.Nodes.Clear();
            TreeNode root = new TreeNode(userToShow.Name);

            foreach (var item in userToShow.Permissions)
            {
                LlenarTreeView(root, item);
            }   

            this.treeView1.Nodes.Add(root);
            this.treeView1.ExpandAll();
        }
        private void AgregarPatente_Click(object sender, EventArgs e)
        {
                var patente = (Patent)cboPatentes.SelectedItem;
                if (patente != null)
                {
                    if (user.Permissions.Where(permission => (permissionsService.Contains(permission, patente))).ToList().Count() > 0)
                        MessageBox.Show("El usuario ya tiene la patente indicada");
                    else
                    {
                        
                    user.Permissions.Add(patente);
                    MostrarPermisos(user);
                        
                    }
                }
        }
        private void AgregarFamilia_Click(object sender, EventArgs e)
        {
            Family family = (Family)cboFamilias.SelectedItem;
            if (family != null)
            {
                   
                if (user.Permissions.Where(permission => (permissionsService.Contains(permission, family))).ToList().Count() > 0)
                    MessageBox.Show("El usuario ya tiene la familia indicada");
                else
                {
                    permissionsService.FillFamilyComponents(family);
                    user.Permissions.Add(family);
                    MostrarPermisos(user);
                }
            }
            validateButtons();
        }
        private void CmdGuardarFamilia_Click(object sender, EventArgs e)
        {
            try
            {
                userService.SavePermissions(user);
                MessageBox.Show("User guardado correctamente");
            }
            catch (Exception)
            {
                MessageBox.Show("Error al guardar el usuario");
            }
        }
        private void cboPatentes_SelectedIndexChanged(object sender, EventArgs e)
        {
            validateButtons();
        }
        private void cboFamilias_SelectedIndexChanged(object sender, EventArgs e)
        {
            validateButtons();
        }
        private void eliminarPatenteBtn_Click(object sender, EventArgs e)
        {
            Patent patent = (Patent)cboPatentes.SelectedItem;
            if (patent != null)
            {
                user.Permissions.Remove(user.Permissions.Where(permission => (permissionsService.Contains(permission, patent))).First());
                MostrarPermisos(user);
            }
            validateButtons();
        }
        private void eliminarFamiliaBtn_Click(object sender, EventArgs e)
        {
            Family family = (Family)cboFamilias.SelectedItem;
            if (family != null)
            { 
                user.Permissions.Remove(user.Permissions.Where(component => family.Id == component.Id).First());
                MostrarPermisos(user);
            }
            validateButtons();
        }
        private void resetPasswordBtn_Click(object sender, EventArgs e)
        {
            try
            {
                if (MessageBox.Show($"Esta seguro que desea resetear la pasword del usuario {user.Name}","", MessageBoxButtons.OKCancel) == DialogResult.OK)
                {
                    userService.ResetPassword(user);
                    MessageBox.Show("Password Actualizada");
                }
            }
            catch
            {
                MessageBox.Show($"Ocurrio un error reseteando la pasword del usuario {user.Name}");
            }
        }
        private void validateButtons()
        {
            if (user != null)
            {
                guardarPermisosBtn.Enabled = true;
                resetPasswordBtn.Enabled = true;
                #region validate familia
                Family family = (Family)cboFamilias.SelectedItem;
                if (family != null)
                {

                    if (user.Permissions.Where(permission => (permissionsService.Contains(permission, family))).ToList().Count() > 0)
                    {
                        eliminarFamiliaBtn.Enabled = true;
                        agregarFamiliaBtn.Enabled = false;
                    }
                    else
                    {
                        eliminarFamiliaBtn.Enabled = false;
                        agregarFamiliaBtn.Enabled = true;
                    }
                }
                #endregion
                #region validar patentes
                Patent patente = (Patent)cboPatentes.SelectedItem;
                if (patente != null)
                {
                    tooltip.SetToolTip(cboPatentes, patente.Description);
                    if (user.Permissions.Where(permission => (permissionsService.Contains(permission, patente))).ToList().Count() > 0)
                    {
                        eliminarPatenteBtn.Enabled = true;
                        agregarPatenteBtn.Enabled = false;
                    }
                    else
                    {
                        eliminarPatenteBtn.Enabled = false;
                        agregarPatenteBtn.Enabled = true;
                    }
                }
                #endregion
            }
        }
        private void cboUsuarios_SelectedIndexChanged(object sender, EventArgs e)
        { 
            user = ((User)this.cboUsuarios.SelectedItem);
            permissionsService.FillUserComponents(user);

            MostrarPermisos(user);

        }
    }
}
