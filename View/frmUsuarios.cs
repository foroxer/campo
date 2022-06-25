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


        void LlenarTreeView(TreeNode padre, Component c)
        {
            TreeNode hijo = new TreeNode(c.Nombre);
            hijo.Tag = c;
            padre.Nodes.Add(hijo);

            foreach (var item in c.Childs)
            {
                LlenarTreeView(hijo, item);
            }

        }

        void MostrarPermisos(User u)
        {
            this.treeView1.Nodes.Clear();
            TreeNode root = new TreeNode(u.Name);

            foreach (var item in u.Permissions)
            {
                LlenarTreeView(root, item);
            }   

            this.treeView1.Nodes.Add(root);
            this.treeView1.ExpandAll();
        }

        private void CmdConfigurar_Click(object sender, EventArgs e)
        {

            guardarPermisosBtn.Enabled = true;
            resetPasswordBtn.Enabled = true;


            /*user = new User();
            user.Id = ((User)this.cboUsuarios.SelectedItem).Id;
            user.Name = ((User)this.cboUsuarios.SelectedItem).Name;
            user.Password = ((User)this.cboUsuarios.SelectedItem).Password;*/

            user = ((User)this.cboUsuarios.SelectedItem);
            permissionsService.FillUserComponents(user);

            MostrarPermisos(user);

            this.cboFamilias.DataSource = permissionsService.GetAllFamilies();
            this.cboPatentes.DataSource = permissionsService.GetAllPatentes();
        }

        private void AgregarPatente_Click(object sender, EventArgs e)
        {
            if (user != null)
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
            else
                MessageBox.Show("Seleccione un usuario");
        }

        private void AgregarFamilia_Click(object sender, EventArgs e)
        {
            if (user != null)
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
            }
            else
            {
                MessageBox.Show("Seleccione un usuario");
            }
                
        }

        private void CmdGuardarFamilia_Click(object sender, EventArgs e)
        {
            if (user == null)
            {
                MessageBox.Show("Seleccione un usuario");
                return;
            }

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

        private void frmUsuarios_Load(object sender, EventArgs e)
        {
            userService = new UserService();
            permissionsService = new PermissionsService();
            this.cboUsuarios.DataSource = userService.GetAll();

            eliminarFamiliaBtn.Enabled = false;
            agregarFamiliaBtn.Enabled = false;
            eliminarPatenteBtn.Enabled = false;
            agregarPatenteBtn.Enabled = false;

            guardarPermisosBtn.Enabled = false;
            resetPasswordBtn.Enabled = false;
        }

        private void cboPatentes_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (user != null)
            {
                Patent patente = (Patent)cboPatentes.SelectedItem;
                if (patente != null)
                {
                   
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
            }
        }

        private void cboFamilias_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (user != null)
            {
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
            }
        }

        private void eliminarPatenteBtn_Click(object sender, EventArgs e)
        {
            if (user != null)
            {
                Patent patent = (Patent)cboPatentes.SelectedItem;
                if (patent != null)
                {
                    if (user.Permissions.Where(permission => (permissionsService.Contains(permission, patent))).ToList().Count() > 0)
                    {
                        user.Permissions.Remove(patent);
                        MostrarPermisos(user);
                    }
                }
            }
            else
                MessageBox.Show("Seleccione un usuario");
        }

        private void eliminarFamiliaBtn_Click(object sender, EventArgs e)
        {
            if (user != null)
            {
                Family family = (Family)cboFamilias.SelectedItem;
                if (family != null)
                { 
                    user.Permissions.Remove(user.Permissions.Where(component => family.Id == component.Id).FirstOrDefault());
                    MostrarPermisos(user);
                }
            }
        }

        private void resetPasswordBtn_Click(object sender, EventArgs e)
        {
            userService.ResetPassword(user);
        }
    }
}
