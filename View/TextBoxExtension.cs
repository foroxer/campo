using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace View
{
    public static class TextBoxExtension
    {
        public static int GetInt( this TextBox textBox)
        {
            try
            {
                return int.Parse(textBox.Text);
            }
            catch
            {
                string text = "";
                if (textBox.Text == "" )
                {
                    text = "Por favor complete el campo ";

                }
                else
                {
                    text = "El dato " + textBox.Text + " debe ser numerico ";

                }
                configTooltip(textBox, text);

                throw new Exception(text);
            }
        }
        
        public static double GetDouble( this TextBox textBox)
        {
            try
            {
                return double.Parse(textBox.Text);
            }
            catch
            {
                string text = "El dato " + textBox.Text + " debe ser numerico ";
                configTooltip(textBox, text);

                throw new Exception("Este campo debe ser numerico ");
            }
        }

        public static float GetFloat(this TextBox textBox)
        {
            try
            {
                return float.Parse(textBox.Text);
            }
            catch
            {
                string text = "El dato " + textBox.Text + " debe ser de punto flotante ";
                configTooltip(textBox, text);

                throw new Exception("Este campo debe ser de punto flotante");
            }
        }

        public static string GetStringMinLength(this TextBox textBox, int minLength )
        {
            try
            {
                if(textBox.TextLength >= minLength)
                { 
                    
                    return textBox.Text;
                }

                throw new Exception("Longitud insuficiente");
            }
            catch 
            {
                string text = "El dato " + textBox.Text + " debe ser de una longitud minima  = " + minLength.ToString();
                configTooltip(textBox, text);
                throw;
            }
        }

        public static string GetMail(this TextBox textBox)
        {
            try
            {
                if (textBox.Text.Contains("@"))
                {
                    return textBox.Text;
                }
                throw new Exception("Este campo debe ser un mail");
                
            }
            catch
            {
                string text = "El dato " + textBox.Text + " debe ser un mail ";
                configTooltip(textBox, text);
                throw;
            }
        }
        private static void configTooltip(TextBox textBox, String text, int visibleTime = 3000)
        {
            ToolTip tt = new ToolTip();
            tt.IsBalloon = true;
            tt.Show(text, textBox, 0, -40, visibleTime);
        }
    }
}
