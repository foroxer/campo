using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Utiles
{
    public class Serializer
    {

        public static string serialize(Object obj )
        {
            return ( JsonConvert.SerializeObject(obj) );
        }
        public static void serializeAndSave( string path, object ob )
        {
            File.WriteAllText(path, serialize(ob));
        }
    }
}
