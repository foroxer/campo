namespace View
{
    partial class frmUsuariosM
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
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.label6 = new System.Windows.Forms.Label();
            this.NICUpdate = new System.Windows.Forms.TextBox();
            this.label15 = new System.Windows.Forms.Label();
            this.cboUsuarios = new System.Windows.Forms.ComboBox();
            this.label13 = new System.Windows.Forms.Label();
            this.updateBtn = new System.Windows.Forms.Button();
            this.AdressUpdate = new System.Windows.Forms.TextBox();
            this.MailUpdate = new System.Windows.Forms.TextBox();
            this.PhoneUpdate = new System.Windows.Forms.TextBox();
            this.DNIUpdate = new System.Windows.Forms.TextBox();
            this.LNameUpdate = new System.Windows.Forms.TextBox();
            this.NameUpdate = new System.Windows.Forms.TextBox();
            this.label8 = new System.Windows.Forms.Label();
            this.label9 = new System.Windows.Forms.Label();
            this.label10 = new System.Windows.Forms.Label();
            this.label11 = new System.Windows.Forms.Label();
            this.label12 = new System.Windows.Forms.Label();
            this.bloquearBtn = new System.Windows.Forms.Button();
            this.desbloquearBtn = new System.Windows.Forms.Button();
            this.blockedLabel = new System.Windows.Forms.Label();
            this.groupBox2.SuspendLayout();
            this.SuspendLayout();
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.blockedLabel);
            this.groupBox2.Controls.Add(this.desbloquearBtn);
            this.groupBox2.Controls.Add(this.bloquearBtn);
            this.groupBox2.Controls.Add(this.label6);
            this.groupBox2.Controls.Add(this.NICUpdate);
            this.groupBox2.Controls.Add(this.label15);
            this.groupBox2.Controls.Add(this.cboUsuarios);
            this.groupBox2.Controls.Add(this.label13);
            this.groupBox2.Controls.Add(this.updateBtn);
            this.groupBox2.Controls.Add(this.AdressUpdate);
            this.groupBox2.Controls.Add(this.MailUpdate);
            this.groupBox2.Controls.Add(this.PhoneUpdate);
            this.groupBox2.Controls.Add(this.DNIUpdate);
            this.groupBox2.Controls.Add(this.LNameUpdate);
            this.groupBox2.Controls.Add(this.NameUpdate);
            this.groupBox2.Controls.Add(this.label8);
            this.groupBox2.Controls.Add(this.label9);
            this.groupBox2.Controls.Add(this.label10);
            this.groupBox2.Controls.Add(this.label11);
            this.groupBox2.Controls.Add(this.label12);
            this.groupBox2.Location = new System.Drawing.Point(12, 12);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(294, 410);
            this.groupBox2.TabIndex = 14;
            this.groupBox2.TabStop = false;
            this.groupBox2.Tag = "modificar";
            this.groupBox2.Text = "Modificar";
            // 
            // label6
            // 
            this.label6.Location = new System.Drawing.Point(6, 289);
            this.label6.Name = "label6";
            this.label6.RightToLeft = System.Windows.Forms.RightToLeft.No;
            this.label6.Size = new System.Drawing.Size(66, 18);
            this.label6.TabIndex = 16;
            this.label6.Tag = "direccion";
            this.label6.Text = "Dirección";
            this.label6.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // NICUpdate
            // 
            this.NICUpdate.Location = new System.Drawing.Point(90, 76);
            this.NICUpdate.Name = "NICUpdate";
            this.NICUpdate.Size = new System.Drawing.Size(175, 20);
            this.NICUpdate.TabIndex = 1;
            // 
            // label15
            // 
            this.label15.Location = new System.Drawing.Point(6, 78);
            this.label15.Name = "label15";
            this.label15.RightToLeft = System.Windows.Forms.RightToLeft.No;
            this.label15.Size = new System.Drawing.Size(66, 18);
            this.label15.TabIndex = 15;
            this.label15.Tag = "nic";
            this.label15.Text = "NIC";
            this.label15.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // cboUsuarios
            // 
            this.cboUsuarios.FormattingEnabled = true;
            this.cboUsuarios.Location = new System.Drawing.Point(90, 44);
            this.cboUsuarios.Name = "cboUsuarios";
            this.cboUsuarios.Size = new System.Drawing.Size(175, 21);
            this.cboUsuarios.TabIndex = 0;
            this.cboUsuarios.SelectedIndexChanged += new System.EventHandler(this.cboUsuarios_SelectedIndexChanged);
            this.cboUsuarios.SelectionChangeCommitted += new System.EventHandler(this.cboUsuarios_SelectionChangeCommitted);
            // 
            // label13
            // 
            this.label13.Location = new System.Drawing.Point(6, 46);
            this.label13.Name = "label13";
            this.label13.RightToLeft = System.Windows.Forms.RightToLeft.No;
            this.label13.Size = new System.Drawing.Size(66, 18);
            this.label13.TabIndex = 13;
            this.label13.Tag = "user";
            this.label13.Text = "Usuario";
            this.label13.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // updateBtn
            // 
            this.updateBtn.Location = new System.Drawing.Point(190, 366);
            this.updateBtn.Name = "updateBtn";
            this.updateBtn.Size = new System.Drawing.Size(75, 23);
            this.updateBtn.TabIndex = 8;
            this.updateBtn.Tag = "modificar";
            this.updateBtn.Text = "Modificar";
            this.updateBtn.UseVisualStyleBackColor = true;
            this.updateBtn.Click += new System.EventHandler(this.updateBtn_Click);
            // 
            // AdressUpdate
            // 
            this.AdressUpdate.Location = new System.Drawing.Point(90, 287);
            this.AdressUpdate.Multiline = true;
            this.AdressUpdate.Name = "AdressUpdate";
            this.AdressUpdate.Size = new System.Drawing.Size(175, 52);
            this.AdressUpdate.TabIndex = 7;
            // 
            // MailUpdate
            // 
            this.MailUpdate.Location = new System.Drawing.Point(90, 251);
            this.MailUpdate.Name = "MailUpdate";
            this.MailUpdate.Size = new System.Drawing.Size(175, 20);
            this.MailUpdate.TabIndex = 6;
            // 
            // PhoneUpdate
            // 
            this.PhoneUpdate.Location = new System.Drawing.Point(90, 215);
            this.PhoneUpdate.Name = "PhoneUpdate";
            this.PhoneUpdate.Size = new System.Drawing.Size(175, 20);
            this.PhoneUpdate.TabIndex = 5;
            // 
            // DNIUpdate
            // 
            this.DNIUpdate.Location = new System.Drawing.Point(90, 179);
            this.DNIUpdate.Name = "DNIUpdate";
            this.DNIUpdate.Size = new System.Drawing.Size(175, 20);
            this.DNIUpdate.TabIndex = 4;
            // 
            // LNameUpdate
            // 
            this.LNameUpdate.Location = new System.Drawing.Point(90, 143);
            this.LNameUpdate.Name = "LNameUpdate";
            this.LNameUpdate.Size = new System.Drawing.Size(175, 20);
            this.LNameUpdate.TabIndex = 3;
            // 
            // NameUpdate
            // 
            this.NameUpdate.Location = new System.Drawing.Point(90, 107);
            this.NameUpdate.Name = "NameUpdate";
            this.NameUpdate.Size = new System.Drawing.Size(175, 20);
            this.NameUpdate.TabIndex = 2;
            // 
            // label8
            // 
            this.label8.Location = new System.Drawing.Point(6, 253);
            this.label8.Name = "label8";
            this.label8.RightToLeft = System.Windows.Forms.RightToLeft.No;
            this.label8.Size = new System.Drawing.Size(66, 18);
            this.label8.TabIndex = 4;
            this.label8.Tag = "mail";
            this.label8.Text = "Mail";
            this.label8.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // label9
            // 
            this.label9.Location = new System.Drawing.Point(6, 217);
            this.label9.Name = "label9";
            this.label9.RightToLeft = System.Windows.Forms.RightToLeft.No;
            this.label9.Size = new System.Drawing.Size(66, 18);
            this.label9.TabIndex = 3;
            this.label9.Tag = "telefono";
            this.label9.Text = "Phone";
            this.label9.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // label10
            // 
            this.label10.Location = new System.Drawing.Point(6, 181);
            this.label10.Name = "label10";
            this.label10.RightToLeft = System.Windows.Forms.RightToLeft.No;
            this.label10.Size = new System.Drawing.Size(66, 18);
            this.label10.TabIndex = 2;
            this.label10.Tag = "dni";
            this.label10.Text = "DNI";
            this.label10.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // label11
            // 
            this.label11.Location = new System.Drawing.Point(6, 145);
            this.label11.Name = "label11";
            this.label11.RightToLeft = System.Windows.Forms.RightToLeft.No;
            this.label11.Size = new System.Drawing.Size(66, 18);
            this.label11.TabIndex = 1;
            this.label11.Tag = "apellido";
            this.label11.Text = "LastName";
            this.label11.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // label12
            // 
            this.label12.Location = new System.Drawing.Point(6, 109);
            this.label12.Name = "label12";
            this.label12.RightToLeft = System.Windows.Forms.RightToLeft.No;
            this.label12.Size = new System.Drawing.Size(66, 18);
            this.label12.TabIndex = 0;
            this.label12.Tag = "nombre";
            this.label12.Text = "Name";
            this.label12.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // bloquearBtn
            // 
            this.bloquearBtn.Location = new System.Drawing.Point(90, 366);
            this.bloquearBtn.Name = "bloquearBtn";
            this.bloquearBtn.Size = new System.Drawing.Size(75, 23);
            this.bloquearBtn.TabIndex = 10;
            this.bloquearBtn.Tag = "bloquear";
            this.bloquearBtn.Text = "bloquear";
            this.bloquearBtn.UseVisualStyleBackColor = true;
            this.bloquearBtn.Click += new System.EventHandler(this.bloquearBtn_Click);
            // 
            // desbloquearBtn
            // 
            this.desbloquearBtn.Location = new System.Drawing.Point(90, 366);
            this.desbloquearBtn.Name = "desbloquearBtn";
            this.desbloquearBtn.Size = new System.Drawing.Size(75, 23);
            this.desbloquearBtn.TabIndex = 9;
            this.desbloquearBtn.Tag = "desbloquear";
            this.desbloquearBtn.Text = "desbloquear";
            this.desbloquearBtn.UseVisualStyleBackColor = true;
            this.desbloquearBtn.Click += new System.EventHandler(this.desbloquearBtn_Click);
            // 
            // blockedLabel
            // 
            this.blockedLabel.AutoSize = true;
            this.blockedLabel.Location = new System.Drawing.Point(90, 20);
            this.blockedLabel.Name = "blockedLabel";
            this.blockedLabel.Size = new System.Drawing.Size(97, 13);
            this.blockedLabel.TabIndex = 19;
            this.blockedLabel.Tag = "userBlocked";
            this.blockedLabel.Text = "Usuario Bloqueado";
            this.blockedLabel.TextAlign = System.Drawing.ContentAlignment.TopCenter;
            // 
            // frmUsuariosM
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(326, 435);
            this.Controls.Add(this.groupBox2);
            this.Name = "frmUsuariosM";
            this.Text = "frmMUsuarios";
            this.FormClosed += new System.Windows.Forms.FormClosedEventHandler(this.frmMUsuarios_FormClosed);
            this.Load += new System.EventHandler(this.frmMUsuarios_Load);
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.TextBox NICUpdate;
        private System.Windows.Forms.Label label15;
        private System.Windows.Forms.ComboBox cboUsuarios;
        private System.Windows.Forms.Label label13;
        private System.Windows.Forms.Button updateBtn;
        private System.Windows.Forms.TextBox AdressUpdate;
        private System.Windows.Forms.TextBox MailUpdate;
        private System.Windows.Forms.TextBox PhoneUpdate;
        private System.Windows.Forms.TextBox DNIUpdate;
        private System.Windows.Forms.TextBox LNameUpdate;
        private System.Windows.Forms.TextBox NameUpdate;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.Label label10;
        private System.Windows.Forms.Label label11;
        private System.Windows.Forms.Label label12;
        private System.Windows.Forms.Button bloquearBtn;
        private System.Windows.Forms.Button desbloquearBtn;
        private System.Windows.Forms.Label blockedLabel;
    }
}