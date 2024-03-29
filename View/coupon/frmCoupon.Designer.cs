﻿namespace View.coupon
{
    partial class frmCoupon
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
            this.AltaBtn = new System.Windows.Forms.Button();
            this.dateTimePicker1 = new System.Windows.Forms.DateTimePicker();
            this.comboBox1 = new System.Windows.Forms.ComboBox();
            this.numericUpDown1 = new System.Windows.Forms.NumericUpDown();
            this.couponCodeAlta = new System.Windows.Forms.TextBox();
            this.descuentoLbl = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.disableBtn = new System.Windows.Forms.Button();
            this.enableBtn = new System.Windows.Forms.Button();
            this.enableDatePicker = new System.Windows.Forms.DateTimePicker();
            this.groupBox1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.numericUpDown1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            this.SuspendLayout();
            // 
            // groupBox1
            // 
            this.groupBox1.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left)));
            this.groupBox1.Controls.Add(this.AltaBtn);
            this.groupBox1.Controls.Add(this.dateTimePicker1);
            this.groupBox1.Controls.Add(this.comboBox1);
            this.groupBox1.Controls.Add(this.numericUpDown1);
            this.groupBox1.Controls.Add(this.couponCodeAlta);
            this.groupBox1.Controls.Add(this.descuentoLbl);
            this.groupBox1.Controls.Add(this.label3);
            this.groupBox1.Controls.Add(this.label2);
            this.groupBox1.Controls.Add(this.label1);
            this.groupBox1.Location = new System.Drawing.Point(12, 15);
            this.groupBox1.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Padding = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.groupBox1.Size = new System.Drawing.Size(360, 312);
            this.groupBox1.TabIndex = 0;
            this.groupBox1.TabStop = false;
            this.groupBox1.Tag = "alta";
            this.groupBox1.Text = "Alta";
            // 
            // AltaBtn
            // 
            this.AltaBtn.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.AltaBtn.Location = new System.Drawing.Point(255, 275);
            this.AltaBtn.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.AltaBtn.Name = "AltaBtn";
            this.AltaBtn.Size = new System.Drawing.Size(84, 31);
            this.AltaBtn.TabIndex = 10;
            this.AltaBtn.Tag = "guardar";
            this.AltaBtn.Text = "Guardar";
            this.AltaBtn.UseVisualStyleBackColor = true;
            this.AltaBtn.Click += new System.EventHandler(this.AltaBtn_Click);
            // 
            // dateTimePicker1
            // 
            this.dateTimePicker1.Location = new System.Drawing.Point(152, 106);
            this.dateTimePicker1.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.dateTimePicker1.MinDate = new System.DateTime(2022, 11, 29, 0, 0, 0, 0);
            this.dateTimePicker1.Name = "dateTimePicker1";
            this.dateTimePicker1.Size = new System.Drawing.Size(185, 22);
            this.dateTimePicker1.TabIndex = 9;
            // 
            // comboBox1
            // 
            this.comboBox1.FormattingEnabled = true;
            this.comboBox1.Location = new System.Drawing.Point(152, 70);
            this.comboBox1.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.comboBox1.Name = "comboBox1";
            this.comboBox1.Size = new System.Drawing.Size(185, 24);
            this.comboBox1.TabIndex = 8;
            this.comboBox1.SelectedIndexChanged += new System.EventHandler(this.comboBox1_SelectedIndexChanged);
            // 
            // numericUpDown1
            // 
            this.numericUpDown1.Location = new System.Drawing.Point(152, 138);
            this.numericUpDown1.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.numericUpDown1.Minimum = new decimal(new int[] {
            1,
            0,
            0,
            0});
            this.numericUpDown1.Name = "numericUpDown1";
            this.numericUpDown1.Size = new System.Drawing.Size(187, 22);
            this.numericUpDown1.TabIndex = 7;
            this.numericUpDown1.Value = new decimal(new int[] {
            1,
            0,
            0,
            0});
            // 
            // couponCodeAlta
            // 
            this.couponCodeAlta.Location = new System.Drawing.Point(152, 32);
            this.couponCodeAlta.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.couponCodeAlta.Name = "couponCodeAlta";
            this.couponCodeAlta.Size = new System.Drawing.Size(185, 22);
            this.couponCodeAlta.TabIndex = 5;
            this.couponCodeAlta.TextChanged += new System.EventHandler(this.couponCodeAlta_TextChanged);
            // 
            // descuentoLbl
            // 
            this.descuentoLbl.AutoSize = true;
            this.descuentoLbl.Location = new System.Drawing.Point(24, 146);
            this.descuentoLbl.Name = "descuentoLbl";
            this.descuentoLbl.Size = new System.Drawing.Size(72, 16);
            this.descuentoLbl.TabIndex = 4;
            this.descuentoLbl.Tag = "descuento";
            this.descuentoLbl.Text = "Descuento";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(24, 108);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(110, 16);
            this.label3.TabIndex = 3;
            this.label3.Tag = "fechaExpiracion";
            this.label3.Text = "Fecha expiracion";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(24, 70);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(35, 16);
            this.label2.TabIndex = 2;
            this.label2.Tag = "tipo";
            this.label2.Text = "Tipo";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(24, 32);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(51, 16);
            this.label1.TabIndex = 1;
            this.label1.Tag = "codigo";
            this.label1.Text = "Codigo";
            // 
            // dataGridView1
            // 
            this.dataGridView1.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Location = new System.Drawing.Point(392, 22);
            this.dataGridView1.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.RowHeadersWidth = 51;
            this.dataGridView1.Size = new System.Drawing.Size(663, 258);
            this.dataGridView1.TabIndex = 1;
            this.dataGridView1.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridView1_CellClick);
            this.dataGridView1.DataBindingComplete += new System.Windows.Forms.DataGridViewBindingCompleteEventHandler(this.dataGridView1_DataBindingComplete);
            // 
            // disableBtn
            // 
            this.disableBtn.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.disableBtn.Location = new System.Drawing.Point(955, 290);
            this.disableBtn.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.disableBtn.Name = "disableBtn";
            this.disableBtn.Size = new System.Drawing.Size(100, 31);
            this.disableBtn.TabIndex = 2;
            this.disableBtn.Tag = "deshabilitar";
            this.disableBtn.Text = "Deshabiitar";
            this.disableBtn.UseVisualStyleBackColor = true;
            this.disableBtn.Click += new System.EventHandler(this.disableBtn_Click);
            // 
            // enableBtn
            // 
            this.enableBtn.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.enableBtn.Location = new System.Drawing.Point(955, 290);
            this.enableBtn.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.enableBtn.Name = "enableBtn";
            this.enableBtn.Size = new System.Drawing.Size(100, 31);
            this.enableBtn.TabIndex = 3;
            this.enableBtn.Tag = "habilitar";
            this.enableBtn.Text = "Habilitar";
            this.enableBtn.UseVisualStyleBackColor = true;
            this.enableBtn.Click += new System.EventHandler(this.enableBtn_Click);
            // 
            // enableDatePicker
            // 
            this.enableDatePicker.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.enableDatePicker.Location = new System.Drawing.Point(760, 296);
            this.enableDatePicker.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.enableDatePicker.MinDate = new System.DateTime(2022, 11, 29, 0, 0, 0, 0);
            this.enableDatePicker.Name = "enableDatePicker";
            this.enableDatePicker.Size = new System.Drawing.Size(185, 22);
            this.enableDatePicker.TabIndex = 11;
            // 
            // frmCoupon
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1071, 341);
            this.Controls.Add(this.enableDatePicker);
            this.Controls.Add(this.dataGridView1);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.enableBtn);
            this.Controls.Add(this.disableBtn);
            this.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.Name = "frmCoupon";
            this.Tag = "cupones";
            this.Text = "Cupones";
            this.Load += new System.EventHandler(this.Coupon_Load);
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.numericUpDown1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label descuentoLbl;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.DateTimePicker dateTimePicker1;
        private System.Windows.Forms.ComboBox comboBox1;
        private System.Windows.Forms.NumericUpDown numericUpDown1;
        private System.Windows.Forms.TextBox couponCodeAlta;
        private System.Windows.Forms.Button AltaBtn;
        private System.Windows.Forms.DataGridView dataGridView1;
        private System.Windows.Forms.Button disableBtn;
        private System.Windows.Forms.Button enableBtn;
        private System.Windows.Forms.DateTimePicker enableDatePicker;
    }
}