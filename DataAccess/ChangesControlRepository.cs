using Models.language;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utiles;

namespace DataAccess
{
    public class ChangesControlRepository
    {
        public DataTable getAll()
        {
            DataTable dataTable  = new DataTable();

            SqlConnection connection = ConnectionSingleton.getConnection();
            try
            {
                string sql = $@"select * from user_changes_control;";

                connection.Open();
                SqlDataAdapter dataAdapter = new SqlDataAdapter(sql, connection);

                dataAdapter.Fill(dataTable);

                connection.Close();

                return dataTable;
            }
            catch
            {
                connection.Close();
                throw;
            }
        }

    }
}
