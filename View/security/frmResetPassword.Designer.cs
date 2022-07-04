namespace View
{
    partial class frmResetPassword
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.passTxt = new System.Windows.Forms.TextBox();
            this.npassTxt = new System.Windows.Forms.TextBox();
            this.npass2Txt = new System.Windows.Forms.TextBox();
            this.button1 = new System.Windows.Forms.Button();
            this.button2 = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.Location = new System.Drawing.Point(28, 25);
            this.label1.Name = "label1";
            this.label1.RightToLeft = System.Windows.Forms.RightToLeft.Yes;
            this.label1.Size = new System.Drawing.Size(100, 23);
            this.label1.TabIndex = 0;
            this.label1.Tag = "contraseña";
            this.label1.Text = "Contraseña";
            // 
            // label2
            // 
            this.label2.Location = new System.Drawing.Point(28, 60);
            this.label2.Name = "label2";
            this.label2.RightToLeft = System.Windows.Forms.RightToLeft.Yes;
            this.label2.Size = new System.Drawing.Size(100, 23);
            this.label2.TabIndex = 1;
            this.label2.Tag = "nuevaContraseña";
            this.label2.Text = "Nueva Contraseña";
            // 
            // label3
            // 
            this.label3.Location = new System.Drawing.Point(28, 99);
            this.label3.Name = "label3";
            this.label3.RightToLeft = System.Windows.Forms.RightToLeft.Yes;
            this.label3.Size = new System.Drawing.Size(100, 23);
            this.label3.TabIndex = 2;
            this.label3.Tag = "nuevaContraseña";
            this.label3.Text = "Nueva Contraseña";
            // 
            // passTxt
            // 
            this.passTxt.Location = new System.Drawing.Point(145, 22);
            this.passTxt.Name = "passTxt";
            this.passTxt.PasswordChar = '●';
            this.passTxt.Size = new System.Drawing.Size(100, 20);
            this.passTxt.TabIndex = 3;
            // 
            // npassTxt
            // 
            this.npassTxt.Location = new System.Drawing.Point(145, 57);
            this.npassTxt.Name = "npassTxt";
            this.npassTxt.PasswordChar = '●';
            this.npassTxt.Size = new System.Drawing.Size(100, 20);
            this.npassTxt.TabIndex = 4;
            // 
            // npass2Txt
            // 
            this.npass2Txt.Location = new System.Drawing.Point(145, 96);
            this.npass2Txt.Name = "npass2Txt";
            this.npass2Txt.PasswordChar = '●';
            this.npass2Txt.Size = new System.Drawing.Size(100, 20);
            this.npass2Txt.TabIndex = 5;
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(170, 141);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(75, 23);
            this.button1.TabIndex = 6;
            this.button1.Tag = "aceptar";
            this.button1.Text = "Aceptar";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // button2
            // 
            this.button2.Location = new System.Drawing.Point(89, 141);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(75, 23);
            this.button2.TabIndex = 7;
            this.button2.Tag = "cancelar";
            this.button2.Text = "Cancelar";
            this.button2.UseVisualStyleBackColor = true;
            this.button2.Click += new System.EventHandler(this.button2_Click);
            // 
            // frmResetPassword
            // 
            this.AcceptButton = this.button1;
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(278, 185);
            this.Controls.Add(this.button2);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.npass2Txt);
            this.Controls.Add(this.npassTxt);
            this.Controls.Add(this.passTxt);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Name = "frmResetPassword";
            this.Text = "frmResetPassword";
            this.Load += new System.EventHandler(this.frmResetPassword_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox passTxt;
        private System.Windows.Forms.TextBox npassTxt;
        private System.Windows.Forms.TextBox npass2Txt;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Button button2;
    }
}