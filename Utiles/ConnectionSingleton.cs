using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Xml.Linq;

namespace Utiles
{
    public class ConnectionSingleton
    {
        private static SqlConnection connection;

        private static SqlConnection constructor()
        {
            return new SqlConnection(RegReader.read("conection"));
        }

        public static SqlConnection getConnection()
        {
            if ( connection == null )
            {
                connection = constructor();
            }
            return connection;
        }
    }
}
