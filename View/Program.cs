﻿using System;
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
using static System.Windows.Forms.AxHost;
using System.Drawing.Text;
using System.Runtime.InteropServices;
using Business;
using System.Reflection;
using Models.venta;
using Business.Coupons;

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
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);

            try
            {
                BitacoraService.config(ConnectionSingleton.getConnection(), "bitacora");
            }
            catch
            {
                
            }
            Application.Run(new PreCheck());
        }
    }
}
