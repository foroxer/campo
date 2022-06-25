using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Utiles
{
    public  class ConnectionSingleton
    {
        private static SqlConnection connection;

        private static SqlConnection constructor()
        {

            /*
            SqlConnectionStringBuilder cs = new SqlConnectionStringBuilder();
            cs.IntegratedSecurity = true;
            cs.DataSource = ".";
            cs.InitialCatalog = "campo";
            return new SqlConnection(cs.ConnectionString;);
             */

            return new SqlConnection(Properties.Resources.ConnectionString);
        }

        public static SqlConnection getConnection()
        {
            if (connection == null)
            {
                connection = constructor();
            }
            //connection.Close();
            return connection;
        }
    }
}
