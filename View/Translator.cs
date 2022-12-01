using Models;
using Models.language;
using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace View
{
    public class Translator
    {

        public static void translate( Form form )
        {
            translate(form, Session.GetInstance.language);
        }

        public static void translate( Form form, Language language )
        {
            if ( language == null ) return;

            form.Text = getTranslation(language, form.Tag, form.Text);

            updateLanguageRecursiveControls(language, form.Controls);
        }

        private static void updateLanguageRecursiveControls( Language language, Control.ControlCollection parent )
        {
            foreach ( Control control in parent )
            {

                if ( control is DateTimePicker ) return;

                //if(control is GroupBox )
                //{
                //    control.Text = getTranslation(language, control.Tag, control.Text);
                //}
                if ( control is MenuStrip && ( (MenuStrip)control ).Items.Count != 0 )
                {
                    updateToolStrip(language, ( (MenuStrip)control ).Items);
                }

                if ( control is DataGridView )
                {
                    updateDataGridColumns((DataGridView)control, language);
                }

                if ( control.Controls.Count != 0 )
                {
                    updateLanguageRecursiveControls(language, control.Controls);
                }
                control.Text = getTranslation(language, control.Tag, control.Text);

            }
        }

        private static void updateToolStrip( Language language, ToolStripItemCollection parent )
        {
            foreach ( ToolStripMenuItem control in parent )
            {
                control.Text = getTranslation(language, control.Tag, control.Text);

                if ( control.DropDownItems.Count != 0 )
                {
                    updateToolStrip(language, control.DropDownItems);
                }
            }
        }

        private static void updateDataGridColumns( DataGridView dataGridView, Language language )
        {
            foreach ( DataGridViewColumn column in dataGridView.Columns )
            {
                column.HeaderText = getTranslation(language, column.Tag, column.HeaderText);


                if ( column is DataGridViewButtonColumn )
                {
                    ( column as DataGridViewButtonColumn ).Text = getTranslation(language, column.Tag, ( column as DataGridViewButtonColumn ).Text);
                }
            }

            dataGridView.Refresh();
        }

        private static String getTranslation( Language language, Object tag, String defaultText = "" )
        {
            if ( language == null ) return defaultText;
            if ( tag == null ) Console.WriteLine(" en algun lado falta un tag con el texto " + defaultText);
            if ( language.Translations.Find(
                      ( translation ) => translation.Key.Equals(tag)
                  )?.Translate == null ) Console.WriteLine("traduccion faltante:    " + tag + "   , texto: " + defaultText);

            return language.Translations.Find(
                       ( translation ) => translation.Key.Equals(tag)
                   )?.Translate ?? defaultText;
        }
    }
}
