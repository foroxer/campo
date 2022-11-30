using DigitosVerificadoresLib;
using DigitosVerificadoresLib.services;
using Models.venta;
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
    public class CouponRepository : IDVDAO<Coupon>
    {
        private string tableName = "cupon";
        public Coupon get( string code )
        {
            SqlConnection connection = ConnectionSingleton.getConnection();
            try
            {
                
                
                    Coupon coupon = new Coupon ();
                    connection.Open();
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = connection;
                    cmd.CommandText = $@"select * from cupon where code like @code;";
                    cmd.Parameters.Add(new SqlParameter("code", code));

                    SqlDataReader reader = cmd.ExecuteReader();

                    while ( reader.Read() )
                    {
                        coupon = new Coupon
                        {
                            code = reader.GetValue(reader.GetOrdinal("code")).ToString(),
                            dvh = reader.GetValue(reader.GetOrdinal("dvh")).ToString(),
                            emmitDate = new DateTime(long.Parse(reader.GetValue(reader.GetOrdinal("emmitDate")).ToString())),
                            expirationDate = new DateTime(long.Parse(reader.GetValue(reader.GetOrdinal("expirationDate")).ToString())),
                            discount = int.Parse(reader.GetValue(reader.GetOrdinal("discount")).ToString()),
                            id = int.Parse(reader.GetValue(reader.GetOrdinal("id")).ToString()),
                            //por ahora el type es un string deberia ser un enum para las distintas estratigias
                            type = (CouponType)Enum.Parse(typeof(CouponType), reader.GetValue(reader.GetOrdinal("type")).ToString()),
                        };


                    }
                    reader.Close();
                    connection.Close();
                    return coupon;
            }
            catch
            {
                connection.Close();

                throw;
            }
        }

        public Coupon get( int id )
        {
            try
            {
                using ( SqlConnection connection = ConnectionSingleton.getConnection() )
                {
                    Coupon coupon = new Coupon();
                    connection.Open();
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = connection;
                    cmd.CommandText = $@"select * from cupon where id = @id";
                    cmd.Parameters.Add(new SqlParameter("id", id));

                    SqlDataReader reader = cmd.ExecuteReader();

                    while ( reader.Read() )
                    {
                        coupon = new Coupon
                        {
                            code = reader.GetValue(reader.GetOrdinal("code")).ToString(),
                            dvh = reader.GetValue(reader.GetOrdinal("dvh")).ToString(),
                            emmitDate = new DateTime(long.Parse(reader.GetValue(reader.GetOrdinal("emmitDate")).ToString())),
                            expirationDate = new DateTime(long.Parse(reader.GetValue(reader.GetOrdinal("expirationDate")).ToString())),
                            discount = int.Parse(reader.GetValue(reader.GetOrdinal("discount")).ToString()),
                            id = int.Parse(reader.GetValue(reader.GetOrdinal("id")).ToString()),
                            //por ahora el type es un string deberia ser un enum para las distintas estratigias
                            type = (CouponType)Enum.Parse(typeof(CouponType), reader.GetValue(reader.GetOrdinal("type")).ToString()),
                        };


                    }

                    reader.Close();
                    connection.Close();
                    return coupon;
                }
            }
            catch
            {
                throw;
            }
        }

        public List<Coupon> getAll()
        {
            SqlConnection connection = ConnectionSingleton.getConnection();

            try
            {
                
                    List<Coupon> coupons = new List<Coupon>();  
                    connection.Open();
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = connection;
                    cmd.CommandText = $@"select * from cupon ;";

                    SqlDataReader reader = cmd.ExecuteReader();

                    while ( reader.Read() )
                    {
                        Coupon coupon = new Coupon
                        {
                            code = reader.GetValue(reader.GetOrdinal("code")).ToString(),
                            dvh = reader.GetValue(reader.GetOrdinal("dvh")).ToString(),
                            emmitDate = new DateTime(long.Parse(reader.GetValue(reader.GetOrdinal("emmitDate")).ToString())),
                            expirationDate = new DateTime(long.Parse(reader.GetValue(reader.GetOrdinal("expirationDate")).ToString())),
                            discount = int.Parse(reader.GetValue(reader.GetOrdinal("discount")).ToString()),
                            id = int.Parse(reader.GetValue(reader.GetOrdinal("id")).ToString()),
                            //hay que buscar otra manera de parcearlo porque si se rompe no sabes que fila es
                            type = (CouponType)Enum.Parse(typeof(CouponType), reader.GetValue(reader.GetOrdinal("type")).ToString()),
                        };
                        coupons.Add(coupon);
                    }

                    reader.Close();
                    connection.Close();
                    return coupons;
                
            }
            catch
            {
                connection.Close();
                throw;
            }
        }

        public string getDVV()
        {
            try
            {
                String dvv = "";
                SqlConnection connection = ConnectionSingleton.getConnection();

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
                Console.Write(ex.ToString());
                throw ex;
            }
        }

        public void save( Coupon obj )
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

                    string query = $@"INSERT INTO [dbo].[cupon]
                                           ([discount]
                                           ,[type]
                                           ,[emmitDate]
                                           ,[expirationDate]
                                           ,[code]
                                           ,[dvh])
                                     VALUES
                                           (@discount
                                           ,@type
                                           ,@emmitDate
                                           ,@expirationDate
                                           ,@code
                                           ,@dvh)";

                    cmd = new SqlCommand();
                    cmd.Transaction = transaction;
                    cmd.CommandText = query;
                    cmd.Connection = connection;
                    cmd.Parameters.Add(new SqlParameter("discount", obj.discount));
                    cmd.Parameters.Add(new SqlParameter("type", obj.type.ToString()));
                    cmd.Parameters.Add(new SqlParameter("dvh", calculateDVH(obj)));
                    cmd.Parameters.Add(new SqlParameter("emmitDate", DateTime.Now.Ticks));
                    cmd.Parameters.Add(new SqlParameter("expirationDate", obj.expirationDate.Ticks));
                    cmd.Parameters.Add(new SqlParameter("code", obj.code));

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

        public void update( Coupon obj )
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

                    string query = $@"UPDATE [dbo].[cupon]
                                       SET [discount] = @discount
                                          ,[type] = @type
                                          ,[emmitDate] = @emmitDate
                                          ,[expirationDate] = @expirationDate
                                          ,[code] = @code
                                          ,[dvh] = @dvh
                                     WHERE id = @id
                                    ";

                    cmd = new SqlCommand();
                    cmd.Transaction = transaction;
                    cmd.CommandText = query;
                    cmd.Connection = connection;
                    cmd.Parameters.Add(new SqlParameter("discount", obj.discount));
                    cmd.Parameters.Add(new SqlParameter("type", obj.type.ToString()));
                    cmd.Parameters.Add(new SqlParameter("dvh", calculateDVH(obj)));
                    cmd.Parameters.Add(new SqlParameter("emmitDate", obj.emmitDate.Ticks));
                    cmd.Parameters.Add(new SqlParameter("expirationDate", obj.expirationDate.Ticks));
                    cmd.Parameters.Add(new SqlParameter("code", obj.code));
                    cmd.Parameters.Add(new SqlParameter("id", obj.id));

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
        public string calculateDVH( Coupon obj )
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(obj.discount);
            sb.Append(obj.type.ToString());
            sb.Append(obj.emmitDate.Ticks);
            sb.Append(obj.expirationDate.Ticks);
            sb.Append(obj.code);

            return DVService.getDV(sb.ToString());
        }

        public string calculateDVV( List<Coupon> list )
        {
            return list.Aggregate<Coupon, String>("", ( a, b ) => DVService.getDV(a + b.dvh));
        }

        public void UpdateAllDV()
        {
            List<Coupon> list = getAll();
            list.ForEach(coupon =>
            {
                update(coupon);
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
                    connection.Close();

                }
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
