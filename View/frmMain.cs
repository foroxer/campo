using Business;
using Models;
using Models.interfaces;
using Models.language;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows.Forms;
using View.business;
using View.language;

namespace View
{
    public partial class frmMain : Form, ILanguageObserber
    {
        Form loginForm;

        SessionService sesionService;
        LanguageService languageService;

        public frmMain(Form parent)
        {
            InitializeComponent();

            loginForm = parent;
            sesionService = new SessionService();
            languageService = new LanguageService();
            Session.GetInstance.addObserber(this);
            loadLanguages();

            ValidarPermisos();
        }
        private void frmMain_Load(object sender, EventArgs e)
        {
            Icon = Properties.Resources.icongray_icono_7282;
            updateLanguage(Session.GetInstance.language);
        }
        private void languageChange_click(object sender, EventArgs e)
        {
            Language language = (Language)((ToolStripMenuItem)sender).Tag;
            Session.GetInstance.language = languageService.GetLanguage(language.Name);

            lblUsuario.Text = language.Name;

        }
        private void ValidarPermisos()
        {
            if (Session.GetInstance.IsLoggedIn())
            {
                configidioma.Visible = Session.GetInstance.IsInRole(PermissionsEnum.ConfigIdioma);
                mnuPatentesFamilias.Visible = Session.GetInstance.IsInRole(PermissionsEnum.PatentesFamilias);
                mnuUsuarioPatentes.Visible = Session.GetInstance.IsInRole(PermissionsEnum.PatentesUsuarios);
                rutinas.Visible = Session.GetInstance.IsInRole(PermissionsEnum.VerRutina);

                if (Session.GetInstance.IsInRole(PermissionsEnum.VerRutina))
                {
                    rutinas.Visible = true;
                    createForm(typeof(frmExercisesVisualization));
                }
            }
        }
        public void loadLanguages()
        {
            mnuSelectIdioma.DropDownItems.Clear();
            List<Language> languages = languageService.GetLanguagesForCombo();
            foreach (Language item in languages)
            {
                ToolStripMenuItem t = new ToolStripMenuItem(item.Name);
                t.Tag = item;
                t.Click += languageChange_click;
                mnuSelectIdioma.DropDownItems.Add(t);
            }
        }
        private void mnuPatentesFamilias_Click(object sender, EventArgs e)
        {
            createForm(typeof(frmPatentesFamilias));
        }
        private void mnuUsuarioPatentes_Click(object sender, EventArgs e)
        {
            createForm(typeof(frmUsuariosPatentes));
        }
        private void frmMain_FormClosed(object sender, FormClosedEventArgs e)
        {
            Session.GetInstance.removeObserber(this);
            foreach (Form form in MdiChildren)
            {
                if (typeof(ILanguageObserber).IsAssignableFrom(form.GetType()))
                {
                    Session.GetInstance.removeObserber((ILanguageObserber)form);
                }
            }
            loginForm.Show();
            sesionService.Logout();
        }
        public Form createForm(Type formType)
        {
            foreach (Form mdiChild in (MdiChildren.ToList()))
            {
                if (mdiChild.GetType().Equals(formType))
                {
                    mdiChild.Focus();
                    return mdiChild;
                }
            }

            Form form = (Form)Activator.CreateInstance(formType);
            if (typeof(ILanguageObserber).IsAssignableFrom(form.GetType()))
            {
                Session.GetInstance.addObserber((ILanguageObserber)form);
            }
            form.MdiParent = this;
            form.Icon = Properties.Resources.icongray_icono_7282;
            form.Show();
            return form;
        }
        public void updateLanguage(Language language)
        {
            Translator.translate(this);
        }


        private void altaUsuario_Click(object sender, EventArgs e)
        {
            createForm(typeof(frmUsuariosA));
        }

        private void modificacionUsuario_Click(object sender, EventArgs e)
        {
            createForm(typeof(frmUsuariosM));
        }

        private void rutinas_Click(object sender, EventArgs e)
        {
            createForm(typeof(frmExercisesVisualization));
        }

        private void listaToolStripMenuItem_Click(object sender, EventArgs e)
        {
            createForm(typeof(frmUsuariosL));
        }



        private void idiomaToolStripMenuItem_Click(object sender, EventArgs e)
        {
            createForm(typeof(frmLanguageL));
        }

        private void changePasswordToolStripMenuItem_Click(object sender, EventArgs e)
        {
            createForm(typeof(frmResetPassword));
        }

        private void logOutToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void ejerciciosToolStripMenuItem_Click(object sender, EventArgs e)
        {
            createForm(typeof(frmExerciseAML));
        }

        private void aparatosToolStripMenuItem_Click(object sender, EventArgs e)
        {
            createForm(typeof(frmMachineTypes));
        }

        private void gruposMuscularesToolStripMenuItem_Click(object sender, EventArgs e)
        {
            createForm(typeof(frmMuscularGroupTypes));
        }

        private void asignarToolStripMenuItem_Click(object sender, EventArgs e)
        {
            createForm(typeof(frmExersiceAssign));
        }
    }
}
