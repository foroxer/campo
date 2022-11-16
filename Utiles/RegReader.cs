using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Permissions;
using System.Text;
using System.Threading.Tasks;

namespace Utiles
{
    public class RegReader
    {
        public static string read( string reg )
        {
            RegistryKey key = Registry.CurrentUser.OpenSubKey(@"SOFTWARE\CustomSoft\Data");

            string response = "";
            if ( key != null )
            {
                response = key.GetValue(reg).ToString();
                key.Close();
            }

            return response;
        }

    }
}
