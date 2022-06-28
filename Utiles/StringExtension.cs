using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Utiles
{
    public static class StringExtension
    {
        public static string NullOrEmpty(this String str)
        {
            return String.IsNullOrEmpty(str) ? null: str ;
        }

        public static bool IsNullOrEmpty(this String str)
        {
            return String.IsNullOrEmpty(str) ;
        }
    }
}
