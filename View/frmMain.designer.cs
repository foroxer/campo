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
            this.usuariosToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.altaUsuario = new System.Windows.Forms.ToolStripMenuItem();
            this.modificacionUsuario = new System.Windows.Forms.ToolStripMenuItem();
            this.listaToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.configidioma = new System.Windows.Forms.ToolStripMenuItem();
            this.asignarToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.configurarToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.ejerciciosToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.aparatosToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.gruposMuscularesToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.changePasswordToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.logOutToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.menuStrip = new System.Windows.Forms.MenuStrip();
            this.mnuSelectIdioma = new System.Windows.Forms.ToolStripMenuItem();
            this.rutinas = new System.Windows.Forms.ToolStripMenuItem();
            this.seguridadToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.baseDeDatosToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.backUpToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.restoreToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.dVRestoreToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.configToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuUsuarioPatentes = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuPatentesFamilias = new System.Windows.Forms.ToolStripMenuItem();
            this.usuariosToolStripMenuItem1 = new System.Windows.Forms.ToolStripMenuItem();
            this.controlDeCambiosToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.bitacoraToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.lblUsuario = new System.Windows.Forms.ToolStripStatusLabel();
            this.statusStrip = new System.Windows.Forms.StatusStrip();
            this.reportesToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.bitacoraToolStripMenuItem1 = new System.Windows.Forms.ToolStripMenuItem();
            this.menuStrip.SuspendLayout();
            this.statusStrip.SuspendLayout();
            this.SuspendLayout();
            // 
            // mnuConfig
            // 
            this.mnuConfig.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.usuariosToolStripMenuItem,
            this.configidioma,
            this.asignarToolStripMenuItem,
            this.configurarToolStripMenuItem,
            this.changePasswordToolStripMenuItem,
            this.logOutToolStripMenuItem});
            this.mnuConfig.ImageTransparentColor = System.Drawing.SystemColors.ActiveBorder;
            this.mnuConfig.Name = "mnuConfig";
            this.mnuConfig.Size = new System.Drawing.Size(59, 24);
            this.mnuConfig.Tag = "inicio";
            this.mnuConfig.Text = "Inicio";
            // 
            // usuariosToolStripMenuItem
            // 
            this.usuariosToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.altaUsuario,
            this.modificacionUsuario,
            this.listaToolStripMenuItem});
            this.usuariosToolStripMenuItem.Name = "usuariosToolStripMenuItem";
            this.usuariosToolStripMenuItem.Size = new System.Drawing.Size(213, 26);
            this.usuariosToolStripMenuItem.Tag = "usuarios";
            this.usuariosToolStripMenuItem.Text = "Usuarios";
            // 
            // altaUsuario
            // 
            this.altaUsuario.Name = "altaUsuario";
            this.altaUsuario.Size = new System.Drawing.Size(179, 26);
            this.altaUsuario.Tag = "alta";
            this.altaUsuario.Text = "Alta";
            this.altaUsuario.Click += new System.EventHandler(this.altaUsuario_Click);
            // 
            // modificacionUsuario
            // 
            this.modificacionUsuario.Name = "modificacionUsuario";
            this.modificacionUsuario.Size = new System.Drawing.Size(179, 26);
            this.modificacionUsuario.Tag = "modificacion";
            this.modificacionUsuario.Text = "Modificacion";
            this.modificacionUsuario.Click += new System.EventHandler(this.modificacionUsuario_Click);
            // 
            // listaToolStripMenuItem
            // 
            this.listaToolStripMenuItem.Name = "listaToolStripMenuItem";
            this.listaToolStripMenuItem.Size = new System.Drawing.Size(179, 26);
            this.listaToolStripMenuItem.Tag = "lista";
            this.listaToolStripMenuItem.Text = "Lista";
            this.listaToolStripMenuItem.Click += new System.EventHandler(this.listaToolStripMenuItem_Click);
            // 
            // configidioma
            // 
            this.configidioma.Name = "configidioma";
            this.configidioma.Size = new System.Drawing.Size(213, 26);
            this.configidioma.Tag = "idioma";
            this.configidioma.Text = "Idioma";
            this.configidioma.Click += new System.EventHandler(this.idiomaToolStripMenuItem_Click);
            // 
            // asignarToolStripMenuItem
            // 
            this.asignarToolStripMenuItem.Name = "asignarToolStripMenuItem";
            this.asignarToolStripMenuItem.Size = new System.Drawing.Size(213, 26);
            this.asignarToolStripMenuItem.Tag = "asignar";
            this.asignarToolStripMenuItem.Text = "Asignar ejercicios";
            this.asignarToolStripMenuItem.Click += new System.EventHandler(this.asignarToolStripMenuItem_Click);
            // 
            // configurarToolStripMenuItem
            // 
            this.configurarToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.ejerciciosToolStripMenuItem,
            this.aparatosToolStripMenuItem,
            this.gruposMuscularesToolStripMenuItem});
            this.configurarToolStripMenuItem.Name = "configurarToolStripMenuItem";
            this.configurarToolStripMenuItem.Size = new System.Drawing.Size(213, 26);
            this.configurarToolStripMenuItem.Tag = "configurar";
            this.configurarToolStripMenuItem.Text = "Configurar";
            // 
            // ejerciciosToolStripMenuItem
            // 
            this.ejerciciosToolStripMenuItem.Name = "ejerciciosToolStripMenuItem";
            this.ejerciciosToolStripMenuItem.Size = new System.Drawing.Size(216, 26);
            this.ejerciciosToolStripMenuItem.Tag = "ejercicios";
            this.ejerciciosToolStripMenuItem.Text = "Ejercicios";
            this.ejerciciosToolStripMenuItem.Click += new System.EventHandler(this.ejerciciosToolStripMenuItem_Click);
            // 
            // aparatosToolStripMenuItem
            // 
            this.aparatosToolStripMenuItem.Name = "aparatosToolStripMenuItem";
            this.aparatosToolStripMenuItem.Size = new System.Drawing.Size(216, 26);
            this.aparatosToolStripMenuItem.Tag = "aparatos";
            this.aparatosToolStripMenuItem.Text = "Aparatos";
            this.aparatosToolStripMenuItem.Click += new System.EventHandler(this.aparatosToolStripMenuItem_Click);
            // 
            // gruposMuscularesToolStripMenuItem
            // 
            this.gruposMuscularesToolStripMenuItem.Name = "gruposMuscularesToolStripMenuItem";
            this.gruposMuscularesToolStripMenuItem.Size = new System.Drawing.Size(216, 26);
            this.gruposMuscularesToolStripMenuItem.Tag = "gruposMusculares";
            this.gruposMuscularesToolStripMenuItem.Text = "Grupos Musculares";
            this.gruposMuscularesToolStripMenuItem.Click += new System.EventHandler(this.gruposMuscularesToolStripMenuItem_Click);
            // 
            // changePasswordToolStripMenuItem
            // 
            this.changePasswordToolStripMenuItem.Name = "changePasswordToolStripMenuItem";
            this.changePasswordToolStripMenuItem.Size = new System.Drawing.Size(213, 26);
            this.changePasswordToolStripMenuItem.Tag = "resetPssword";
            this.changePasswordToolStripMenuItem.Text = "Cambiar Password";
            this.changePasswordToolStripMenuItem.Click += new System.EventHandler(this.changePasswordToolStripMenuItem_Click);
            // 
            // logOutToolStripMenuItem
            // 
            this.logOutToolStripMenuItem.Name = "logOutToolStripMenuItem";
            this.logOutToolStripMenuItem.Size = new System.Drawing.Size(213, 26);
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
            this.rutinas,
            this.seguridadToolStripMenuItem,
            this.configToolStripMenuItem});
            this.menuStrip.Location = new System.Drawing.Point(0, 0);
            this.menuStrip.Name = "menuStrip";
            this.menuStrip.Padding = new System.Windows.Forms.Padding(5, 2, 0, 2);
            this.menuStrip.Size = new System.Drawing.Size(843, 28);
            this.menuStrip.TabIndex = 0;
            this.menuStrip.Text = "MenuStrip";
            // 
            // mnuSelectIdioma
            // 
            this.mnuSelectIdioma.Name = "mnuSelectIdioma";
            this.mnuSelectIdioma.Size = new System.Drawing.Size(146, 24);
            this.mnuSelectIdioma.Tag = "selectLanguage";
            this.mnuSelectIdioma.Text = "Seleccionar Idoma";
            this.mnuSelectIdioma.ToolTipText = "seleccionarIdioma";
            // 
            // rutinas
            // 
            this.rutinas.Name = "rutinas";
            this.rutinas.Size = new System.Drawing.Size(71, 24);
            this.rutinas.Tag = "rutinas";
            this.rutinas.Text = "Rutinas";
            this.rutinas.Click += new System.EventHandler(this.rutinas_Click);
            // 
            // seguridadToolStripMenuItem
            // 
            this.seguridadToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.baseDeDatosToolStripMenuItem,
            this.reportesToolStripMenuItem});
            this.seguridadToolStripMenuItem.Name = "seguridadToolStripMenuItem";
            this.seguridadToolStripMenuItem.Size = new System.Drawing.Size(91, 24);
            this.seguridadToolStripMenuItem.Text = "Seguridad";
            // 
            // baseDeDatosToolStripMenuItem
            // 
            this.baseDeDatosToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.backUpToolStripMenuItem,
            this.restoreToolStripMenuItem,
            this.dVRestoreToolStripMenuItem});
            this.baseDeDatosToolStripMenuItem.Name = "baseDeDatosToolStripMenuItem";
            this.baseDeDatosToolStripMenuItem.Size = new System.Drawing.Size(224, 26);
            this.baseDeDatosToolStripMenuItem.Text = "Base de datos";
            // 
            // backUpToolStripMenuItem
            // 
            this.backUpToolStripMenuItem.Name = "backUpToolStripMenuItem";
            this.backUpToolStripMenuItem.Size = new System.Drawing.Size(166, 26);
            this.backUpToolStripMenuItem.Text = "BackUp";
            this.backUpToolStripMenuItem.Click += new System.EventHandler(this.backUpToolStripMenuItem_Click);
            // 
            // restoreToolStripMenuItem
            // 
            this.restoreToolStripMenuItem.Name = "restoreToolStripMenuItem";
            this.restoreToolStripMenuItem.Size = new System.Drawing.Size(166, 26);
            this.restoreToolStripMenuItem.Text = "Restore";
            this.restoreToolStripMenuItem.Click += new System.EventHandler(this.restoreToolStripMenuItem_Click);
            // 
            // dVRestoreToolStripMenuItem
            // 
            this.dVRestoreToolStripMenuItem.Name = "dVRestoreToolStripMenuItem";
            this.dVRestoreToolStripMenuItem.Size = new System.Drawing.Size(166, 26);
            this.dVRestoreToolStripMenuItem.Text = "DV Restore";
            this.dVRestoreToolStripMenuItem.Click += new System.EventHandler(this.dVRestoreToolStripMenuItem_Click);
            // 
            // configToolStripMenuItem
            // 
            this.configToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.mnuUsuarioPatentes,
            this.mnuPatentesFamilias,
            this.usuariosToolStripMenuItem1,
            this.bitacoraToolStripMenuItem});
            this.configToolStripMenuItem.Name = "configToolStripMenuItem";
            this.configToolStripMenuItem.Size = new System.Drawing.Size(67, 24);
            this.configToolStripMenuItem.Tag = "Config";
            this.configToolStripMenuItem.Text = "Config";
            // 
            // mnuUsuarioPatentes
            // 
            this.mnuUsuarioPatentes.Name = "mnuUsuarioPatentes";
            this.mnuUsuarioPatentes.Size = new System.Drawing.Size(235, 26);
            this.mnuUsuarioPatentes.Tag = "permisos";
            this.mnuUsuarioPatentes.Text = "Permisos de Usuarios ";
            this.mnuUsuarioPatentes.Click += new System.EventHandler(this.mnuUsuarioPatentes_Click);
            // 
            // mnuPatentesFamilias
            // 
            this.mnuPatentesFamilias.Name = "mnuPatentesFamilias";
            this.mnuPatentesFamilias.Size = new System.Drawing.Size(235, 26);
            this.mnuPatentesFamilias.Tag = "patentesyfamilias";
            this.mnuPatentesFamilias.Text = "Patentes y Familias";
            this.mnuPatentesFamilias.Click += new System.EventHandler(this.mnuPatentesFamilias_Click);
            // 
            // usuariosToolStripMenuItem1
            // 
            this.usuariosToolStripMenuItem1.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.controlDeCambiosToolStripMenuItem});
            this.usuariosToolStripMenuItem1.Name = "usuariosToolStripMenuItem1";
            this.usuariosToolStripMenuItem1.Size = new System.Drawing.Size(235, 26);
            this.usuariosToolStripMenuItem1.Tag = "usuarios";
            this.usuariosToolStripMenuItem1.Text = "Usuarios";
            // 
            // controlDeCambiosToolStripMenuItem
            // 
            this.controlDeCambiosToolStripMenuItem.Name = "controlDeCambiosToolStripMenuItem";
            this.controlDeCambiosToolStripMenuItem.Size = new System.Drawing.Size(222, 26);
            this.controlDeCambiosToolStripMenuItem.Tag = "controldecambios";
            this.controlDeCambiosToolStripMenuItem.Text = "Control de cambios";
            this.controlDeCambiosToolStripMenuItem.Click += new System.EventHandler(this.controlDeCambiosToolStripMenuItem_Click);
            // 
            // bitacoraToolStripMenuItem
            // 
            this.bitacoraToolStripMenuItem.Name = "bitacoraToolStripMenuItem";
            this.bitacoraToolStripMenuItem.Size = new System.Drawing.Size(235, 26);
            this.bitacoraToolStripMenuItem.Tag = "bitacora";
            this.bitacoraToolStripMenuItem.Text = "Bitacora";
            this.bitacoraToolStripMenuItem.Click += new System.EventHandler(this.bitacoraToolStripMenuItem_Click);
            // 
            // lblUsuario
            // 
            this.lblUsuario.Name = "lblUsuario";
            this.lblUsuario.Size = new System.Drawing.Size(0, 16);
            // 
            // statusStrip
            // 
            this.statusStrip.ImageScalingSize = new System.Drawing.Size(20, 20);
            this.statusStrip.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.lblUsuario});
            this.statusStrip.Location = new System.Drawing.Point(0, 536);
            this.statusStrip.Name = "statusStrip";
            this.statusStrip.Padding = new System.Windows.Forms.Padding(1, 0, 19, 0);
            this.statusStrip.Size = new System.Drawing.Size(843, 22);
            this.statusStrip.TabIndex = 2;
            this.statusStrip.Text = "StatusStrip";
            // 
            // reportesToolStripMenuItem
            // 
            this.reportesToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.bitacoraToolStripMenuItem1});
            this.reportesToolStripMenuItem.Name = "reportesToolStripMenuItem";
            this.reportesToolStripMenuItem.Size = new System.Drawing.Size(224, 26);
            this.reportesToolStripMenuItem.Text = "Reportes";
            // 
            // bitacoraToolStripMenuItem1
            // 
            this.bitacoraToolStripMenuItem1.Name = "bitacoraToolStripMenuItem1";
            this.bitacoraToolStripMenuItem1.Size = new System.Drawing.Size(224, 26);
            this.bitacoraToolStripMenuItem1.Text = "Bitacora";
            this.bitacoraToolStripMenuItem1.Click += new System.EventHandler(this.bitacoraToolStripMenuItem1_Click);
            // 
            // frmMain
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(843, 558);
            this.Controls.Add(this.statusStrip);
            this.Controls.Add(this.menuStrip);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.IsMdiContainer = true;
            this.MainMenuStrip = this.menuStrip;
            this.Margin = new System.Windows.Forms.Padding(4);
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
        private System.Windows.Forms.ToolStripMenuItem asignarToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem seguridadToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem baseDeDatosToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem backUpToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem restoreToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem configToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem mnuUsuarioPatentes;
        private System.Windows.Forms.ToolStripMenuItem mnuPatentesFamilias;
        private System.Windows.Forms.ToolStripMenuItem usuariosToolStripMenuItem1;
        private System.Windows.Forms.ToolStripMenuItem controlDeCambiosToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem bitacoraToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem dVRestoreToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem reportesToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem bitacoraToolStripMenuItem1;
    }
}



