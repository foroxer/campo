using BitacoraLib.entities;
using DigitosVerificadoresLib;
using DigitosVerificadoresLib.interfaces;
using DigitosVerificadoresLib.services;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

namespace BitacoraLib.dataAccess
{
    public class RegistryDAO : IDVDAO<IRegistry>
    {
        IDbConnection connection;
        String table;

        public RegistryDAO( IDbConnection conn, string table )
        {
            this.connection = conn;
            this.table = table;
            init();
        }

        public void init()
        {
            try
            {
                if ( connection.State != ConnectionState.Open ) connection.Open();

                using ( IDbCommand command = connection.CreateCommand() )
                {
                    command.Connection = connection;
                    command.CommandText = $@"
                        IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='{table}' and xtype='U')
                            CREATE TABLE [dbo].[{table}](
	                            [id] [int] IDENTITY(1,1) NOT NULL,
	                            [mensaje] [nchar](500) NOT NULL,
	                            [prioridad] [nchar](10) NOT NULL,
	                            [fecha] [nchar](100) NOT NULL,
                                [usuario] [nchar](100) NOT NULL,
                             CONSTRAINT [PK_bitacora] PRIMARY KEY CLUSTERED 
                            (
	                            [id] ASC
                            ) 
                        ) ON [PRIMARY]
                        ";

                    command.ExecuteNonQuery();
                }
                connection.Close();
            }
            catch ( Exception ex )
            {
                Console.Write(ex.ToString());
                throw;
            }
        }
        public void save( IRegistry registry )
        {
            try
            {
                if ( connection.State != ConnectionState.Open ) connection.Open();
                using ( IDbCommand command = connection.CreateCommand() )
                {
                    command.Connection = connection;
                    command.CommandText = $@"
                        INSERT INTO {table}
                                   ([mensaje]
                                   ,[prioridad]
                                   ,[fecha]
                                   ,[usuario]
                                   ,[dvh])
                             VALUES
                                   (@message
                                   ,@priority
                                   ,@dateTime
                                   ,@user
                                   ,@dvh)
                        ";

                    IDbDataParameter dateTime = command.CreateParameter();
                    dateTime.ParameterName = "dateTime";
                    dateTime.Value = registry.dateTime.Ticks;
                    command.Parameters.Add(dateTime);

                    IDbDataParameter priority = command.CreateParameter();
                    priority.ParameterName = "priority";
                    priority.Value = registry.priority.ToString();
                    command.Parameters.Add(priority);

                    IDbDataParameter message = command.CreateParameter();
                    message.ParameterName = "message";
                    message.Value = registry.message;
                    command.Parameters.Add(message);

                    IDbDataParameter user = command.CreateParameter();
                    user.ParameterName = "user";
                    user.Value = registry.user;
                    command.Parameters.Add(user);

                    IDbDataParameter dvh = command.CreateParameter();
                    dvh.ParameterName = "dvh";
                    dvh.Value = getDVH(registry);
                    command.Parameters.Add(dvh);

                    command.ExecuteNonQuery();
                }
                connection.Close();
            }
            catch ( Exception ex )
            {
                // TODO: ver como hacemos el handle de este error
                Console.Write(ex.ToString());
                throw ex;
            }
        }
        public List<IRegistry> getAll()
        {
            try
            {
                if ( connection.State != ConnectionState.Open ) connection.Open();
                List<IRegistry> response = new List<IRegistry>();
                using ( IDbCommand command = connection.CreateCommand() )
                {
                    command.Connection = connection;
                    command.CommandText = $@"
                        SELECT  [id]
                            ,[mensaje]
                            ,[prioridad]
                            ,[fecha]
                            ,[usuario]
                            ,[dvh]
                            FROM {table}
                    ";

                    DbDataAdapter dataAdapter = DbProviderFactories.GetFactory(connection as DbConnection).CreateDataAdapter();
                    dataAdapter.SelectCommand = command as DbCommand;
                    DataSet ds = new DataSet();
                    dataAdapter.Fill(ds);

                    response.AddRange(ds.Tables[0].AsEnumerable()
                        .Select(dataRow => new Registry(dataRow.Field<string>("mensaje"),
                                           (PriorityEnum)Enum.Parse(typeof(PriorityEnum), dataRow.Field<string>("prioridad")),
                                           new DateTime(long.Parse(dataRow.Field<string>("fecha"))),
                                           dataRow.Field<string>("usuario"),
                                           dataRow.Field<string>("dvh"))

                        ).ToList());


                }
                connection.Close();
                return response;
            }
            catch ( Exception ex )
            {
                Console.Write(ex.ToString());
                throw ex;
            }
        }

        public string getDVH( IRegistry obj )
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(obj.message);
            sb.Append(obj.user);
            sb.Append(obj.priority.ToString());
            sb.Append(obj.dateTime.Ticks.ToString());

            return DVService.getDV(sb.ToString());
        }

        public string getDVV( List<IRegistry> list )
        {
            return DVService.getDV(list.Aggregate<IRegistry, String>("", ( a, b ) => a + b.dvh));
        }

        public void update( IRegistry obj )
        {
            try
            {
                if ( connection.State != ConnectionState.Open ) connection.Open();
                using ( IDbCommand command = connection.CreateCommand() )
                {
                    command.Connection = connection;
                    command.CommandText = $@"
                       UPDATE [dbo].{table}
                       SET [mensaje] =@message
                          ,[prioridad] = @priority
                          ,[fecha] = @dateTime
                          ,[usuario] = @user
                          ,[dvh] = @dvh
                         WHERE [usuario] = @user and [fecha] = @dateTime
                        ";

                    IDbDataParameter dateTime = command.CreateParameter();
                    dateTime.ParameterName = "dateTime";
                    dateTime.Value = obj.dateTime.Ticks;
                    command.Parameters.Add(dateTime);

                    IDbDataParameter priority = command.CreateParameter();
                    priority.ParameterName = "priority";
                    priority.Value = obj.priority.ToString();
                    command.Parameters.Add(priority);

                    IDbDataParameter message = command.CreateParameter();
                    message.ParameterName = "message";
                    message.Value = obj.message;
                    command.Parameters.Add(message);

                    IDbDataParameter user = command.CreateParameter();
                    user.ParameterName = "user";
                    user.Value = obj.user;
                    command.Parameters.Add(user);

                    IDbDataParameter dvh = command.CreateParameter();
                    user.ParameterName = "dvh";
                    user.Value = getDVH(obj);
                    command.Parameters.Add(dvh);

                    command.ExecuteNonQuery();
                }
                connection.Close();
            }
            catch ( Exception ex )
            {
                Console.Write(ex.ToString());
                throw ex;
            }
        }

       
    }
}
