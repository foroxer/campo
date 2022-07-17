namespace View
{
    partial class frmMain
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmMain));
            this.mnuConfig = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuPatentesFamilias = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuUsuarioPatentes = new System.Windows.Forms.ToolStripMenuItem();
            this.usuariosToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.altaUsuario = new System.Windows.Forms.ToolStripMenuItem();
            this.modificacionUsuario = new System.Windows.Forms.ToolStripMenuItem();
            this.listaToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.configidioma = new System.Windows.Forms.ToolStripMenuItem();
            this.changePasswordToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.logOutToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.menuStrip = new System.Windows.Forms.MenuStrip();
            this.mnuSelectIdioma = new System.Windows.Forms.ToolStripMenuItem();
            this.rutinas = new System.Windows.Forms.ToolStripMenuItem();
            this.lblUsuario = new System.Windows.Forms.ToolStripStatusLabel();
            this.statusStrip = new System.Windows.Forms.StatusStrip();
            this.configurarToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.ejerciciosToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.aparatosToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.gruposMuscularesToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.menuStrip.SuspendLayout();
            this.statusStrip.SuspendLayout();
            this.SuspendLayout();
            // 
            // mnuConfig
            // 
            this.mnuConfig.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.mnuPatentesFamilias,
            this.mnuUsuarioPatentes,
            this.usuariosToolStripMenuItem,
            this.configidioma,
            this.changePasswordToolStripMenuItem,
            this.logOutToolStripMenuItem,
            this.configurarToolStripMenuItem});
            this.mnuConfig.ImageTransparentColor = System.Drawing.SystemColors.ActiveBorder;
            this.mnuConfig.Name = "mnuConfig";
            this.mnuConfig.Size = new System.Drawing.Size(48, 20);
            this.mnuConfig.Tag = "inicio";
            this.mnuConfig.Text = "Inicio";
            // 
            // mnuPatentesFamilias
            // 
            this.mnuPatentesFamilias.Name = "mnuPatentesFamilias";
            this.mnuPatentesFamilias.Size = new System.Drawing.Size(189, 22);
            this.mnuPatentesFamilias.Tag = "patentesyfamilias";
            this.mnuPatentesFamilias.Text = "Patentes y Familias";
            this.mnuPatentesFamilias.Click += new System.EventHandler(this.mnuPatentesFamilias_Click);
            // 
            // mnuUsuarioPatentes
            // 
            this.mnuUsuarioPatentes.Name = "mnuUsuarioPatentes";
            this.mnuUsuarioPatentes.Size = new System.Drawing.Size(189, 22);
            this.mnuUsuarioPatentes.Tag = "";
            this.mnuUsuarioPatentes.Text = "Permisos de Usuarios ";
            this.mnuUsuarioPatentes.Click += new System.EventHandler(this.mnuUsuarioPatentes_Click);
            // 
            // usuariosToolStripMenuItem
            // 
            this.usuariosToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.altaUsuario,
            this.modificacionUsuario,
            this.listaToolStripMenuItem});
            this.usuariosToolStripMenuItem.Name = "usuariosToolStripMenuItem";
            this.usuariosToolStripMenuItem.Size = new System.Drawing.Size(189, 22);
            this.usuariosToolStripMenuItem.Tag = "usuarios";
            this.usuariosToolStripMenuItem.Text = "Usuarios";
            // 
            // altaUsuario
            // 
            this.altaUsuario.Name = "altaUsuario";
            this.altaUsuario.Size = new System.Drawing.Size(144, 22);
            this.altaUsuario.Tag = "alta";
            this.altaUsuario.Text = "Alta";
            this.altaUsuario.Click += new System.EventHandler(this.altaUsuario_Click);
            // 
            // modificacionUsuario
            // 
            this.modificacionUsuario.Name = "modificacionUsuario";
            this.modificacionUsuario.Size = new System.Drawing.Size(144, 22);
            this.modificacionUsuario.Tag = "modificacion";
            this.modificacionUsuario.Text = "Modificacion";
            this.modificacionUsuario.Click += new System.EventHandler(this.modificacionUsuario_Click);
            // 
            // listaToolStripMenuItem
            // 
            this.listaToolStripMenuItem.Name = "listaToolStripMenuItem";
            this.listaToolStripMenuItem.Size = new System.Drawing.Size(144, 22);
            this.listaToolStripMenuItem.Tag = "lista";
            this.listaToolStripMenuItem.Text = "Lista";
            this.listaToolStripMenuItem.Click += new System.EventHandler(this.listaToolStripMenuItem_Click);
            // 
            // configidioma
            // 
            this.configidioma.Name = "configidioma";
            this.configidioma.Size = new System.Drawing.Size(189, 22);
            this.configidioma.Tag = "idioma";
            this.configidioma.Text = "Idioma";
            this.configidioma.Click += new System.EventHandler(this.idiomaToolStripMenuItem_Click);
            // 
            // changePasswordToolStripMenuItem
            // 
            this.changePasswordToolStripMenuItem.Name = "changePasswordToolStripMenuItem";
            this.changePasswordToolStripMenuItem.Size = new System.Drawing.Size(189, 22);
            this.changePasswordToolStripMenuItem.Tag = "resetPssword";
            this.changePasswordToolStripMenuItem.Text = "Cambiar Password";
            this.changePasswordToolStripMenuItem.Click += new System.EventHandler(this.changePasswordToolStripMenuItem_Click);
            // 
            // logOutToolStripMenuItem
            // 
            this.logOutToolStripMenuItem.Name = "logOutToolStripMenuItem";
            this.logOutToolStripMenuItem.Size = new System.Drawing.Size(189, 22);
            this.logOutToolStripMenuItem.Tag = "logOut";
            this.logOutToolStripMenuItem.Text = "Cerrar sesion";
            this.logOutToolStripMenuItem.Click += new System.EventHandler(this.logOutToolStripMenuItem_Click);
            // 
            // menuStrip
            // 
            this.menuStrip.ImageScalingSize = new System.Drawing.Size(20, 20);
            this.menuStrip.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.mnuConfig,
            this.mnuSelectIdioma,
            this.rutinas});
            this.menuStrip.Location = new System.Drawing.Point(0, 0);
            this.menuStrip.Name = "menuStrip";
            this.menuStrip.Padding = new System.Windows.Forms.Padding(4, 2, 0, 2);
            this.menuStrip.Size = new System.Drawing.Size(632, 24);
            this.menuStrip.TabIndex = 0;
            this.menuStrip.Text = "MenuStrip";
            // 
            // mnuSelectIdioma
            // 
            this.mnuSelectIdioma.Name = "mnuSelectIdioma";
            this.mnuSelectIdioma.Size = new System.Drawing.Size(116, 20);
            this.mnuSelectIdioma.Tag = "selectLanguage";
            this.mnuSelectIdioma.Text = "Seleccionar Idoma";
            this.mnuSelectIdioma.ToolTipText = "seleccionarIdioma";
            // 
            // rutinas
            // 
            this.rutinas.Name = "rutinas";
            this.rutinas.Size = new System.Drawing.Size(58, 20);
            this.rutinas.Text = "Rutinas";
            this.rutinas.Click += new System.EventHandler(this.rutinas_Click);
            // 
            // lblUsuario
            // 
            this.lblUsuario.Name = "lblUsuario";
            this.lblUsuario.Size = new System.Drawing.Size(0, 17);
            // 
            // statusStrip
            // 
            this.statusStrip.ImageScalingSize = new System.Drawing.Size(20, 20);
            this.statusStrip.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.lblUsuario});
            this.statusStrip.Location = new System.Drawing.Point(0, 431);
            this.statusStrip.Name = "statusStrip";
            this.statusStrip.Size = new System.Drawing.Size(632, 22);
            this.statusStrip.TabIndex = 2;
            this.statusStrip.Text = "StatusStrip";
            // 
            // configurarToolStripMenuItem
            // 
            this.configurarToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.ejerciciosToolStripMenuItem,
            this.aparatosToolStripMenuItem,
            this.gruposMuscularesToolStripMenuItem});
            this.configurarToolStripMenuItem.Name = "configurarToolStripMenuItem";
            this.configurarToolStripMenuItem.Size = new System.Drawing.Size(189, 22);
            this.configurarToolStripMenuItem.Tag = "configurar";
            this.configurarToolStripMenuItem.Text = "Configurar";
            // 
            // ejerciciosToolStripMenuItem
            // 
            this.ejerciciosToolStripMenuItem.Name = "ejerciciosToolStripMenuItem";
            this.ejerciciosToolStripMenuItem.Size = new System.Drawing.Size(180, 22);
            this.ejerciciosToolStripMenuItem.Tag = "ejercicios";
            this.ejerciciosToolStripMenuItem.Text = "Ejercicios";
            this.ejerciciosToolStripMenuItem.Click += new System.EventHandler(this.ejerciciosToolStripMenuItem_Click);
            // 
            // aparatosToolStripMenuItem
            // 
            this.aparatosToolStripMenuItem.Name = "aparatosToolStripMenuItem";
            this.aparatosToolStripMenuItem.Size = new System.Drawing.Size(180, 22);
            this.aparatosToolStripMenuItem.Tag = "aparatos";
            this.aparatosToolStripMenuItem.Text = "Aparatos";
            this.aparatosToolStripMenuItem.Click += new System.EventHandler(this.aparatosToolStripMenuItem_Click);
            // 
            // gruposMuscularesToolStripMenuItem
            // 
            this.gruposMuscularesToolStripMenuItem.Name = "gruposMuscularesToolStripMenuItem";
            this.gruposMuscularesToolStripMenuItem.Size = new System.Drawing.Size(180, 22);
            this.gruposMuscularesToolStripMenuItem.Tag = "gruposMusculares";
            this.gruposMuscularesToolStripMenuItem.Text = "Grupos Musculares";
            this.gruposMuscularesToolStripMenuItem.Click += new System.EventHandler(this.gruposMuscularesToolStripMenuItem_Click);
            // 
            // frmMain
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(632, 453);
            this.Controls.Add(this.statusStrip);
            this.Controls.Add(this.menuStrip);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.IsMdiContainer = true;
            this.MainMenuStrip = this.menuStrip;
            this.Name = "frmMain";
            this.SizeGripStyle = System.Windows.Forms.SizeGripStyle.Hide;
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Tag = "main";
            this.Text = "Main";
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            this.FormClosed += new System.Windows.Forms.FormClosedEventHandler(this.frmMain_FormClosed);
            this.Load += new System.EventHandler(this.frmMain_Load);
            this.menuStrip.ResumeLayout(false);
            this.menuStrip.PerformLayout();
            this.statusStrip.ResumeLayout(false);
            this.statusStrip.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }
        #endregion
        private System.Windows.Forms.ToolStripMenuItem mnuConfig;
        private System.Windows.Forms.MenuStrip menuStrip;
        private System.Windows.Forms.ToolStripMenuItem mnuPatentesFamilias;
        private System.Windows.Forms.ToolStripMenuItem mnuUsuarioPatentes;
        private System.Windows.Forms.ToolStripMenuItem mnuSelectIdioma;
        private System.Windows.Forms.ToolStripStatusLabel lblUsuario;
        private System.Windows.Forms.StatusStrip statusStrip;
        private System.Windows.Forms.ToolStripMenuItem usuariosToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem altaUsuario;
        private System.Windows.Forms.ToolStripMenuItem modificacionUsuario;
        private System.Windows.Forms.ToolStripMenuItem rutinas;
        private System.Windows.Forms.ToolStripMenuItem listaToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem configidioma;
        private System.Windows.Forms.ToolStripMenuItem changePasswordToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem logOutToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem configurarToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem ejerciciosToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem aparatosToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem gruposMuscularesToolStripMenuItem;
    }
}



