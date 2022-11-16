using BitacoraLib.entities;
using BitacoraLib.services;
using Business;
using System;
using System.Windows.Forms;

namespace View
{
    public partial class frmLogin : Form
    {
        SessionService sessionService;
        Boolean dbcheck;

        public frmLogin( Boolean dbcheck = false )
        {
            InitializeComponent();
            this.sessionService = new SessionService();
            this.dbcheck = dbcheck;

        }
        private void button2_Click( object sender, EventArgs e )
        {
            Close();
        }
        private void button1_Click( object sender, EventArgs e )
        {

            try
            {
                if ( dbcheck )
                {
                    sessionService.LoginWithDBProblem(textBox1.Text, textBox2.Text);
                }
                else
                {
                    sessionService.Login(textBox1.Text, textBox2.Text);
                    BitacoraService.register(PriorityEnum.Low, "Start up");
                }
                new frmMain(this).Show();
                clearForm();
                Hide();
            }
            catch ( Exception ex )
            {
                clearForm();
                MessageBox.Show(ex.Message);
            }

        }
        private void clearForm()
        {
            textBox1.Clear();
            textBox2.Clear();
            textBox1.Focus();
        }
        private void frmLogin_Load( object sender, EventArgs e )
        {

            Icon = Properties.Resources.icongray_icono_7282;
            clearForm();
        }
        private void button2_Click_1( object sender, EventArgs e )
        {
            Application.Exit();
        }

        private void frmLogin_FormClosed( object sender, FormClosedEventArgs e )
        {
            Application.Exit();
        }
    }
}
