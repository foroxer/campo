namespace View
{
    partial class frmPatentesFamilias
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
            this.cboPermisos = new System.Windows.Forms.ComboBox();
            this.grpPatentes = new System.Windows.Forms.GroupBox();
            this.eliminarPatenteBtn = new System.Windows.Forms.Button();
            this.cmdAgregarPatente = new System.Windows.Forms.Button();
            this.cboPatentes = new System.Windows.Forms.ComboBox();
            this.label2 = new System.Windows.Forms.Label();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.btnGuardarPatente = new System.Windows.Forms.Button();
            this.txtNombrePatente = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.eliminarFamiliaBtn = new System.Windows.Forms.Button();
            this.cboFamilias2 = new System.Windows.Forms.ComboBox();
            this.cmdSeleccionar = new System.Windows.Forms.Button();
            this.cmdAgregarFamilia = new System.Windows.Forms.Button();
            this.groupBox3 = new System.Windows.Forms.GroupBox();
            this.button1 = new System.Windows.Forms.Button();
            this.txtNombreFamilia = new System.Windows.Forms.TextBox();
            this.label5 = new System.Windows.Forms.Label();
            this.cboFamilias = new System.Windows.Forms.ComboBox();
            this.label4 = new System.Windows.Forms.Label();
            this.groupBox4 = new System.Windows.Forms.GroupBox();
            this.cmdGuardarFamilia = new System.Windows.Forms.Button();
            this.treeConfigurarFamilia = new System.Windows.Forms.TreeView();
            this.TxtDescription = new System.Windows.Forms.TextBox();
            this.groupBox5 = new System.Windows.Forms.GroupBox();
            this.grpPatentes.SuspendLayout();
            this.groupBox1.SuspendLayout();
            this.groupBox2.SuspendLayout();
            this.groupBox3.SuspendLayout();
            this.groupBox4.SuspendLayout();
            this.groupBox5.SuspendLayout();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(14, 20);
            this.label1.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(44, 13);
            this.label1.TabIndex = 0;
            this.label1.Text = "Permiso";
            // 
            // cboPermisos
            // 
            this.cboPermisos.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cboPermisos.FormattingEnabled = true;
            this.cboPermisos.Location = new System.Drawing.Point(16, 36);
            this.cboPermisos.Margin = new System.Windows.Forms.Padding(2);
            this.cboPermisos.Name = "cboPermisos";
            this.cboPermisos.Size = new System.Drawing.Size(174, 21);
            this.cboPermisos.TabIndex = 1;
            // 
            // grpPatentes
            // 
            this.grpPatentes.Controls.Add(this.groupBox5);
            this.grpPatentes.Controls.Add(this.eliminarPatenteBtn);
            this.grpPatentes.Controls.Add(this.cmdAgregarPatente);
            this.grpPatentes.Controls.Add(this.cboPatentes);
            this.grpPatentes.Controls.Add(this.label2);
            this.grpPatentes.Controls.Add(this.groupBox1);
            this.grpPatentes.Location = new System.Drawing.Point(9, 10);
            this.grpPatentes.Margin = new System.Windows.Forms.Padding(2);
            this.grpPatentes.Name = "grpPatentes";
            this.grpPatentes.Padding = new System.Windows.Forms.Padding(2);
            this.grpPatentes.Size = new System.Drawing.Size(256, 249);
            this.grpPatentes.TabIndex = 4;
            this.grpPatentes.TabStop = false;
            this.grpPatentes.Text = "Patentes";
            // 
            // eliminarPatenteBtn
            // 
            this.eliminarPatenteBtn.Location = new System.Drawing.Point(110, 64);
            this.eliminarPatenteBtn.Margin = new System.Windows.Forms.Padding(2);
            this.eliminarPatenteBtn.Name = "eliminarPatenteBtn";
            this.eliminarPatenteBtn.Size = new System.Drawing.Size(95, 21);
            this.eliminarPatenteBtn.TabIndex = 9;
            this.eliminarPatenteBtn.Text = "Eliminar >>";
            this.eliminarPatenteBtn.UseVisualStyleBackColor = true;
            this.eliminarPatenteBtn.Click += new System.EventHandler(this.eliminarPatenteBtn_Click);
            // 
            // cmdAgregarPatente
            // 
            this.cmdAgregarPatente.Location = new System.Drawing.Point(11, 64);
            this.cmdAgregarPatente.Margin = new System.Windows.Forms.Padding(2);
            this.cmdAgregarPatente.Name = "cmdAgregarPatente";
            this.cmdAgregarPatente.Size = new System.Drawing.Size(95, 21);
            this.cmdAgregarPatente.TabIndex = 8;
            this.cmdAgregarPatente.Tag = "agregar";
            this.cmdAgregarPatente.Text = "Agregar >> ";
            this.cmdAgregarPatente.UseVisualStyleBackColor = true;
            this.cmdAgregarPatente.Click += new System.EventHandler(this.CmdAgregarPatente_Click);
            // 
            // cboPatentes
            // 
            this.cboPatentes.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cboPatentes.FormattingEnabled = true;
            this.cboPatentes.Location = new System.Drawing.Point(11, 39);
            this.cboPatentes.Margin = new System.Windows.Forms.Padding(2);
            this.cboPatentes.Name = "cboPatentes";
            this.cboPatentes.Size = new System.Drawing.Size(234, 21);
            this.cboPatentes.TabIndex = 6;
            this.cboPatentes.SelectedIndexChanged += new System.EventHandler(this.cboPatentes_SelectedIndexChanged);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(9, 23);
            this.label2.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(97, 13);
            this.label2.TabIndex = 5;
            this.label2.Text = "Todas las patentes";
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.btnGuardarPatente);
            this.groupBox1.Controls.Add(this.txtNombrePatente);
            this.groupBox1.Controls.Add(this.label3);
            this.groupBox1.Controls.Add(this.cboPermisos);
            this.groupBox1.Controls.Add(this.label1);
            this.groupBox1.Location = new System.Drawing.Point(11, 99);
            this.groupBox1.Margin = new System.Windows.Forms.Padding(2);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Padding = new System.Windows.Forms.Padding(2);
            this.groupBox1.Size = new System.Drawing.Size(232, 138);
            this.groupBox1.TabIndex = 7;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Nueva";
            this.groupBox1.Visible = false;
            // 
            // btnGuardarPatente
            // 
            this.btnGuardarPatente.Location = new System.Drawing.Point(16, 108);
            this.btnGuardarPatente.Margin = new System.Windows.Forms.Padding(2);
            this.btnGuardarPatente.Name = "btnGuardarPatente";
            this.btnGuardarPatente.Size = new System.Drawing.Size(56, 19);
            this.btnGuardarPatente.TabIndex = 4;
            this.btnGuardarPatente.Text = "Guardar";
            this.btnGuardarPatente.UseVisualStyleBackColor = true;
            this.btnGuardarPatente.Click += new System.EventHandler(this.BtnGuardarPatente_Click);
            // 
            // txtNombrePatente
            // 
            this.txtNombrePatente.Location = new System.Drawing.Point(16, 84);
            this.txtNombrePatente.Margin = new System.Windows.Forms.Padding(2);
            this.txtNombrePatente.Name = "txtNombrePatente";
            this.txtNombrePatente.Size = new System.Drawing.Size(174, 20);
            this.txtNombrePatente.TabIndex = 3;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(14, 67);
            this.label3.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(44, 13);
            this.label3.TabIndex = 2;
            this.label3.Text = "Nombre";
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.eliminarFamiliaBtn);
            this.groupBox2.Controls.Add(this.cboFamilias2);
            this.groupBox2.Controls.Add(this.cmdSeleccionar);
            this.groupBox2.Controls.Add(this.cmdAgregarFamilia);
            this.groupBox2.Controls.Add(this.groupBox3);
            this.groupBox2.Controls.Add(this.cboFamilias);
            this.groupBox2.Controls.Add(this.label4);
            this.groupBox2.Location = new System.Drawing.Point(278, 10);
            this.groupBox2.Margin = new System.Windows.Forms.Padding(2);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Padding = new System.Windows.Forms.Padding(2);
            this.groupBox2.Size = new System.Drawing.Size(258, 249);
            this.groupBox2.TabIndex = 5;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "Familias";
            // 
            // eliminarFamiliaBtn
            // 
            this.eliminarFamiliaBtn.Location = new System.Drawing.Point(116, 111);
            this.eliminarFamiliaBtn.Margin = new System.Windows.Forms.Padding(2);
            this.eliminarFamiliaBtn.Name = "eliminarFamiliaBtn";
            this.eliminarFamiliaBtn.Size = new System.Drawing.Size(98, 21);
            this.eliminarFamiliaBtn.TabIndex = 13;
            this.eliminarFamiliaBtn.Text = "Eliminar >>";
            this.eliminarFamiliaBtn.UseVisualStyleBackColor = true;
            this.eliminarFamiliaBtn.Click += new System.EventHandler(this.eliminarFamiliaBtn_Click);
            // 
            // cboFamilias2
            // 
            this.cboFamilias2.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cboFamilias2.FormattingEnabled = true;
            this.cboFamilias2.Location = new System.Drawing.Point(15, 86);
            this.cboFamilias2.Margin = new System.Windows.Forms.Padding(2);
            this.cboFamilias2.Name = "cboFamilias2";
            this.cboFamilias2.Size = new System.Drawing.Size(234, 21);
            this.cboFamilias2.TabIndex = 12;
            // 
            // cmdSeleccionar
            // 
            this.cmdSeleccionar.Location = new System.Drawing.Point(14, 63);
            this.cmdSeleccionar.Margin = new System.Windows.Forms.Padding(2);
            this.cmdSeleccionar.Name = "cmdSeleccionar";
            this.cmdSeleccionar.Size = new System.Drawing.Size(98, 19);
            this.cmdSeleccionar.TabIndex = 11;
            this.cmdSeleccionar.Text = "Configurar";
            this.cmdSeleccionar.UseVisualStyleBackColor = true;
            this.cmdSeleccionar.Visible = false;
            this.cmdSeleccionar.Click += new System.EventHandler(this.CmdSeleccionar_Click);
            // 
            // cmdAgregarFamilia
            // 
            this.cmdAgregarFamilia.Location = new System.Drawing.Point(14, 111);
            this.cmdAgregarFamilia.Margin = new System.Windows.Forms.Padding(2);
            this.cmdAgregarFamilia.Name = "cmdAgregarFamilia";
            this.cmdAgregarFamilia.Size = new System.Drawing.Size(98, 21);
            this.cmdAgregarFamilia.TabIndex = 10;
            this.cmdAgregarFamilia.Text = "Agregar >> ";
            this.cmdAgregarFamilia.UseVisualStyleBackColor = true;
            this.cmdAgregarFamilia.Click += new System.EventHandler(this.CmdAgregarFamilia_Click);
            // 
            // groupBox3
            // 
            this.groupBox3.Controls.Add(this.button1);
            this.groupBox3.Controls.Add(this.txtNombreFamilia);
            this.groupBox3.Controls.Add(this.label5);
            this.groupBox3.Location = new System.Drawing.Point(14, 144);
            this.groupBox3.Margin = new System.Windows.Forms.Padding(2);
            this.groupBox3.Name = "groupBox3";
            this.groupBox3.Padding = new System.Windows.Forms.Padding(2);
            this.groupBox3.Size = new System.Drawing.Size(232, 93);
            this.groupBox3.TabIndex = 9;
            this.groupBox3.TabStop = false;
            this.groupBox3.Text = "Nueva";
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(11, 61);
            this.button1.Margin = new System.Windows.Forms.Padding(2);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(56, 19);
            this.button1.TabIndex = 4;
            this.button1.Text = "Guardar";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.Button1_Click);
            // 
            // txtNombreFamilia
            // 
            this.txtNombreFamilia.Location = new System.Drawing.Point(11, 37);
            this.txtNombreFamilia.Margin = new System.Windows.Forms.Padding(2);
            this.txtNombreFamilia.Name = "txtNombreFamilia";
            this.txtNombreFamilia.Size = new System.Drawing.Size(174, 20);
            this.txtNombreFamilia.TabIndex = 3;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(9, 20);
            this.label5.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(44, 13);
            this.label5.TabIndex = 2;
            this.label5.Text = "Nombre";
            // 
            // cboFamilias
            // 
            this.cboFamilias.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cboFamilias.FormattingEnabled = true;
            this.cboFamilias.Location = new System.Drawing.Point(15, 39);
            this.cboFamilias.Margin = new System.Windows.Forms.Padding(2);
            this.cboFamilias.Name = "cboFamilias";
            this.cboFamilias.Size = new System.Drawing.Size(234, 21);
            this.cboFamilias.TabIndex = 8;
            this.cboFamilias.SelectedIndexChanged += new System.EventHandler(this.cboFamilias_SelectedIndexChanged);
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(13, 23);
            this.label4.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(90, 13);
            this.label4.TabIndex = 7;
            this.label4.Text = "Todas las familias";
            // 
            // groupBox4
            // 
            this.groupBox4.Controls.Add(this.cmdGuardarFamilia);
            this.groupBox4.Controls.Add(this.treeConfigurarFamilia);
            this.groupBox4.Location = new System.Drawing.Point(549, 10);
            this.groupBox4.Margin = new System.Windows.Forms.Padding(2);
            this.groupBox4.Name = "groupBox4";
            this.groupBox4.Padding = new System.Windows.Forms.Padding(2);
            this.groupBox4.Size = new System.Drawing.Size(290, 249);
            this.groupBox4.TabIndex = 6;
            this.groupBox4.TabStop = false;
            this.groupBox4.Text = "Configurar Familia";
            // 
            // cmdGuardarFamilia
            // 
            this.cmdGuardarFamilia.Location = new System.Drawing.Point(11, 219);
            this.cmdGuardarFamilia.Margin = new System.Windows.Forms.Padding(2);
            this.cmdGuardarFamilia.Name = "cmdGuardarFamilia";
            this.cmdGuardarFamilia.Size = new System.Drawing.Size(110, 19);
            this.cmdGuardarFamilia.TabIndex = 1;
            this.cmdGuardarFamilia.Text = "Guardar familia";
            this.cmdGuardarFamilia.UseVisualStyleBackColor = true;
            this.cmdGuardarFamilia.Click += new System.EventHandler(this.Button2_Click);
            // 
            // treeConfigurarFamilia
            // 
            this.treeConfigurarFamilia.Location = new System.Drawing.Point(11, 23);
            this.treeConfigurarFamilia.Margin = new System.Windows.Forms.Padding(2);
            this.treeConfigurarFamilia.Name = "treeConfigurarFamilia";
            this.treeConfigurarFamilia.Size = new System.Drawing.Size(262, 192);
            this.treeConfigurarFamilia.TabIndex = 0;
            // 
            // TxtDescription
            // 
            this.TxtDescription.Location = new System.Drawing.Point(7, 19);
            this.TxtDescription.Multiline = true;
            this.TxtDescription.Name = "TxtDescription";
            this.TxtDescription.ReadOnly = true;
            this.TxtDescription.Size = new System.Drawing.Size(223, 109);
            this.TxtDescription.TabIndex = 10;
            // 
            // groupBox5
            // 
            this.groupBox5.Controls.Add(this.TxtDescription);
            this.groupBox5.Location = new System.Drawing.Point(8, 101);
            this.groupBox5.Name = "groupBox5";
            this.groupBox5.Size = new System.Drawing.Size(237, 137);
            this.groupBox5.TabIndex = 10;
            this.groupBox5.TabStop = false;
            this.groupBox5.Text = "Descripcion";
            // 
            // frmPatentesFamilias
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(848, 271);
            this.Controls.Add(this.groupBox4);
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.grpPatentes);
            this.Margin = new System.Windows.Forms.Padding(2);
            this.Name = "frmPatentesFamilias";
            this.Text = "Configurar seguridad";
            this.Load += new System.EventHandler(this.FrmSeguridad_Load);
            this.grpPatentes.ResumeLayout(false);
            this.grpPatentes.PerformLayout();
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            this.groupBox3.ResumeLayout(false);
            this.groupBox3.PerformLayout();
            this.groupBox4.ResumeLayout(false);
            this.groupBox5.ResumeLayout(false);
            this.groupBox5.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.ComboBox cboPermisos;
        private System.Windows.Forms.GroupBox grpPatentes;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.Button btnGuardarPatente;
        private System.Windows.Forms.TextBox txtNombrePatente;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.ComboBox cboPatentes;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.ComboBox cboFamilias;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.GroupBox groupBox3;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.TextBox txtNombreFamilia;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.GroupBox groupBox4;
        private System.Windows.Forms.TreeView treeConfigurarFamilia;
        private System.Windows.Forms.Button cmdAgregarPatente;
        private System.Windows.Forms.Button cmdAgregarFamilia;
        private System.Windows.Forms.Button cmdGuardarFamilia;
        private System.Windows.Forms.Button cmdSeleccionar;
        private System.Windows.Forms.ComboBox cboFamilias2;
        private System.Windows.Forms.Button eliminarPatenteBtn;
        private System.Windows.Forms.Button eliminarFamiliaBtn;
        private System.Windows.Forms.GroupBox groupBox5;
        private System.Windows.Forms.TextBox TxtDescription;
    }
}

