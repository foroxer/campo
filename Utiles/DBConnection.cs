using System;
using System.Data;
using System.Data.SqlClient;

namespace Utiles
{
    public class DBConnection
    {

        string connectionString = Properties.Resources.ConnectionString;
        public bool Insert(string query) 
        {
            var objeto = new object();
            var objeto1 = new object();

            var cn = new SqlConnection(@"Server=DESKTOP-H982BU0\SQLEXPRESS; Initial Catalog=LastraJulianDev;Integrated Security=True");
            var cmd = new SqlCommand();

            cn.Open();

            cmd.CommandTimeout = 5;

            SqlTransaction myTrans;
            cmd.CommandType = CommandType.Text;
            cmd.Connection = cn;
            cmd.CommandText = query;

            myTrans = cn.BeginTransaction();

            cmd.Transaction = myTrans;

            string[] user = new string[2];

            object obj = new object();

            //Ejecuto la consulta
            try
            {
                using (SqlDataReader dr = cmd.ExecuteReader())

                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            obj = dr;
                        }
                    }
                    else
                    {
                        user[0] = "No existen ocurrencias para el server";
                    }

                myTrans.Commit();

                return true;
            }
            catch (SqlException e)
            {
                myTrans.Rollback();
                throw e;
            }
            catch (Exception e)
            {
                throw e;
            }
            finally
            {
                cn.Close();
            }

        }
        public string[] Select(string query)
        {
            //var user = new object();
            //var password = new object();

            var cn = new SqlConnection(connectionString);
            var cmd = new SqlCommand();

            cn.Open();

            cmd.CommandTimeout = 5;

            SqlTransaction myTrans;
            cmd.CommandType = CommandType.Text;
            cmd.Connection = cn;
            cmd.CommandText = query;

            myTrans = cn.BeginTransaction();

            cmd.Transaction = myTrans;

            string[] user = new string[2];

            //Ejecuto la consulta
            try
            {
                using (SqlDataReader dr = cmd.ExecuteReader())

                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            user[0] = dr[0].ToString();
                            user[1] = dr[1].ToString();
                        }
                    }
                    else
                    {
                        user[0] = "No existen ocurrencias para el server";
                    }

                myTrans.Commit();

                return user;
            }
            catch (SqlException e)
            {
                myTrans.Rollback();
                throw e;
            }
            catch (Exception e)
            {
                throw e;
            }
            finally
            {
                cn.Close();
            }

        }
        public bool TestConnection()
        {
            SqlConnection _conexion = new SqlConnection(@"Server=AR-NB-415\SQLEXPRESS; Initial Catalog=ElasticSearch;Integrated Security=True");

            //Abro la conexion
            try
            {
                _conexion.Open();
                _conexion.Close();
                Console.WriteLine("Connection was succesfull!");
            }
            catch (Exception e)
            {
                Console.ForegroundColor = ConsoleColor.Red;
                Console.WriteLine("Cant connect to database!\r\n");
                Console.ForegroundColor = ConsoleColor.Cyan;
                throw e;
            }
            return true;
        }
    }
}