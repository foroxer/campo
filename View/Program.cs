using System;
using System.Threading;
using System.Windows.Forms;
using BitacoraLib.services;
using BitacoraLib.entities;
using Utiles;
using System.Collections.Generic;
using DigitosVerificadoresLib.services;
using Models;
using Models.interfaces;
using Models.language;

namespace View
{
    internal static class Program
    {
        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        static void Main()
        {
            Thread.CurrentThread.CurrentUICulture = new System.Globalization.CultureInfo("es");
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
           
            
            BitacoraService.config(ConnectionSingleton.getConnection(), "bitacora");

            DVService dVService = new DVService();
            User user = new User();
            user.Adress = "adasd";
            user.Id = 123;
            Language l = new Language();
            l.Name = "asdasd";
            l.ID = 1234;
            user.Language = l;
            dVService.getDvv<User>(user);
            //Ejemplos de uso Bitacora
            BitacoraService.register(PriorityEnum.Low, "Start up");
            //List<IRegistry> list =  BitacoraService.getRegisters();
           
            Application.Run(new frmLogin());
        }
    }
}
