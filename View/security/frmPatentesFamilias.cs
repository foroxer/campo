using Business;
using Models;
using Models.interfaces;
using Models.language;
using System;
using System.Collections.Generic;
using System.Windows.Forms;

namespace View
{
    public partial class frmPatentesFamilias : Form, ILanguageObserber
    {
        PermissionsService permissionsService;
        Family seleccion;
        public frmPatentesFamilias()
        {
            InitializeComponent();
            permissionsService = new PermissionsService();
            cboPermisos.DataSource = permissionsService.GetAllPermission();

        }
        private void LlenarPatentesFamilias()
        {

            cboPatentes.DataSource = permissionsService.GetAllPatentes();
            cboPatentes.DisplayMember = "nombre";
            cboFamilias.DataSource = permissionsService.GetAllFamilies();
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
                Nombre = txtNombrePatente.Text,
                Permiso = (PermissionsEnum)cboPermisos.SelectedItem
            };

            permissionsService.SaveComponent(p, false);
            LlenarPatentesFamilias();

            MessageBox.Show("Patent guardada correctamente");
        }
        private void Button1_Click(object sender, EventArgs e)
        {
            try
            {

                Family p = new Family()
                {
                    Nombre = txtNombreFamilia.GetStringMinLength(3)

                };
                permissionsService.SaveComponent(p, true);
                LlenarPatentesFamilias();
                MessageBox.Show("Family guardada correctamente");
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ocurrio un Error " + (ex.Message?? (":"+ex.Message)));
            }
        }
        private void MostrarFamilia(bool init)
        {
            if (seleccion == null) return;


            IList<Component> flia = null;
            if (init)
            {
                flia = permissionsService.GetAll("=" + seleccion.Id);


                foreach (Component i in flia)
                    seleccion.AddChild(i);
            }
            else
            {
                flia = seleccion.Childs;
            }

            treeConfigurarFamilia.Nodes.Clear();

            TreeNode root = new TreeNode(seleccion.Nombre);
            root.Tag = seleccion;
            treeConfigurarFamilia.Nodes.Add(root);

            foreach (Component item in flia)
            {
                MostrarEnTreeView(root, item);
            }

            treeConfigurarFamilia.ExpandAll();
        }
        private void MostrarEnTreeView(TreeNode tn, Models.Component component)
        {
            TreeNode node = new TreeNode(component.Nombre);
            tn.Tag = component;
            tn.Nodes.Add(node);
            if (component.Childs != null)
                foreach (Component item in component.Childs)
                {
                    MostrarEnTreeView(node, item);
                }

        }
        private void CmdAgregarPatente_Click(object sender, EventArgs e)
        {
            if (seleccion != null)
            {
                var patente = (Patent)cboPatentes.SelectedItem;
                if (patente != null)
                {
                    var esta = permissionsService.Contains(seleccion, patente);
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
            var tmp = (Family)cboFamilias.SelectedItem;
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
            Family tmp = (Family)cboFamilias.SelectedItem;
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
            if (cboPatentes.SelectedItem != null)
            {
                Patent patent = (Patent)cboPatentes.SelectedItem;
                TxtDescription.Text = patent.Description;
            }
        }
        private void frmPatentesFamilias_FormClosed(object sender, FormClosedEventArgs e)
        {
        }
        public void updateLanguage(Language language)
        {
            Translator.translate(this, language);
        }
    }
}
