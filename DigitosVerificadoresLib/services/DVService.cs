using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace DigitosVerificadoresLib.services
{
    public class DVService
    {
        private static List<string> tables = new List<string>();
        public void config()
        {

        }

        public String getDvv<T>(T obj)
        {
            Dictionary<string, string> _dict = new Dictionary<string, string>();

            PropertyInfo[] props = typeof(T).GetProperties();
            foreach (PropertyInfo prop in props)
            {
                /*object[] attrs = prop.GetCustomAttributes(true);
                foreach (object authAttr in attrs)
                {*/
                //AuthorAttribute authAttr = attr as AuthorAttribute;
                if (prop.GetValue(obj) != null)
                {
                    string propName = prop.PropertyType.Name;
                    string value = prop.GetValue(obj).ToString();

                    //_dict.Add(propName, value);
                }
                //}
            }

            return "string";
        }
    }
}
