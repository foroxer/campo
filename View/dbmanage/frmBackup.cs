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

namespace View.dbmanage
{
    public partial class frmBackup : Form , ILanguageObserber
    {
        private BackupService backupService;

        public frmBackup()
        {
            this.backupService = new BackupService();
            InitializeComponent();
            int[] ints = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
            this.partesCB.DataSource = ints;

        }

        private void btnExaminar_Click( object sender, EventArgs e )
        {
            FolderBrowserDialog dialog = new FolderBrowserDialog();
            DialogResult resultado = dialog.ShowDialog();
            if ( resultado == DialogResult.OK && !string.IsNullOrWhiteSpace(dialog.SelectedPath) )
            {
                this.pathtxt.Text = dialog.SelectedPath;
            }
        }

        private void btnRespaldar_Click( object sender, EventArgs e )
        {
            DialogResult result = MessageBox.Show("Desea Continuar", "", MessageBoxButtons.OKCancel);
            if ( !result.Equals(DialogResult.OK) )
            {
                return;
            }

            if ( String.IsNullOrEmpty(this.pathtxt.Text) )
            {
                MessageBox.Show("Por favor complete los campos");
                return;
            }
            else
            {
                String path = this.pathtxt.Text;
                try
                {
                    backupService.realizarBackup((int)this.partesCB.SelectedItem, path);
                    MessageBox.Show("Completado");
                }
                catch ( Exception ex )
                {
                    MessageBox.Show(ex.Message);
                }

            }


        }

        private void btnCancelar_Click( object sender, EventArgs e )
        {
            this.Close();
        }

        private void backup_Load( object sender, EventArgs e )
        {
            this.MaximizeBox = false;
            this.StartPosition = FormStartPosition.CenterScreen;
            this.FormBorderStyle = FormBorderStyle.Fixed3D;
            updateLanguage(null);
        }

        public void updateLanguage( Language language )
        {
            Translator.translate(this);
        }
    }
}
