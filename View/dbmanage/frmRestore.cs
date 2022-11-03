using Business;
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
    public partial class frmRestore : Form
    {
        BackupService backupService;
        String usersFilePath = null;


        public frmRestore()
        {
            InitializeComponent();
            backupService = new BackupService();
        }

        private void button3_Click( object sender, EventArgs e )
        {
            DialogResult result = MessageBox.Show("Desea continuar?", "", MessageBoxButtons.OKCancel);
            if ( !result.Equals(DialogResult.OK) )
            {
                return;
            }

            if ( String.IsNullOrEmpty(this.usersFilePath) )
            {
                MessageBox.Show("Por favor complete los campos");
                return;
            }
            else
            {

                try
                {
                    backupService.realizarRestore(usersFilePath);
                    MessageBox.Show("Completado");
                }
                catch ( Exception ex )
                {
                    MessageBox.Show(ex.Message);
                }
            }
        }

        private void button1_Click( object sender, EventArgs e )
        {
            OpenFileDialog dialog = new OpenFileDialog();
            dialog.Filter = "BackupFiles|*.bak";

            DialogResult result = dialog.ShowDialog();
            if ( result == DialogResult.OK )
            {
                usersFilePath = dialog.FileName;
                this.textBox1.Text = usersFilePath;
            }
        }

        private void Restaurar_Backup_Load( object sender, EventArgs e )
        {
            this.MaximizeBox = false;
            this.StartPosition = FormStartPosition.CenterScreen;
            this.FormBorderStyle = FormBorderStyle.Fixed3D;
            this.textBox1.ReadOnly = true;
        }

        private void button2_Click( object sender, EventArgs e )
        {
            this.Close();
        }
    }
}

