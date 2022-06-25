using Models;
using Business;
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
using Models.language;

namespace View
{
    public partial class frmMain : Form,ILanguageObserber
    {
        Form loginForm;

        SessionService sesionService;
        UserService userService;
        LanguageService languageService;

        public frmMain(Form parent)
        {
            InitializeComponent();

            loginForm = parent;
            sesionService = new SessionService();
            languageService = new LanguageService();
            userService = new UserService();
            Session.GetInstance.addObserber(this);
            loadLanguages();

            ValidarPermisos();
        }
        private void languageChange_click(object sender, EventArgs e)
        {
            Language language =(Language)((ToolStripMenuItem)sender).Tag;
            Session.GetInstance.language = languageService.GetLanguage(language.Key);

            this.lblUsuario.Text = language.Name;

        }
        private void ValidarPermisos()
        {
            if (Session.GetInstance.IsLoggedIn())
            {
                mnuPatentesFamilias.Visible = Session.GetInstance.IsInRole(PermissionsEnum.PatentesFamilias);
                mnuUsuarioPatentes.Visible = Session.GetInstance.IsInRole(PermissionsEnum.PatentesUsuarios);
                mnuConfig.Visible = Session.GetInstance.IsInRole(PermissionsEnum.MenuConfig);
            }
        }
        private void loadLanguages()
        {
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
            createForm(typeof(frmUsuarios));
        }
        private void frmMain_Load(object sender, EventArgs e)
        {
            updateLanguage(Session.GetInstance.language);
        }
        private void frmMain_FormClosed(object sender, FormClosedEventArgs e)
        {
            Session.GetInstance.removeObserber(this); 
            loginForm.Show();
            sesionService.Logout();
        }
        private void createForm(Type formType)
        {
            foreach (Form f in (this.MdiChildren.ToList()))
            {
                if (f.GetType().Equals(formType))
                {
                    f.Focus();
                    return;
                }
            }

            Form frm = (Form) Activator.CreateInstance(formType);
            frm.MdiParent = this;
            frm.Show();
        }
        public void updateLanguage(Language language )
        {
           foreach(Control control in Controls)
           {
                control.Text = language.Translations.Find(
                        (translation) => translation.Key.Equals(control.Tag)
                    )?.Translate ?? control.Text;
                if (control.GetType().Equals(typeof(MenuStrip)) && ((MenuStrip)control).Items.Count != 0 )
                {
                    updateToolStrip(language, ((MenuStrip)control).Items);
                }
           }
        }
        private void updateToolStrip(Language language, ToolStripItemCollection parent)
        {
            foreach (ToolStripMenuItem control in parent)
            {
                control.Text = language.Translations.Find(
                        (translation) => translation.Key.Equals(control.Tag)
                    )?.Translate ?? control.Text;

                if (control.DropDownItems.Count != 0)
                {
                    updateToolStrip(language, control.DropDownItems);
                }
            }
        }
    }
} 
