namespace View.dbmanage
{
    partial class frmBackup
    {

        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose( bool disposing )
        {
            if ( disposing && ( components != null ) )
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
            this.pathtxt = new System.Windows.Forms.TextBox();
            this.btnCancelar = new System.Windows.Forms.Button();
            this.partesCB = new System.Windows.Forms.ComboBox();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.btnExaminar = new System.Windows.Forms.Button();
            this.label2 = new System.Windows.Forms.Label();
            this.btnRespaldar = new System.Windows.Forms.Button();
            this.groupBox1.SuspendLayout();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(8, 119);
            this.label1.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(122, 16);
            this.label1.TabIndex = 0;
            this.label1.Tag = "cantidaddepartes";
            this.label1.Text = "Cantidad de Partes";
            // 
            // pathtxt
            // 
            this.pathtxt.Enabled = false;
            this.pathtxt.Location = new System.Drawing.Point(171, 58);
            this.pathtxt.Margin = new System.Windows.Forms.Padding(4);
            this.pathtxt.Name = "pathtxt";
            this.pathtxt.Size = new System.Drawing.Size(399, 22);
            this.pathtxt.TabIndex = 1;
            // 
            // btnCancelar
            // 
            this.btnCancelar.Location = new System.Drawing.Point(613, 250);
            this.btnCancelar.Margin = new System.Windows.Forms.Padding(4);
            this.btnCancelar.Name = "btnCancelar";
            this.btnCancelar.Size = new System.Drawing.Size(105, 28);
            this.btnCancelar.TabIndex = 2;
            this.btnCancelar.Tag = "Cancelar";
            this.btnCancelar.Text = "Cancelar";
            this.btnCancelar.UseVisualStyleBackColor = true;
            this.btnCancelar.Click += new System.EventHandler(this.btnCancelar_Click);
            // 
            // partesCB
            // 
            this.partesCB.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.partesCB.FormattingEnabled = true;
            this.partesCB.Location = new System.Drawing.Point(171, 110);
            this.partesCB.Margin = new System.Windows.Forms.Padding(4);
            this.partesCB.MaxDropDownItems = 10;
            this.partesCB.Name = "partesCB";
            this.partesCB.Size = new System.Drawing.Size(399, 24);
            this.partesCB.TabIndex = 3;
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.btnExaminar);
            this.groupBox1.Controls.Add(this.label2);
            this.groupBox1.Controls.Add(this.label1);
            this.groupBox1.Controls.Add(this.btnRespaldar);
            this.groupBox1.Controls.Add(this.pathtxt);
            this.groupBox1.Controls.Add(this.partesCB);
            this.groupBox1.Controls.Add(this.btnCancelar);
            this.groupBox1.Location = new System.Drawing.Point(16, 15);
            this.groupBox1.Margin = new System.Windows.Forms.Padding(4);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Padding = new System.Windows.Forms.Padding(4);
            this.groupBox1.Size = new System.Drawing.Size(731, 286);
            this.groupBox1.TabIndex = 4;
            this.groupBox1.TabStop = false;
            this.groupBox1.Tag = "generarrespaldo";
            this.groupBox1.Text = "Generar Respaldo";
            // 
            // btnExaminar
            // 
            this.btnExaminar.Location = new System.Drawing.Point(613, 54);
            this.btnExaminar.Margin = new System.Windows.Forms.Padding(4);
            this.btnExaminar.Name = "btnExaminar";
            this.btnExaminar.Size = new System.Drawing.Size(105, 28);
            this.btnExaminar.TabIndex = 6;
            this.btnExaminar.Tag = "examinar";
            this.btnExaminar.Text = "Examinar";
            this.btnExaminar.UseVisualStyleBackColor = true;
            this.btnExaminar.Click += new System.EventHandler(this.btnExaminar_Click);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(8, 66);
            this.label2.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(124, 16);
            this.label2.TabIndex = 5;
            this.label2.Tag = "seleccionedestino";
            this.label2.Text = "Seleccione Destino";
            // 
            // btnRespaldar
            // 
            this.btnRespaldar.Location = new System.Drawing.Point(12, 250);
            this.btnRespaldar.Margin = new System.Windows.Forms.Padding(4);
            this.btnRespaldar.Name = "btnRespaldar";
            this.btnRespaldar.Size = new System.Drawing.Size(100, 28);
            this.btnRespaldar.TabIndex = 4;
            this.btnRespaldar.Tag = "Respaldar";
            this.btnRespaldar.Text = "Respaldar";
            this.btnRespaldar.UseVisualStyleBackColor = true;
            this.btnRespaldar.Click += new System.EventHandler(this.btnRespaldar_Click);
            // 
            // frmBackup
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(780, 336);
            this.Controls.Add(this.groupBox1);
            this.Margin = new System.Windows.Forms.Padding(4);
            this.Name = "frmBackup";
            this.Tag = "backup";
            this.Text = "Respaldo Base de Datos";
            this.Load += new System.EventHandler(this.backup_Load);
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox pathtxt;
        private System.Windows.Forms.Button btnCancelar;
        private System.Windows.Forms.ComboBox partesCB;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.Button btnExaminar;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Button btnRespaldar;
    }

}