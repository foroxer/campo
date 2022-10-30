using Models;
using Models.language;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace View
{
    public class Translator
    {

        public static void translate(Form form)
        {
            translate(form, Session.GetInstance.language);
        }

        public static void translate(Form form, Language language)
        {

            if (language == null) return;
            form.Text = language.Translations.Find(
                       (translation) => translation.Key.Equals(form.Tag)
                   )?.Translate ?? form.Text;
            updateLanguageRecursiveControls(language, form.Controls);
        }

        private static void updateLanguageRecursiveControls(Language language, Control.ControlCollection parent)
        {
            foreach (Control control in parent)
            {
                control.Text = language.Translations.Find(
                        (translation) => translation.Key.Equals(control.Tag)
                    )?.Translate ?? control.Text;

                if (control.GetType().Equals(typeof(MenuStrip)) && ((MenuStrip)control).Items.Count != 0)
                {
                    updateToolStrip(language, ((MenuStrip)control).Items);
                }

                if (control.GetType().Equals(typeof(DataGridView)))
                {
                    updateDataGridColumns((DataGridView)control, language);
                }
                if (control.Controls.Count != 0)
                {
                    updateLanguageRecursiveControls(language, control.Controls);
                }
            }
        }

        private static void updateToolStrip(Language language, ToolStripItemCollection parent)
        {
            foreach (ToolStripMenuItem control in parent)
            {
                control.Text = language.Translations.Find(
                        (translation) => translation.Key.Equals(control.Tag)
                    )?.Translate ?? control.Text;

                if (control.DropDownItems.Count != 0)
                {
                    updateToolStrip(language, control.DropDownItems);
                }
            }
        }

        private static void updateDataGridColumns(DataGridView dataGridView, Language language)
        {
            foreach (DataGridViewColumn column in dataGridView.Columns)
            {
                column.HeaderText = language.Translations.Find(
                        (translation) => translation.Key.Equals(column.Tag)
                    )?.Translate ?? column.HeaderText;

                if (column.GetType().Equals(typeof(DataGridViewButtonColumn)))
                {
                    (column as DataGridViewButtonColumn).Text = language.Translations.Find(
                        (translation) => translation.Key.Equals(column.Tag)
                    )?.Translate ?? (column as DataGridViewButtonColumn).Text;
                }
            }

            dataGridView.Refresh();
        }
    }
}
