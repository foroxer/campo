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
            Translator.translate(this, language);
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (!textBox1.Text.RemoveWhitespaces().IsNullOrEmpty())
            {
                try
                {
                    languageService.Create(textBox1.Text);
                    this.Close();
                }
                catch (Exception)
                {
                    MessageBox.Show("ocurrio un error al crear el nuevo idioma");
                    throw;
                }
               
            }
            else
            MessageBox.Show("el nombre no puede estar vacio");
        }
    }
}
