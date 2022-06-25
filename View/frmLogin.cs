﻿using System;
using System.Threading;
using System.Windows.Forms;
using Business;

namespace View
{
    public partial class frmLogin : Form
    {
        SessionService sessionService;

        public frmLogin()
        {
            InitializeComponent();
            sessionService = new SessionService();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                sessionService.Login(textBox1.Text, textBox2.Text);
                new frmMain(this).Show();
                clearForm();
                this.Hide();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);

            }
        }


        private void clearForm()
        {
            textBox1.Clear();
            textBox2.Clear();
            textBox1.Focus();
        }

        private void frmLogin_Load(object sender, EventArgs e)
        {
            clearForm();
        }

        private void button2_Click_1(object sender, EventArgs e)
        {
            Application.Exit();
        }
    }
}
