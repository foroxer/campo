using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace DigitosVerificadoresLib.services
{
    public class DVService
    {
        public static String getDV(String obj )
        {
            return hashSha256( obj );
        }

        private static string hashSha256( string toHash )
        {
            StringBuilder Sb = new StringBuilder();

            using ( SHA256 hash = SHA256Managed.Create() )
            {
                Encoding enc = Encoding.UTF8;
                Byte[] result = hash.ComputeHash(enc.GetBytes(toHash));

                foreach ( Byte b in result )
                    Sb.Append(b.ToString("x2"));
            }

            return Sb.ToString();
        }
    }
}
