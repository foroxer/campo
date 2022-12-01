using DigitosVerificadoresLib;
using DigitosVerificadoresLib.services;
using Microsoft.ReportingServices.Diagnostics.Internal;
using Models.venta;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utiles;

namespace DataAccess
{
    public class ProductRepository : IDVDAO<Product>
    {
        private string tableName = "producto";

        public Product get( int id )
        {
            SqlConnection connection = ConnectionSingleton.getConnection();

            try
            {
                Product product = new Product();

                connection.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = connection;
                cmd.CommandText = $@"select * from producto where id = @id;";
                cmd.Parameters.Add(new SqlParameter("id", id));

                SqlDataReader reader = cmd.ExecuteReader();



                while ( reader.Read() )
                {
                    product = new Product
                    {
                        id = int.Parse(reader.GetValue(reader.GetOrdinal("id")).ToString()),
                        name = reader.GetValue(reader.GetOrdinal("name")).ToString(),
                        description = reader.GetValue(reader.GetOrdinal("description")).ToString(),
                        price = decimal.Parse(reader.GetValue(reader.GetOrdinal("price")).ToString()),
                        code = int.Parse(reader.GetValue(reader.GetOrdinal("code")).ToString()),
                        dvh = reader.GetValue(reader.GetOrdinal("dvh")).ToString()
                    };
                }

                reader.Close();
                connection.Close();

                return product;


            }
            catch
            {
                connection.Close();
                throw;
            }

        }

        public string calculateDVH( Product obj )
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(obj.name);
            sb.Append(obj.description);
            sb.Append(obj.code.ToString());
            sb.Append(obj.price.ToString());



            return DVService.getDV(sb.ToString());
        }

        public string calculateDVV( List<Product> list )
        {
            return list.Aggregate<Product, String>("", ( a, b ) => DVService.getDV(a + b.dvh));
        }

        public List<Product> getAll()
        {
            SqlConnection connection = ConnectionSingleton.getConnection();
            try
            {
                List<Product> products = new List<Product>();

                connection.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = connection;
                cmd.CommandText = $@"select * from producto ;";

                SqlDataReader reader = cmd.ExecuteReader();



                while ( reader.Read() )
                {
                    Product product = new Product
                    {
                        id = int.Parse(reader.GetValue(reader.GetOrdinal("id")).ToString()),
                        name = reader.GetValue(reader.GetOrdinal("name")).ToString(),
                        description = reader.GetValue(reader.GetOrdinal("description")).ToString(),
                        price = decimal.Parse(reader.GetValue(reader.GetOrdinal("price")).ToString()),
                        code = int.Parse(reader.GetValue(reader.GetOrdinal("code")).ToString()),
                        dvh = reader.GetValue(reader.GetOrdinal("dvh")).ToString()
                    };
                    products.Add(product);
                }

                reader.Close();
                connection.Close();

                return products;


            }
            catch
            {
                connection.Close();

                throw;
            }
        }

        public string getDVV()
        {
            SqlConnection connection = ConnectionSingleton.getConnection();

            try
            {
                String dvv = "";

                if ( connection.State != ConnectionState.Open ) connection.Open();
                using ( IDbCommand command = connection.CreateCommand() )
                {
                    command.Connection = connection;
                    command.CommandText = $@"
                        SELECT  dvv
                            FROM dvv 
                            where tablename = @tablename
                    ";

                    IDbDataParameter tablename = command.CreateParameter();
                    tablename.ParameterName = "tablename";
                    tablename.Value = tableName;
                    command.Parameters.Add(tablename);

                    IDataReader reader = command.ExecuteReader();

                    while ( reader.Read() )
                    {
                        dvv = reader.GetValue(reader.GetOrdinal("dvv")).ToString();
                    }
                }
                connection.Close();
                return dvv;
            }
            catch ( Exception ex )
            {
                connection.Close();
                Console.Write(ex.ToString());
                throw ex;
            }
        }

