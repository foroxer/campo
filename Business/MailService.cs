using System;
using System.IO;

namespace Business
{
    public static class MailService
    {
        public static void SendMail(String mailText, String mail)
        {
            //a modo ilustrativo, se genera un archivo de texto en el escritorio
            string DesktopPath = Environment.GetFolderPath(System.Environment.SpecialFolder.DesktopDirectory);
            FileStream fs = new FileStream(DesktopPath + @"\" + mail + @".txt", FileMode.OpenOrCreate, FileAccess.ReadWrite);
            StreamWriter sw = new StreamWriter(fs);
            sw.BaseStream.Seek(0, SeekOrigin.End);
            sw.WriteLine(mailText);
            sw.Flush();
            sw.Close();
        }
    }
}
