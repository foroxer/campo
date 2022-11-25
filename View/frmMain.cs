using Business;
using Models;
using Models.interfaces;
using Models.language;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows.Forms;
using View.logbook;
using View.business;
using View.language;
using View.changeControl;
using View.dbmanage;
using View.reports;

namespace View
{
    public partial class frmMain : Form, ILanguageObserber
    {
        Form loginForm;

        SessionService sesionService;
        LanguageService languageService;
        Boolean withoutDB;
        public frmMain(Form parent, Boolean withoutDB = false )
        {
            
            InitializeComponent();

            this.withoutDB = withoutDB;
            loginForm = parent;
            sesionService = new SessionService();
            languageService = new LanguageService();
            if ( !withoutDB )
            {
                Session.GetInstance.addObserber(this);
                loadLanguages();
            }
            ValidarPermisos();
        }
        private void frmMain_Load(object sender, EventArgs e)
        {
            Icon = Properties.Resources.icongray_icono_7282;

            if(!withoutDB) updateLanguage(Session.GetInstance.language);
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
                configidioma.Enabled = Session.GetInstance.IsInRole(PermissionsEnum.ConfigIdioma);
                mnuPatentesFamilias.Enabled = Session.GetInstance.IsInRole(PermissionsEnum.PatentesFamilias);
                mnuUsuarioPatentes.Enabled = Session.GetInstance.IsInRole(PermissionsEnum.PatentesUsuarios);
                rutinas.Enabled = Session.GetInstance.IsInRole(PermissionsEnum.VerRutina);
                usuariosToolStripMenuItem.Enabled = Session.GetInstance.IsInRole(PermissionsEnum.Usuarios);
                configurarToolStripMenuItem.Enabled = Session.GetInstance.IsInRole(PermissionsEnum.ConfigurarEjercicios);
                asignarToolStripMenuItem.Enabled = Session.GetInstance.IsInRole(PermissionsEnum.AsignarEjercicios);
                restoreToolStripMenuItem.Enabled = Session.GetInstance.IsInRole(PermissionsEnum.Restore);
                backUpToolStripMenuItem.Enabled = Session.GetInstance.IsInRole(PermissionsEnum.Backup);
                dVRestoreToolStripMenuItem.Enabled = Session.GetInstance.IsInRole(PermissionsEnum.DVRecalc);
                controlDeCambiosToolStripMenuItem.Enabled = Session.GetInstance.IsInRole(PermissionsEnum.ChangesControl);
                bitacoraToolStripMenuItem.Enabled = Session.GetInstance.IsInRole(PermissionsEnum.Bitacora);


                if (Session.GetInstance.IsInRole(PermissionsEnum.VerRutina))
                {
                    rutinas.Enabled = true;
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
                //TODO todos los forms deberian ser ILanguageObserber
                //excepto los de restore y recalc digitos 
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

        private void bitacoraToolStripMenuItem_Click(object sender, EventArgs e)
        {
            createForm(typeof(frmLogbook));
        }

        private void controlDeCambiosToolStripMenuItem_Click( object sender, EventArgs e )
        {
            createForm(typeof(frmUserChangeControl));
        }

        private void backUpToolStripMenuItem_Click( object sender, EventArgs e )
        {
            createForm(typeof(frmBackup));
        }

        private void restoreToolStripMenuItem_Click( object sender, EventArgs e )
        {
            createForm(typeof(frmRestore));
        }

        private void dVRestoreToolStripMenuItem_Click( object sender, EventArgs e )
        {
            createForm(typeof(frmDV));
        }

        private void bitacoraToolStripMenuItem1_Click( object sender, EventArgs e )
        {
            createForm(typeof(frmReportViewer));
        }
    }
}
