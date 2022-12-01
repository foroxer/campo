using DigitosVerificadoresLib;
using DigitosVerificadoresLib.services;
using Microsoft.ReportingServices.Diagnostics.Internal;
using Microsoft.SqlServer.Server;
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
    public class VentaRepository : IDVDAO<Venta>
    {
        private string tableName = "venta";
        ProductRepository productRepository = new ProductRepository();
        UserRepository userRepository = new UserRepository();
        CouponRepository couponRepository = new CouponRepository();
        public Venta get( int id )
        {
            Venta venta = new Venta();
            List<int> productos = new List<int>();
            int usuario = 0;
            int coupon = 0;
            SqlConnection connection = ConnectionSingleton.getConnection();

            try
            {
                connection.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = connection;
                cmd.CommandText = $@"select * , v.dvh as ventadvh from dbo.venta as v 
inner join dbo.venta_producto as vp on v.id = vp.idVenta  where v.id = @id;";
                cmd.Parameters.Add(new SqlParameter("id", id));

                SqlDataReader reader = cmd.ExecuteReader();

                int first = 0;
                while ( reader.Read() )
                {
                    if ( first == 0 )
                    {
                        venta.dvh = reader.GetValue(reader.GetOrdinal("dvh")).ToString();
                        venta.id = int.Parse(reader.GetValue(reader.GetOrdinal("id")).ToString());
                        venta.date = new DateTime(long.Parse(reader.GetValue(reader.GetOrdinal("fecha")).ToString()));
                        int.TryParse(reader.GetValue(reader.GetOrdinal("idCupon")).ToString(), out coupon);
                        venta.subTotal = Decimal.Parse(reader.GetValue(reader.GetOrdinal("subTotal")).ToString());
                        venta.total = Decimal.Parse(reader.GetValue(reader.GetOrdinal("total")).ToString());
                    }
                    first++;
                    productos.Add(int.Parse(reader.GetValue(reader.GetOrdinal("idProducto")).ToString()));
                    usuario = int.Parse(reader.GetValue(reader.GetOrdinal("idUsuario")).ToString());

                }

                reader.Close();
                connection.Close();

            }
            catch
            {
                connection.Close();
                throw;
            }

            if ( coupon != 0 )
            {
                venta.coupon = couponRepository.get(coupon);
            }
            //fill products
            productos.ForEach(( idProducto ) =>
            {
                venta.products.Add(productRepository.get(idProducto));
            });
            venta.user = userRepository.get(usuario);
           

            return venta;

        }

        public List<Venta> getAll()
        {
            List<Venta> ventas = new List<Venta>();
            List<int> idsventas = new List<int>();
            SqlConnection connection = ConnectionSingleton.getConnection();

            try
            {

                connection.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = connection;
                cmd.CommandText = $@"select id from venta;";

                SqlDataReader reader = cmd.ExecuteReader();
                //esto no deberia ser asi ;
                while ( reader.Read() )
                {
                    idsventas.Add(int.Parse(reader.GetValue(reader.GetOrdinal("id")).ToString()));
                }

                reader.Close();
                connection.Close();

            }
            catch
            {
                connection.Close();
                throw;
            }

            //fill ventas
            idsventas.ForEach(( idVenta ) =>
            {
                ventas.Add(get(idVenta));
            });
            return ventas;
        }

        public string calculateDVH( Venta obj )
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(obj.user.Id.ToString());
            sb.Append(obj.date.Ticks.ToString());
            sb.Append(string.Format("{0:0.00}", obj.subTotal));
            sb.Append(string.Format("{0:0.00}", obj.total));

            sb.Append(obj?.coupon?.code);

            return DVService.getDV(sb.ToString());
        }

        public string calculateDVV( List<Venta> list )
        {
            return list.Aggregate<Venta, String>("", ( a, b ) => DVService.getDV(a + b.dvh));
        }

        public Venta saveGet( Venta obj )
        {
            save(obj);
            return getByDVH(calculateDVH(obj));

        }

        public void update( Venta obj )
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

                    string query = $@"UPDATE [dbo].[venta]
                                           SET [fecha] = @fecha
                                              ,[idUsuario] = @idUsuario
                                              ,[dvh] = @dvh
                                              ,[subTotal] = subTotal
                                              ,[total] = total
                                         WHERE id = @id
                                        ";

                    cmd = new SqlCommand();
                    cmd.Transaction = transaction;
                    cmd.CommandText = query;
                    cmd.Connection = connection;
                    cmd.Parameters.Add(new SqlParameter("fecha", obj.date.Ticks));
                    cmd.Parameters.Add(new SqlParameter("idUsuario", obj.user.Id));
                    cmd.Parameters.Add(new SqlParameter("id", obj.id));
                    cmd.Parameters.Add(new SqlParameter("subTotal", obj.subTotal));
                    cmd.Parameters.Add(new SqlParameter("total", obj.total));
                    cmd.Parameters.Add(new SqlParameter("dvh", calculateDVH(obj)));

                    cmd.ExecuteNonQuery();


                    query = "delete from venta_producto WHERE idVenta = @idVenta";
                    cmd = new SqlCommand();
                    cmd.Transaction = transaction;
                    cmd.CommandText = query;
                    cmd.Connection = connection;
                    cmd.Parameters.Add(new SqlParameter("idVenta", obj.id));

                    cmd.ExecuteNonQuery();

                    obj.products.ForEach(product =>
                    {
                        query = $@"INSERT INTO [dbo].[venta_producto]
                                               ([idVenta]
                                               ,[idProducto])
                                         VALUES
                                               (@idVenta
                                               ,@idProducto)";

                        cmd = new SqlCommand();
                        cmd.Transaction = transaction;
                        cmd.CommandText = query;
                        cmd.Connection = connection;
                        cmd.Parameters.Add(new SqlParameter("idVenta", obj.id));
                        cmd.Parameters.Add(new SqlParameter("idProducto", product.id));

                        cmd.ExecuteNonQuery();
                    });
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

        public void save( Venta obj )
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

                    string query = $@"INSERT INTO [dbo].[venta]
                                                  ([fecha]
                                                   ,[idUsuario]
                                                   ,[idCupon]
                                                   ,[dvh]
                                                   ,[subTotal]
                                                   ,[total])
                                             VALUES
                                                   (@fecha
                                                   ,@idUsuario
                                                   ,@idCupon
                                                   ,@dvh
                                                   ,@subTotal
                                                   ,@total)";

                    cmd = new SqlCommand();
                    cmd.Transaction = transaction;
                    cmd.CommandText = query;
                    cmd.Connection = connection;
                    cmd.Parameters.Add(new SqlParameter("fecha", obj.date.Ticks));
                    cmd.Parameters.Add(new SqlParameter("idUsuario", obj.user.Id));
                    cmd.Parameters.Add(new SqlParameter("dvh", calculateDVH(obj)));
                    cmd.Parameters.Add(new SqlParameter("idCupon", (object)obj.coupon?.id ?? DBNull.Value));
                    cmd.Parameters.Add(new SqlParameter("subTotal", obj.subTotal));
                    cmd.Parameters.Add(new SqlParameter("total", obj.total));

                    cmd.ExecuteNonQuery();

                    cmd = new SqlCommand();
                    cmd.Transaction = transaction;
                    cmd.Connection = connection;
                    cmd.CommandText = $@"select * from dbo.venta as v  where v.dvh = @dvh;";
                    cmd.Parameters.Add(new SqlParameter("dvh", calculateDVH(obj)));

                    SqlDataReader reader = cmd.ExecuteReader();


                    reader.Read();

                    int id = int.Parse(reader.GetValue(reader.GetOrdinal("id")).ToString());
                    reader.Close();

                    obj.products.ForEach(product =>
                    {
                        query = $@"INSERT INTO [dbo].[venta_producto]
                                               ([idVenta]
                                               ,[idProducto])
                                         VALUES
                                               (@idVenta
                                               ,@idProducto)";

                        cmd = new SqlCommand();
                        cmd.Transaction = transaction;
                        cmd.CommandText = query;
                        cmd.Connection = connection;
                        cmd.Parameters.Add(new SqlParameter("idVenta", id));
                        cmd.Parameters.Add(new SqlParameter("idProducto", product.id));


                        cmd.ExecuteNonQuery();
                    });
                    transaction.Commit();

                    connection.Close();
                }
                catch
                {
                    connection.Close();
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

        public void updateDVV()
        {
            String dvvString = calculateDVV(getAll());
            SqlConnection connection = ConnectionSingleton.getConnection();

            try
            {

                if ( connection.State != ConnectionState.Open ) { connection.Open(); }
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

        public void UpdateAllDV()
        {
            List<Venta> list = getAll();
            list.ForEach(venta =>
            {
                update(venta);
            });
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
        private Venta getByDVH( string dvh )
        {
            Venta venta = new Venta();
            List<int> productos = new List<int>();
            int usuario = 0;
            int coupon = 0;
            SqlConnection connection = ConnectionSingleton.getConnection();

            try
            {
                connection.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = connection;
                cmd.CommandText = $@"select * , v.dvh as ventadvh from dbo.venta as v 
inner join dbo.venta_producto as vp on v.id = vp.idVenta  where v.dvh = @dvh;";
                cmd.Parameters.Add(new SqlParameter("dvh", dvh));

                SqlDataReader reader = cmd.ExecuteReader();

                int first = 0;
                while ( reader.Read() )
                {
                    if ( first == 0 )
                    {
                        venta.dvh = reader.GetValue(reader.GetOrdinal("dvh")).ToString();
                        venta.id = int.Parse(reader.GetValue(reader.GetOrdinal("id")).ToString());
                        venta.date = new DateTime(long.Parse(reader.GetValue(reader.GetOrdinal("fecha")).ToString()));
                        int.TryParse(reader.GetValue(reader.GetOrdinal("idCupon")).ToString(), out coupon);
                        venta.subTotal = Decimal.Parse(reader.GetValue(reader.GetOrdinal("subTotal")).ToString());
                        venta.total = Decimal.Parse(reader.GetValue(reader.GetOrdinal("total")).ToString());
                    }
                    first++;
                    productos.Add(int.Parse(reader.GetValue(reader.GetOrdinal("idProducto")).ToString()));
                    usuario = int.Parse(reader.GetValue(reader.GetOrdinal("idUsuario")).ToString());

                }

                reader.Close();
                connection.Close();

            }
            catch
            {
                connection.Close();
                throw;
            }

            //fill products
            productos.ForEach(( idProducto ) =>
            {
                venta.products.Add(productRepository.get(idProducto));
            });
            venta.user = userRepository.get(usuario);
            if ( coupon != 0 )
            {
                venta.coupon = couponRepository.get(coupon);
            }

            return venta;

        }


    }
}
