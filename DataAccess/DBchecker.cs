using Models.bussines;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utiles;

namespace DataAccess
{
    public class DBchecker
    {
        public void testDB()
        {
            SqlConnection connection = ConnectionSingleton.getConnection();
            Boolean exist = false;
            try
            {
                
                connection.Open();
                var cmd = new SqlCommand();
                cmd.Connection = connection;

                var sql = $@"select count(*) as cantidad from campo.sys.tables where name like 'usuarios';";

                cmd.CommandText = sql;

                SqlDataReader reader = cmd.ExecuteReader();



                reader.Read();

                exist = reader.GetInt32(reader.GetOrdinal("cantidad")) > 0;


                reader.Close();
                connection.Close();

                
            }
            catch
            {
                connection.Close();
                throw;
            }

            if ( !exist )
            {
                throw new Exception();
            }
        }
    }
}