        public void save( Product obj )
        {
            SqlConnection connection = ConnectionSingleton.getConnection();

            SqlTransaction transaction;
            try
            {
                connection.Open();
                transaction = connection.BeginTransaction();
                try
                {
                    SqlCommand cmd;

                    string query = $@"INSERT INTO [dbo].[producto]
                                               ([code]
                                               ,[name]
                                               ,[description]
                                               ,[price]
                                               ,[dvh])
                                         VALUES
                                             ( @code
                                            , @name
                                            , @description
                                            , @price
                                            ,@dvh )";

                    cmd = new SqlCommand();
                    cmd.Transaction = transaction;
                    cmd.CommandText = query;
                    cmd.Connection = connection;
                    cmd.Parameters.Add(new SqlParameter("id", obj.id));
                    cmd.Parameters.Add(new SqlParameter("code", obj.code));
                    cmd.Parameters.Add(new SqlParameter("name", obj.name));
                    cmd.Parameters.Add(new SqlParameter("description", obj.description));
                    cmd.Parameters.Add(new SqlParameter("price", obj.price));
                    cmd.Parameters.Add(new SqlParameter("dvh", calculateDVH(obj)));

                    cmd.ExecuteNonQuery();

                    transaction.Commit();

                    connection.Close();
                }
                catch
                {
                    transaction.Rollback();
                    throw;
                }
                updateDVV();
            }
            catch
            {
                connection.Close();
                throw;
            }
        }

        public void update( Product obj )
        {
            SqlConnection connection = ConnectionSingleton.getConnection();

            SqlTransaction transaction;
            try
            {
                connection.Open();
                transaction = connection.BeginTransaction();
                try
                {
                    SqlCommand cmd;

                    string query = $@"UPDATE [dbo].[producto]
                                        SET [code] = @code
                                            ,[name] = @name
                                            ,[description] = @description
                                            ,[price] = @price
                                            ,[dvh] = @dvh
                                        WHERE id = @id";

                    cmd = new SqlCommand();
                    cmd.Transaction = transaction;
                    cmd.CommandText = query;
                    cmd.Connection = connection;
                    cmd.Parameters.Add(new SqlParameter("id", obj.id));
                    cmd.Parameters.Add(new SqlParameter("code", obj.code));
                    cmd.Parameters.Add(new SqlParameter("name", obj.name));
                    cmd.Parameters.Add(new SqlParameter("description", obj.description));
                    cmd.Parameters.Add(new SqlParameter("price", obj.price));
                    cmd.Parameters.Add(new SqlParameter("dvh", calculateDVH(obj)));

                    cmd.ExecuteNonQuery();

                    transaction.Commit();

                    connection.Close();
                }
                catch
                {
                    transaction.Rollback();
                    throw;
                }
                updateDVV();
            }
            catch
            {
                connection.Close();
                throw;
            }
        }

        public void UpdateAllDV()
        {
            List<Product> list = getAll();
            list.ForEach(product =>
            {
                update(product);
            });
        }

        public void updateDVV()
        {
            SqlConnection connection = ConnectionSingleton.getConnection();

            try
            {

                String dvvString = calculateDVV(getAll());
                if ( connection.State != ConnectionState.Open ) connection.Open();
                using ( IDbCommand command = connection.CreateCommand() )
                {
                    command.Connection = connection;
                    command.CommandText = $@"
                                             UPDATE [campo].[dbo].[dvv]
		                                        SET [dvv] = @dvv
		                                        WHERE [tablename] = @tablename ;

                                           ";

                    IDbDataParameter dvv = command.CreateParameter();
                    dvv.ParameterName = "dvv";
                    dvv.Value = dvvString;
                    command.Parameters.Add(dvv);


                    IDbDataParameter tablename = command.CreateParameter();
                    tablename.ParameterName = "tablename";
                    tablename.Value = tableName;
                    command.Parameters.Add(tablename);

                    command.ExecuteNonQuery();
                }
                connection.Close();
            }
            catch ( Exception ex )
            {
                connection.Close();

                // TODO: ver como hacemos el handle de este error
                Console.Write(ex.ToString());
                throw ex;
            }
        }
    }
}
