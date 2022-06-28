using Business;
using Models;
using Models.bussines;
using Models.interfaces;
using Models.language;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace View
{
    public partial class frmExercisesTest : Form,ILanguageObserber
    {
        ExerciseService exersiceService;
        public frmExercisesTest()
        {
            InitializeComponent();
            exersiceService = new ExerciseService();
            Session.GetInstance.addObserber(this);
        }
        private void Rutines_FormClosed(object sender, FormClosedEventArgs e)
        {
            Session.GetInstance.removeObserber(this);
        }
        private void Rutines_Load(object sender, EventArgs e)
        {
            comboBox1.DataSource = exersiceService.GetAllMachinetypes();
            comboBox2.DataSource = exersiceService.GetAllMuscularGroups();

            comboBox1.DisplayMember = "name";
            comboBox2.DisplayMember = "name";
            comboBox3.DisplayMember = "description";
            comboBox4.DisplayMember = "description";
            comboBox5.DisplayMember = "description";

            this.ControlBox = false;
            this.Dock = DockStyle.Fill;

        }
        public void updateLanguage(Language language)
        {
            foreach (Control control in Controls)
            {
                control.Text = language.Translations.Find(
                        (translation) => translation.Key.Equals(control.Tag)
                    )?.Translate ?? control.Text;
                if (control.Controls.Count != 0)
                {
                    updateLanguageRecursiveControls(language, control.Controls);
                }
            }
        }
        private void updateLanguageRecursiveControls(Language language, Control.ControlCollection parent)
        {
            foreach (Control control in parent)
            {
                control.Text = language.Translations.Find(
                        (translation) => translation.Key.Equals(control.Tag)
                    )?.Translate ?? control.Text;

                if (control.Controls.Count != 0)
                {
                    updateLanguageRecursiveControls(language, control.Controls);
                }
            }
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            comboBox3.DataSource = exersiceService.GetExercisesBy((Machine)comboBox1.SelectedItem);
            comboBox3.DisplayMember = "description";


            
        }

        private void comboBox2_SelectedIndexChanged(object sender, EventArgs e)
        {
            comboBox4.DataSource = exersiceService.GetExercisesBy((MuscularGroup)comboBox2.SelectedItem);

        }

        private void comboBox1_SelectionChangeCommitted(object sender, EventArgs e)
        {
            comboBox5.DataSource = exersiceService.GetExercisesBy((Machine)comboBox1.SelectedItem, (MuscularGroup)comboBox2.SelectedItem);

        }

        private void comboBox2_SelectionChangeCommitted(object sender, EventArgs e)
        {
            comboBox5.DataSource = exersiceService.GetExercisesBy((Machine)comboBox1.SelectedItem, (MuscularGroup)comboBox2.SelectedItem);

        }
    }
}
