namespace View.venta
{
    partial class frmVentaAlta
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
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.UsuarioTxt = new System.Windows.Forms.TextBox();
            this.button1 = new System.Windows.Forms.Button();
            this.label4 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.comboBox1 = new System.Windows.Forms.ComboBox();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.groupBox3 = new System.Windows.Forms.GroupBox();
            this.cuponTxt = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.button2 = new System.Windows.Forms.Button();
            this.label2 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.productoVenta = new System.Windows.Forms.Label();
            this.usuarioVenta = new System.Windows.Forms.Label();
            this.label8 = new System.Windows.Forms.Label();
            this.label9 = new System.Windows.Forms.Label();
            this.subtotalVenta = new System.Windows.Forms.Label();
            this.cuponVenta = new System.Windows.Forms.Label();
            this.label12 = new System.Windows.Forms.Label();
            this.label13 = new System.Windows.Forms.Label();
            this.descuentoCuponVenta = new System.Windows.Forms.Label();
            this.label15 = new System.Windows.Forms.Label();
            this.totalVenta = new System.Windows.Forms.Label();
            this.button3 = new System.Windows.Forms.Button();
            this.button4 = new System.Windows.Forms.Button();
            this.percentualIcon = new System.Windows.Forms.Label();
            this.groupBox1.SuspendLayout();
            this.groupBox2.SuspendLayout();
            this.groupBox3.SuspendLayout();
            this.SuspendLayout();
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.comboBox1);
            this.groupBox1.Controls.Add(this.UsuarioTxt);
            this.groupBox1.Controls.Add(this.button1);
            this.groupBox1.Controls.Add(this.label4);
            this.groupBox1.Controls.Add(this.label1);
            this.groupBox1.Location = new System.Drawing.Point(12, 12);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(277, 271);
            this.groupBox1.TabIndex = 0;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "groupBox1";
            // 
            // UsuarioTxt
            // 
            this.UsuarioTxt.Location = new System.Drawing.Point(92, 98);
            this.UsuarioTxt.Name = "UsuarioTxt";
            this.UsuarioTxt.Size = new System.Drawing.Size(144, 22);
            this.UsuarioTxt.TabIndex = 5;
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(166, 206);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(70, 26);
            this.button1.TabIndex = 4;
            this.button1.Tag = "agregar";
            this.button1.Text = "Agregar";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(20, 101);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(54, 16);
            this.label4.TabIndex = 3;
            this.label4.Tag = "usuario";
            this.label4.Text = "Usuario";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(20, 45);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(61, 16);
            this.label1.TabIndex = 0;
            this.label1.Tag = "producto";
            this.label1.Text = "Producto";
            // 
            // comboBox1
            // 
            this.comboBox1.FormattingEnabled = true;
            this.comboBox1.Location = new System.Drawing.Point(92, 40);
            this.comboBox1.Name = "comboBox1";
            this.comboBox1.Size = new System.Drawing.Size(144, 24);
            this.comboBox1.TabIndex = 7;
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.percentualIcon);
            this.groupBox2.Controls.Add(this.label15);
            this.groupBox2.Controls.Add(this.totalVenta);
            this.groupBox2.Controls.Add(this.label13);
            this.groupBox2.Controls.Add(this.descuentoCuponVenta);
            this.groupBox2.Controls.Add(this.label9);
            this.groupBox2.Controls.Add(this.subtotalVenta);
            this.groupBox2.Controls.Add(this.cuponVenta);
            this.groupBox2.Controls.Add(this.label12);
            this.groupBox2.Controls.Add(this.label8);
            this.groupBox2.Controls.Add(this.usuarioVenta);
            this.groupBox2.Controls.Add(this.productoVenta);
            this.groupBox2.Controls.Add(this.label5);
            this.groupBox2.Controls.Add(this.label2);
            this.groupBox2.Location = new System.Drawing.Point(317, 12);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(420, 492);
            this.groupBox2.TabIndex = 8;
            this.groupBox2.TabStop = false;
            // 
            // groupBox3
            // 
            this.groupBox3.Controls.Add(this.button2);
            this.groupBox3.Controls.Add(this.cuponTxt);
            this.groupBox3.Controls.Add(this.label3);
            this.groupBox3.Location = new System.Drawing.Point(12, 289);
            this.groupBox3.Name = "groupBox3";
            this.groupBox3.Size = new System.Drawing.Size(277, 215);
            this.groupBox3.TabIndex = 9;
            this.groupBox3.TabStop = false;
            // 
            // cuponTxt
            // 
            this.cuponTxt.Location = new System.Drawing.Point(92, 41);
            this.cuponTxt.Name = "cuponTxt";
            this.cuponTxt.Size = new System.Drawing.Size(144, 22);
            this.cuponTxt.TabIndex = 8;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(20, 44);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(46, 16);
            this.label3.TabIndex = 7;
            this.label3.Tag = "cupon";
            this.label3.Text = "Cupon";
            // 
            // button2
            // 
            this.button2.Location = new System.Drawing.Point(166, 159);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(70, 26);
            this.button2.TabIndex = 8;
            this.button2.Tag = "agregar";
            this.button2.Text = "Agregar";
            this.button2.UseVisualStyleBackColor = true;
            this.button2.Click += new System.EventHandler(this.button2_Click);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(177, 30);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(89, 32);
            this.label2.TabIndex = 0;
            this.label2.Text = "Venta";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(29, 118);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(61, 16);
            this.label5.TabIndex = 8;
            this.label5.Tag = "";
            this.label5.Text = "Producto";
            // 
            // productoVenta
            // 
            this.productoVenta.AutoSize = true;
            this.productoVenta.Location = new System.Drawing.Point(127, 118);
            this.productoVenta.Name = "productoVenta";
            this.productoVenta.Size = new System.Drawing.Size(0, 20);
            this.productoVenta.TabIndex = 9;
            this.productoVenta.Tag = "";
            // 
            // usuarioVenta
            // 
            this.usuarioVenta.AutoSize = true;
            this.usuarioVenta.Location = new System.Drawing.Point(127, 163);
            this.usuarioVenta.Name = "usuarioVenta";
            this.usuarioVenta.Size = new System.Drawing.Size(0, 20);
            this.usuarioVenta.TabIndex = 10;
            this.usuarioVenta.Tag = "";
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(29, 163);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(54, 16);
            this.label8.TabIndex = 11;
            this.label8.Tag = "";
            this.label8.Text = "Usuario";
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Location = new System.Drawing.Point(243, 388);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(62, 16);
            this.label9.TabIndex = 15;
            this.label9.Tag = "";
            this.label9.Text = "SubTotal";
            // 
            // subtotalVenta
            // 
            this.subtotalVenta.AutoSize = true;
            this.subtotalVenta.Location = new System.Drawing.Point(341, 388);
            this.subtotalVenta.Name = "subtotalVenta";
            this.subtotalVenta.Size = new System.Drawing.Size(18, 20);
            this.subtotalVenta.TabIndex = 14;
            this.subtotalVenta.Tag = "";
            this.subtotalVenta.Text = "0";
            // 
            // cuponVenta
            // 
            this.cuponVenta.AutoSize = true;
            this.cuponVenta.Location = new System.Drawing.Point(127, 211);
            this.cuponVenta.Name = "cuponVenta";
            this.cuponVenta.Size = new System.Drawing.Size(0, 20);
            this.cuponVenta.TabIndex = 13;
            this.cuponVenta.Tag = "";
            // 
            // label12
            // 
            this.label12.AutoSize = true;
            this.label12.Location = new System.Drawing.Point(29, 211);
            this.label12.Name = "label12";
            this.label12.Size = new System.Drawing.Size(46, 16);
            this.label12.TabIndex = 12;
            this.label12.Tag = "";
            this.label12.Text = "Cupon";
            // 
            // label13
            // 
            this.label13.AutoSize = true;
            this.label13.Location = new System.Drawing.Point(243, 419);
            this.label13.Name = "label13";
            this.label13.Size = new System.Drawing.Size(72, 16);
            this.label13.TabIndex = 17;
            this.label13.Tag = "";
            this.label13.Text = "Descuento";
            // 
            // descuentoCuponVenta
            // 
            this.descuentoCuponVenta.AutoSize = true;
            this.descuentoCuponVenta.Location = new System.Drawing.Point(341, 419);
            this.descuentoCuponVenta.Name = "descuentoCuponVenta";
            this.descuentoCuponVenta.Size = new System.Drawing.Size(18, 20);
            this.descuentoCuponVenta.TabIndex = 16;
            this.descuentoCuponVenta.Tag = "";
            this.descuentoCuponVenta.Text = "0";
            // 
            // label15
            // 
            this.label15.AutoSize = true;
            this.label15.Location = new System.Drawing.Point(243, 446);
            this.label15.Name = "label15";
            this.label15.Size = new System.Drawing.Size(38, 16);
            this.label15.TabIndex = 19;
            this.label15.Tag = "";
            this.label15.Text = "Total";
            // 
            // totalVenta
            // 
            this.totalVenta.AutoSize = true;
            this.totalVenta.Location = new System.Drawing.Point(341, 446);
            this.totalVenta.Name = "totalVenta";
            this.totalVenta.Size = new System.Drawing.Size(18, 20);
            this.totalVenta.TabIndex = 18;
            this.totalVenta.Tag = "";
            this.totalVenta.Text = "0";
            // 
            // button3
            // 
            this.button3.Location = new System.Drawing.Point(641, 510);
            this.button3.Name = "button3";
            this.button3.Size = new System.Drawing.Size(97, 26);
            this.button3.TabIndex = 9;
            this.button3.Tag = "guardar";
            this.button3.Text = "Guardar";
            this.button3.UseVisualStyleBackColor = true;
            this.button3.Click += new System.EventHandler(this.button3_Click);
            // 
            // button4
            // 
            this.button4.Location = new System.Drawing.Point(552, 510);
            this.button4.Name = "button4";
            this.button4.Size = new System.Drawing.Size(80, 26);
            this.button4.TabIndex = 10;
            this.button4.Tag = "cancelar";
            this.button4.Text = "Cancelar";
            this.button4.UseVisualStyleBackColor = true;
            this.button4.Click += new System.EventHandler(this.button4_Click);
            // 
            // percentualIcon
            // 
            this.percentualIcon.AutoSize = true;
            this.percentualIcon.Location = new System.Drawing.Point(321, 419);
            this.percentualIcon.Name = "percentualIcon";
            this.percentualIcon.Size = new System.Drawing.Size(24, 20);
            this.percentualIcon.TabIndex = 20;
            this.percentualIcon.Tag = "";
            this.percentualIcon.Text = "%";
            // 
            // frmVentaAlta
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(750, 543);
            this.Controls.Add(this.button4);
            this.Controls.Add(this.button3);
            this.Controls.Add(this.groupBox3);
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.groupBox1);
            this.Margin = new System.Windows.Forms.Padding(4);
            this.Name = "frmVentaAlta";
            this.Tag = "ventas";
            this.Text = "Ventas";
            this.Load += new System.EventHandler(this.frmVentaAlta_Load);
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            this.groupBox3.ResumeLayout(false);
            this.groupBox3.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.TextBox UsuarioTxt;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.ComboBox comboBox1;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.Label label15;
        private System.Windows.Forms.Label totalVenta;
        private System.Windows.Forms.Label label13;
        private System.Windows.Forms.Label descuentoCuponVenta;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.Label subtotalVenta;
        private System.Windows.Forms.Label cuponVenta;
        private System.Windows.Forms.Label label12;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.Label usuarioVenta;
        private System.Windows.Forms.Label productoVenta;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.GroupBox groupBox3;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.TextBox cuponTxt;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Button button3;
        private System.Windows.Forms.Button button4;
        private System.Windows.Forms.Label percentualIcon;
    }
}