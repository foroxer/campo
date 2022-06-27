namespace View
{
    partial class frmUsuariosPatentes
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
            this.components = new System.ComponentModel.Container();
            this.grpPatentes = new System.Windows.Forms.GroupBox();
            this.resetPasswordBtn = new System.Windows.Forms.Button();
            this.guardarPermisosBtn = new System.Windows.Forms.Button();
            this.label4 = new System.Windows.Forms.Label();
            this.cboFamilias = new System.Windows.Forms.ComboBox();
            this.label3 = new System.Windows.Forms.Label();
            this.cboPatentes = new System.Windows.Forms.ComboBox();
            this.label1 = new System.Windows.Forms.Label();
            this.cboUsuarios = new System.Windows.Forms.ComboBox();
            this.label2 = new System.Windows.Forms.Label();
            this.eliminarPatenteBtn = new System.Windows.Forms.Button();
            this.eliminarFamiliaBtn = new System.Windows.Forms.Button();
            this.agregarPatenteBtn = new System.Windows.Forms.Button();
            this.agregarFamiliaBtn = new System.Windows.Forms.Button();
            this.treeView1 = new System.Windows.Forms.TreeView();
            this.tooltip = new System.Windows.Forms.ToolTip(this.components);
            this.grpPatentes.SuspendLayout();
            this.SuspendLayout();
            // 
            // grpPatentes
            // 
            this.grpPatentes.Controls.Add(this.resetPasswordBtn);
            this.grpPatentes.Controls.Add(this.guardarPermisosBtn);
            this.grpPatentes.Controls.Add(this.label4);
            this.grpPatentes.Controls.Add(this.cboFamilias);
            this.grpPatentes.Controls.Add(this.label3);
            this.grpPatentes.Controls.Add(this.cboPatentes);
            this.grpPatentes.Controls.Add(this.label1);
            this.grpPatentes.Controls.Add(this.cboUsuarios);
            this.grpPatentes.Controls.Add(this.label2);
            this.grpPatentes.Controls.Add(this.eliminarPatenteBtn);
            this.grpPatentes.Controls.Add(this.eliminarFamiliaBtn);
            this.grpPatentes.Controls.Add(this.agregarPatenteBtn);
            this.grpPatentes.Controls.Add(this.agregarFamiliaBtn);
            this.grpPatentes.Location = new System.Drawing.Point(16, 19);
            this.grpPatentes.Margin = new System.Windows.Forms.Padding(2);
            this.grpPatentes.Name = "grpPatentes";
            this.grpPatentes.Padding = new System.Windows.Forms.Padding(2);
            this.grpPatentes.Size = new System.Drawing.Size(557, 315);
            this.grpPatentes.TabIndex = 5;
            this.grpPatentes.TabStop = false;
            this.grpPatentes.Tag = "users";
            this.grpPatentes.Text = "Usuarios";
            // 
            // resetPasswordBtn
            // 
            this.resetPasswordBtn.Location = new System.Drawing.Point(13, 282);
            this.resetPasswordBtn.Name = "resetPasswordBtn";
            this.resetPasswordBtn.Size = new System.Drawing.Size(232, 23);
            this.resetPasswordBtn.TabIndex = 17;
            this.resetPasswordBtn.Text = "Reset Password";
            this.resetPasswordBtn.UseVisualStyleBackColor = true;
            this.resetPasswordBtn.Click += new System.EventHandler(this.resetPasswordBtn_Click);
            // 
            // guardarPermisosBtn
            // 
            this.guardarPermisosBtn.Location = new System.Drawing.Point(411, 282);
            this.guardarPermisosBtn.Margin = new System.Windows.Forms.Padding(2);
            this.guardarPermisosBtn.Name = "guardarPermisosBtn";
            this.guardarPermisosBtn.Size = new System.Drawing.Size(137, 22);
            this.guardarPermisosBtn.TabIndex = 7;
            this.guardarPermisosBtn.Tag = "guardar";
            this.guardarPermisosBtn.Text = "Guardar cambios";
            this.guardarPermisosBtn.UseVisualStyleBackColor = true;
            this.guardarPermisosBtn.Click += new System.EventHandler(this.CmdGuardarFamilia_Click);
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(269, 23);
            this.label4.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(49, 13);
            this.label4.TabIndex = 16;
            this.label4.Text = "Permisos";
            // 
            // cboFamilias
            // 
            this.cboFamilias.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cboFamilias.FormattingEnabled = true;
            this.cboFamilias.Location = new System.Drawing.Point(11, 175);
            this.cboFamilias.Margin = new System.Windows.Forms.Padding(2);
            this.cboFamilias.Name = "cboFamilias";
            this.cboFamilias.Size = new System.Drawing.Size(234, 21);
            this.cboFamilias.TabIndex = 12;
            this.cboFamilias.SelectedIndexChanged += new System.EventHandler(this.cboFamilias_SelectedIndexChanged);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(9, 159);
            this.label3.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(84, 13);
            this.label3.TabIndex = 11;
            this.label3.Text = "Agregar Familias";
            // 
            // cboPatentes
            // 
            this.cboPatentes.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cboPatentes.FormattingEnabled = true;
            this.cboPatentes.Location = new System.Drawing.Point(10, 89);
            this.cboPatentes.Margin = new System.Windows.Forms.Padding(2);
            this.cboPatentes.Name = "cboPatentes";
            this.cboPatentes.Size = new System.Drawing.Size(234, 21);
            this.cboPatentes.TabIndex = 9;
            this.cboPatentes.SelectedIndexChanged += new System.EventHandler(this.cboPatentes_SelectedIndexChanged);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(8, 72);
            this.label1.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(88, 13);
            this.label1.TabIndex = 8;
            this.label1.Text = "Agregar patentes";
            // 
            // cboUsuarios
            // 
            this.cboUsuarios.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cboUsuarios.FormattingEnabled = true;
            this.cboUsuarios.Location = new System.Drawing.Point(11, 39);
            this.cboUsuarios.Margin = new System.Windows.Forms.Padding(2);
            this.cboUsuarios.Name = "cboUsuarios";
            this.cboUsuarios.Size = new System.Drawing.Size(234, 21);
            this.cboUsuarios.TabIndex = 6;
            this.cboUsuarios.SelectedIndexChanged += new System.EventHandler(this.cboUsuarios_SelectedIndexChanged);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(9, 23);
            this.label2.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(95, 13);
            this.label2.TabIndex = 5;
            this.label2.Text = "Todos los usuarios";
            // 
            // eliminarPatenteBtn
            // 
            this.eliminarPatenteBtn.Location = new System.Drawing.Point(130, 114);
            this.eliminarPatenteBtn.Margin = new System.Windows.Forms.Padding(2);
            this.eliminarPatenteBtn.Name = "eliminarPatenteBtn";
            this.eliminarPatenteBtn.Size = new System.Drawing.Size(114, 25);
            this.eliminarPatenteBtn.TabIndex = 14;
            this.eliminarPatenteBtn.Tag = "eliminar";
            this.eliminarPatenteBtn.Text = "Eliminar >>";
            this.eliminarPatenteBtn.UseVisualStyleBackColor = true;
            this.eliminarPatenteBtn.Click += new System.EventHandler(this.eliminarPatenteBtn_Click);
            // 
            // eliminarFamiliaBtn
            // 
            this.eliminarFamiliaBtn.Location = new System.Drawing.Point(131, 200);
            this.eliminarFamiliaBtn.Margin = new System.Windows.Forms.Padding(2);
            this.eliminarFamiliaBtn.Name = "eliminarFamiliaBtn";
            this.eliminarFamiliaBtn.Size = new System.Drawing.Size(114, 25);
            this.eliminarFamiliaBtn.TabIndex = 15;
            this.eliminarFamiliaBtn.Tag = "eliminar";
            this.eliminarFamiliaBtn.Text = "Eliminar >>";
            this.eliminarFamiliaBtn.UseVisualStyleBackColor = true;
            this.eliminarFamiliaBtn.Click += new System.EventHandler(this.eliminarFamiliaBtn_Click);
            // 
            // agregarPatenteBtn
            // 
            this.agregarPatenteBtn.Location = new System.Drawing.Point(9, 114);
            this.agregarPatenteBtn.Margin = new System.Windows.Forms.Padding(2);
            this.agregarPatenteBtn.Name = "agregarPatenteBtn";
            this.agregarPatenteBtn.Size = new System.Drawing.Size(117, 25);
            this.agregarPatenteBtn.TabIndex = 10;
            this.agregarPatenteBtn.Tag = "agregar";
            this.agregarPatenteBtn.Text = "Agregar >>";
            this.agregarPatenteBtn.UseVisualStyleBackColor = true;
            this.agregarPatenteBtn.Click += new System.EventHandler(this.AgregarPatente_Click);
            // 
            // agregarFamiliaBtn
            // 
            this.agregarFamiliaBtn.Location = new System.Drawing.Point(10, 200);
            this.agregarFamiliaBtn.Margin = new System.Windows.Forms.Padding(2);
            this.agregarFamiliaBtn.Name = "agregarFamiliaBtn";
            this.agregarFamiliaBtn.Size = new System.Drawing.Size(116, 26);
            this.agregarFamiliaBtn.TabIndex = 13;
            this.agregarFamiliaBtn.Tag = "agregar";
            this.agregarFamiliaBtn.Text = "Agregar >>";
            this.agregarFamiliaBtn.UseVisualStyleBackColor = true;
            this.agregarFamiliaBtn.Click += new System.EventHandler(this.AgregarFamilia_Click);
            // 
            // treeView1
            // 
            this.treeView1.Location = new System.Drawing.Point(288, 58);
            this.treeView1.Margin = new System.Windows.Forms.Padding(2);
            this.treeView1.Name = "treeView1";
            this.treeView1.Size = new System.Drawing.Size(276, 239);
            this.treeView1.TabIndex = 6;
            // 
            // frmUsuarios
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(584, 345);
            this.Controls.Add(this.treeView1);
            this.Controls.Add(this.grpPatentes);
            this.Margin = new System.Windows.Forms.Padding(2);
            this.Name = "frmUsuarios";
            this.Text = "Gestión de usuarios";
            this.FormClosed += new System.Windows.Forms.FormClosedEventHandler(this.frmUsuarios_FormClosed);
            this.Load += new System.EventHandler(this.frmUsuarios_Load);
            this.grpPatentes.ResumeLayout(false);
            this.grpPatentes.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox grpPatentes;
        private System.Windows.Forms.ComboBox cboUsuarios;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TreeView treeView1;
        private System.Windows.Forms.Button agregarFamiliaBtn;
        private System.Windows.Forms.ComboBox cboFamilias;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Button agregarPatenteBtn;
        private System.Windows.Forms.ComboBox cboPatentes;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button guardarPermisosBtn;
        private System.Windows.Forms.Button eliminarPatenteBtn;
        private System.Windows.Forms.Button eliminarFamiliaBtn;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Button resetPasswordBtn;
        private System.Windows.Forms.ToolTip tooltip;
    }
}