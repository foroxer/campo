using Business;
using Models.interfaces;
using Models.language;
using System;
using System.Windows.Forms;
using Utiles;
using System.Linq;


namespace View.language
{
    public partial class frmLanguageL : Form, ILanguageObserber
    {
        LanguageService languageService;
        public frmLanguageL()
        {
            InitializeComponent();
            languageService = new LanguageService();
        }

        public void updateLanguage(Language language)
        {
            Translator.translate(this, language);
        }

        private void frmLanguagesList_Load(object sender, EventArgs e)
        {
            Dock = DockStyle.Fill;

            configDatagridTranslations();
        }

        private void configDatagridTranslations()
        {
            DataGridView dgv = dataGridView1;
            dgv.DataSource = languageService.GetDataSet();
            dgv.DataMember = "mitabla";

            dgv.AllowUserToAddRows = false;
            dgv.AllowUserToDeleteRows = false;
            dgv.AllowUserToResizeRows = false;
            dgv.RowHeadersWidthSizeMode = DataGridViewRowHeadersWidthSizeMode.DisableResizing;
            dgv.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.DisableResizing;
            dgv.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dgv.ReadOnly = true;
            dgv.SelectionMode = DataGridViewSelectionMode.CellSelect;
            dgv.RowHeadersVisible = false;
            dgv.MultiSelect = false;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            (MdiParent as frmMain).createForm(typeof(frmLanguageA));
        }

        private void frmLanguageL_Activated(object sender, EventArgs e)
        {
            configDatagridTranslations();
        }


        private void dataGridView2_SelectionChanged(object sender, EventArgs e)
        {
            if (dataGridView1?.CurrentCell?.ColumnIndex == 0 || dataGridView1?.CurrentCell == null)
            {
                button2.Visible = false;
                button3.Visible = false;
                textBox1.Visible = false;
                return;
            }
            textBox1.Visible = true;
            textBox1.Text = dataGridView1.CurrentCell.Value.ToString();


            if (dataGridView1.CurrentCell.Value.ToString().IsNullOrEmpty())
            {
                button2.Visible = true;
                button3.Visible = false;
            }
            else
            {
                button2.Visible = false;
                button3.Visible = true;
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            if (dataGridView1.CurrentCell.ColumnIndex == 0) return;
            if (textBox1.Text.RemoveWhitespaces().IsNullOrEmpty())
            {
                MessageBox.Show("Introduzca un valor valido");
                return;
            }
            DataGridViewCell selected = dataGridView1.CurrentCell;
            string value = textBox1.Text;
            string languageName = dataGridView1.Columns[selected.ColumnIndex].HeaderText;
            string key = dataGridView1.Rows[selected.RowIndex].Cells[0].Value.ToString();
            languageService.createTranslation(key, value, languageName);
            configDatagridTranslations();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            if (dataGridView1.CurrentCell.ColumnIndex == 0) return;
            if (textBox1.Text.RemoveWhitespaces().IsNullOrEmpty())
            {
                MessageBox.Show("Introduzca un valor valido");
                return;
            }
            DataGridViewCell selected = dataGridView1.CurrentCell;
            string value = textBox1.Text;
            string languageName = dataGridView1.Columns[selected.ColumnIndex].HeaderText;
            string key = dataGridView1.Rows[selected.RowIndex].Cells[0].Value.ToString();
            languageService.updateTranslation(key, value, languageName);
            configDatagridTranslations();
        }
    }
}
