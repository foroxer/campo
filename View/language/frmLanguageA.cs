using Business;
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
using Utiles;

namespace View.language
{
    public partial class frmLanguageA : Form, ILanguageObserber
    {
        LanguageService languageService;
        public frmLanguageA()
        {
            InitializeComponent();
            languageService = new LanguageService();
        }

        public void updateLanguage(Language language)
        {
            Translator.translate(this);
        }

        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                languageService.Create(textBox1.GetStringMinLength(5));
                (this.MdiParent as frmMain).loadLanguages();
                this.Close();
            }
            catch (Exception)
            {
                MessageBox.Show("ocurrio un error al crear el nuevo idioma");
            }

        }
    }
}
