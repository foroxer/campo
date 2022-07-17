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
                int VisibleTime = 3000;  //in milliseconds
                ToolTip tt = new ToolTip();
                tt.IsBalloon = true;
                string text = "El al dato " + textBox.Text + " debe ser numerico ";
                tt.Show(text, textBox.Parent, textBox.Location.X, textBox.Location.Y - 2 * textBox.Height, VisibleTime);

                throw;
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

                throw new Exception("longitud insuficiente");
            }
            catch
            {
                int VisibleTime = 3000;  //in milliseconds
                ToolTip tt = new ToolTip();
                string text = "El dato " + textBox.Text + " debe ser de una longitud minima  = " + minLength.ToString();
                //tt.IsBalloon = true;
                tt.Show(text, textBox.Parent, textBox.Location.X, textBox.Location.Y - textBox.Height , VisibleTime);

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
                throw new Exception("longitud insuficiente");
                
            }
            catch
            {
                int VisibleTime = 3000;  //in milliseconds
                ToolTip tt = new ToolTip();
                tt.IsBalloon = true;
                string text = "El dato " + textBox.Text + " debe ser un mail ";
                tt.Show(text, textBox.Parent, textBox.Location.X, textBox.Location.Y - 2 * textBox.Height, VisibleTime);

                throw;
            }
        }
    }
}
