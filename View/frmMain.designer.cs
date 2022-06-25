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
            this.fileMenu = new System.Windows.Forms.ToolStripMenuItem();
            this.seguridadToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.usuariosToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.menuStrip = new System.Windows.Forms.MenuStrip();
            this.mnuEjemplo = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuA = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuB = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuC = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuD = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuE = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuG = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuSelectIdioma = new System.Windows.Forms.ToolStripMenuItem();
            this.formNuevoToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.ventasToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.lblUsuario = new System.Windows.Forms.ToolStripStatusLabel();
            this.statusStrip = new System.Windows.Forms.StatusStrip();
            this.testToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.test1ToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.test2ToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.menuStrip.SuspendLayout();
            this.statusStrip.SuspendLayout();
            this.SuspendLayout();
            // 
            // fileMenu
            // 
            this.fileMenu.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.seguridadToolStripMenuItem,
            this.usuariosToolStripMenuItem});
            this.fileMenu.ImageTransparentColor = System.Drawing.SystemColors.ActiveBorder;
            this.fileMenu.Name = "fileMenu";
            this.fileMenu.Size = new System.Drawing.Size(95, 20);
            this.fileMenu.Tag = "configuracion";
            this.fileMenu.Text = "Configuración";
            // 
            // seguridadToolStripMenuItem
            // 
            this.seguridadToolStripMenuItem.Name = "seguridadToolStripMenuItem";
            this.seguridadToolStripMenuItem.Size = new System.Drawing.Size(180, 22);
            this.seguridadToolStripMenuItem.Tag = "patentesyfamilias";
            this.seguridadToolStripMenuItem.Text = "Patentes y Familias";
            this.seguridadToolStripMenuItem.Click += new System.EventHandler(this.SeguridadToolStripMenuItem_Click);
            // 
            // usuariosToolStripMenuItem
            // 
            this.usuariosToolStripMenuItem.Name = "usuariosToolStripMenuItem";
            this.usuariosToolStripMenuItem.Size = new System.Drawing.Size(180, 22);
            this.usuariosToolStripMenuItem.Text = "Usuarios";
            this.usuariosToolStripMenuItem.Click += new System.EventHandler(this.UsuariosToolStripMenuItem_Click);
            // 
            // menuStrip
            // 
            this.menuStrip.ImageScalingSize = new System.Drawing.Size(20, 20);
            this.menuStrip.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.fileMenu,
            this.mnuEjemplo,
            this.formNuevoToolStripMenuItem,
            this.mnuSelectIdioma,
            this.testToolStripMenuItem});
            this.menuStrip.Location = new System.Drawing.Point(0, 0);
            this.menuStrip.Name = "menuStrip";
            this.menuStrip.Padding = new System.Windows.Forms.Padding(4, 2, 0, 2);
            this.menuStrip.Size = new System.Drawing.Size(632, 24);
            this.menuStrip.TabIndex = 0;
            this.menuStrip.Text = "MenuStrip";
            // 
            // mnuEjemplo
            // 
            this.mnuEjemplo.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.mnuA,
            this.mnuB,
            this.mnuC,
            this.mnuD,
            this.mnuE,
            this.mnuG});
            this.mnuEjemplo.Name = "mnuEjemplo";
            this.mnuEjemplo.Size = new System.Drawing.Size(96, 20);
            this.mnuEjemplo.Text = "Menu ejemplo";
            // 
            // mnuA
            // 
            this.mnuA.Name = "mnuA";
            this.mnuA.Size = new System.Drawing.Size(180, 22);
            this.mnuA.Text = "Puede hacer A";
            // 
            // mnuB
            // 
            this.mnuB.Name = "mnuB";
            this.mnuB.Size = new System.Drawing.Size(180, 22);
            this.mnuB.Text = "Puede hacer B";
            // 
            // mnuC
            // 
            this.mnuC.Name = "mnuC";
            this.mnuC.Size = new System.Drawing.Size(180, 22);
            this.mnuC.Text = "Puede hacer C";
            // 
            // mnuD
            // 
            this.mnuD.Name = "mnuD";
            this.mnuD.Size = new System.Drawing.Size(180, 22);
            this.mnuD.Text = "Puede hacer D";
            // 
            // mnuE
            // 
            this.mnuE.Name = "mnuE";
            this.mnuE.Size = new System.Drawing.Size(180, 22);
            this.mnuE.Text = "Puede hacer E";
            // 
            // mnuG
            // 
            this.mnuG.Name = "mnuG";
            this.mnuG.Size = new System.Drawing.Size(180, 22);
            this.mnuG.Text = "Puede hacer G";
            // 
            // mnuSelectIdioma
            // 
            this.mnuSelectIdioma.Name = "mnuSelectIdioma";
            this.mnuSelectIdioma.Size = new System.Drawing.Size(116, 20);
            this.mnuSelectIdioma.Text = "Seleccionar Idoma";
            // 
            // formNuevoToolStripMenuItem
            // 
            this.formNuevoToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.ventasToolStripMenuItem});
            this.formNuevoToolStripMenuItem.Name = "formNuevoToolStripMenuItem";
            this.formNuevoToolStripMenuItem.Size = new System.Drawing.Size(83, 20);
            this.formNuevoToolStripMenuItem.Text = "Form nuevo";
            this.formNuevoToolStripMenuItem.Click += new System.EventHandler(this.FormNuevoToolStripMenuItem_Click);
            // 
            // ventasToolStripMenuItem
            // 
            this.ventasToolStripMenuItem.Name = "ventasToolStripMenuItem";
            this.ventasToolStripMenuItem.Size = new System.Drawing.Size(180, 22);
            this.ventasToolStripMenuItem.Text = "Ventas";
            this.ventasToolStripMenuItem.Click += new System.EventHandler(this.VentasToolStripMenuItem_Click);
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
            // testToolStripMenuItem
            // 
            this.testToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.test1ToolStripMenuItem});
            this.testToolStripMenuItem.Name = "testToolStripMenuItem";
            this.testToolStripMenuItem.Size = new System.Drawing.Size(38, 20);
            this.testToolStripMenuItem.Text = "test";
            // 
            // test1ToolStripMenuItem
            // 
            this.test1ToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.test2ToolStripMenuItem});
            this.test1ToolStripMenuItem.Name = "test1ToolStripMenuItem";
            this.test1ToolStripMenuItem.Size = new System.Drawing.Size(180, 22);
            this.test1ToolStripMenuItem.Text = "test1";
            // 
            // test2ToolStripMenuItem
            // 
            this.test2ToolStripMenuItem.Name = "test2ToolStripMenuItem";
            this.test2ToolStripMenuItem.Size = new System.Drawing.Size(180, 22);
            this.test2ToolStripMenuItem.Text = "test2";
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
            this.Text = "Main";
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.frmMain_FormClosing);
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
        private System.Windows.Forms.ToolStripMenuItem fileMenu;
        private System.Windows.Forms.MenuStrip menuStrip;
        private System.Windows.Forms.ToolStripMenuItem seguridadToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem usuariosToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem mnuEjemplo;
        private System.Windows.Forms.ToolStripMenuItem mnuA;
        private System.Windows.Forms.ToolStripMenuItem mnuB;
        private System.Windows.Forms.ToolStripMenuItem mnuC;
        private System.Windows.Forms.ToolStripMenuItem mnuD;
        private System.Windows.Forms.ToolStripMenuItem mnuE;
        private System.Windows.Forms.ToolStripMenuItem mnuG;
        private System.Windows.Forms.ToolStripMenuItem mnuSelectIdioma;
        private System.Windows.Forms.ToolStripMenuItem formNuevoToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem ventasToolStripMenuItem;
        private System.Windows.Forms.ToolStripStatusLabel lblUsuario;
        private System.Windows.Forms.StatusStrip statusStrip;
        private System.Windows.Forms.ToolStripMenuItem testToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem test1ToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem test2ToolStripMenuItem;
    }
}



