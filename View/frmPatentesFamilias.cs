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
using Models.interfaces;
using Models.language;

namespace View
{
    public partial class frmPatentesFamilias : Form, ILanguageObserber
    {
        PermissionsService permissionsService;
        Family seleccion;
        public frmPatentesFamilias()
        {
            InitializeComponent();
            Session.GetInstance.addObserber(this);
            permissionsService = new PermissionsService();
            this.cboPermisos.DataSource = permissionsService.GetAllPermission();

        }   
        private void LlenarPatentesFamilias()
        {
          
            this.cboPatentes.DataSource = permissionsService.GetAllPatentes();
            this.cboPatentes.DisplayMember = "nombre";
            this.cboFamilias.DataSource = permissionsService.GetAllFamilies();
            cboFamilias2.DataSource = permissionsService.GetAllFamilies().FindAll(familia => familia.Id != ((Family)cboFamilias.SelectedItem).Id);
        }
        private void FrmSeguridad_Load(object sender, EventArgs e)
        {
            updateLanguage(Session.GetInstance.language);
            LlenarPatentesFamilias();
        }
        private void BtnGuardarPatente_Click(object sender, EventArgs e)
        {
            Patent p = new Patent()
            {
                Nombre = this.txtNombrePatente.Text,
                Permiso = (PermissionsEnum)this.cboPermisos.SelectedItem
            };

            permissionsService.SaveComponent(p,false);
            LlenarPatentesFamilias();

            MessageBox.Show("Patent guardada correctamente");
        }
        private void Button1_Click(object sender, EventArgs e)
        {
            Family p = new Family()
            {
                Nombre = this.txtNombreFamilia.Text

            };
            permissionsService.SaveComponent(p,true);
            LlenarPatentesFamilias();
            MessageBox.Show("Family guardada correctamente");
        }    
        void MostrarFamilia(bool init)
        {
            if (seleccion == null) return;


            IList<Component> flia = null;
            if (init)
            {
                flia = permissionsService.GetAll("=" + seleccion.Id);
             

                foreach(Component i in flia)
                  seleccion.AddChild(i);
            }
            else
            {
                flia = seleccion.Childs;
            }

            this.treeConfigurarFamilia.Nodes.Clear();

            TreeNode root = new TreeNode(seleccion.Nombre);
            root.Tag = seleccion;
            this.treeConfigurarFamilia.Nodes.Add(root);

            foreach (Component item in flia)
            {
                MostrarEnTreeView(root, item);
            }

            treeConfigurarFamilia.ExpandAll();
        }
        void MostrarEnTreeView(TreeNode tn, Models.Component component)
        {
            TreeNode node = new TreeNode(component.Nombre);
            tn.Tag = component;
            tn.Nodes.Add(node);
            if (component.Childs!=null)
                foreach (Component item in component.Childs)
                {
                    MostrarEnTreeView(node, item);
                }

        }
        private void CmdAgregarPatente_Click(object sender, EventArgs e)
        {
            if (seleccion != null)
            {
                var patente =(Patent) cboPatentes.SelectedItem;
                if (patente != null)
                {
                    var esta = permissionsService.Contains(seleccion,patente);
                    if (esta)
                        MessageBox.Show("ya exsite la patente indicada");
                    else
                    {
                            seleccion.AddChild(patente);
                            MostrarFamilia(false);
                    }
                }
            }
        }
        private void CmdSeleccionar_Click(object sender, EventArgs e)
        {
            var tmp = (Family)this.cboFamilias.SelectedItem;
            seleccion = new Family();
            seleccion.Id = tmp.Id;
            seleccion.Nombre = tmp.Nombre;
           
            MostrarFamilia(true);
        }
        private void CmdAgregarFamilia_Click(object sender, EventArgs e)
        {
            if (seleccion != null)
            {
                Family familia = (Family)cboFamilias2.SelectedItem;
                if (familia != null)
                {
                    if (permissionsService.Contains(seleccion, familia))
                        MessageBox.Show("ya exsite la familia indicada");
                    else
                    {
                        permissionsService.FillFamilyComponents(familia);
                        seleccion.AddChild(familia);
                        MostrarFamilia(false);
                    }
                }
            }
        }
        private void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                permissionsService.SaveFamily(seleccion);
                MessageBox.Show("Family guardada correctamente");
            }
            catch (Exception)
            {
                MessageBox.Show("Error al guardar la familia");
            }
        }
        private void cboFamilias_SelectedIndexChanged(object sender, EventArgs e)
        {
            cboFamilias2.DataSource = permissionsService.GetAllFamilies().FindAll(familia => familia.Id != ((Family)cboFamilias.SelectedItem).Id);
            Family tmp = (Family)this.cboFamilias.SelectedItem;
            seleccion = new Family();
            seleccion.Id = tmp.Id;
            seleccion.Nombre = tmp.Nombre;

            MostrarFamilia(true);
        }
        private void eliminarPatenteBtn_Click(object sender, EventArgs e)
        {
            if (seleccion != null)
            {
                Patent patente = (Patent)cboPatentes.SelectedItem;
                if (patente != null)
                {
                    if (permissionsService.Contains(seleccion, patente))
                    {
                        seleccion.RemoveChild(seleccion.Childs.Find(item => patente.Id == item.Id));
                        MostrarFamilia(false);
                    }
                }
            }
        }
        private void eliminarFamiliaBtn_Click(object sender, EventArgs e)
        {
            if (seleccion != null)
            {
                Family familia = (Family)cboFamilias2.SelectedItem;
                if (familia != null)
                {
                    if (permissionsService.Contains(seleccion, familia))
                    {
                        seleccion.RemoveChild(seleccion.Childs.Find(item => familia.Id == item.Id));
                        MostrarFamilia(false);
                    }
                }
            }
        }
        private void cboPatentes_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (this.cboPatentes.SelectedItem != null)
            {
                Patent patent = (Patent)this.cboPatentes.SelectedItem;
                TxtDescription.Text = patent.Description;
            }
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
        public void updateLanguageRecursiveControls(Language language, Control.ControlCollection parent)
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
    }
}
