﻿using Business;
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
        }
        private void Rutines_FormClosed(object sender, FormClosedEventArgs e)
        {
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
            Translator.translate(this, language);
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