using BitacoraLib.entities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Registry = BitacoraLib.entities.Registry;

namespace BitacoraLib.dataAccess
{
    public class RegistryDAO
    {
        IDbConnection connection;
        String table;

        public RegistryDAO(IDbConnection conn, string table)
        {
            this.connection = conn;
            this.table = table;
            init();
        }

        public void init()
        {
            try
            {
                if (connection.State != ConnectionState.Open) connection.Open();

                using (IDbCommand command = connection.CreateCommand())
                {
                    command.Connection = connection;
                    command.CommandText = $@"
                        IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='{table}' and xtype='U')
                            CREATE TABLE [dbo].[{table}](
	                            [id] [int] IDENTITY(1,1) NOT NULL,
	                            [mensaje] [nchar](500) NOT NULL,
	                            [prioridad] [nchar](10) NOT NULL,
	                            [fecha] [nchar](100) NOT NULL,
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
            catch (Exception ex)
            {
                Console.Write(ex.ToString());
                throw;
            }
        }
        public void save(IRegistry registry)
        {
            try
            {
                if (connection.State != ConnectionState.Open) connection.Open();
                using (IDbCommand command = connection.CreateCommand())
                {
                    command.Connection = connection;
                    command.CommandText = $@"
                        INSERT INTO {table}
                                   ([mensaje]
                                   ,[prioridad]
                                   ,[fecha])
                             VALUES
                                   (@message
                                   ,@priority
                                   ,@dateTime)
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

                    command.ExecuteNonQuery();
                }
                connection.Close();
            }
            catch (Exception ex)
            {
                // TODO: ver como hacemos el handle de este error
                Console.Write(ex.ToString());
                throw ex;
            }
        }
        public List<IRegistry> getRegistries()
        {
            try
            {
                if (connection.State != ConnectionState.Open) connection.Open();
                List<IRegistry> response = new List<IRegistry>();
                using (IDbCommand command = connection.CreateCommand())
                {
                    command.Connection = connection;
                    command.CommandText = $@"
                        SELECT  [id]
                              ,[mensaje]
                              ,[prioridad]
                              ,[fecha]
                          FROM {table}
                        ";

                    DbDataAdapter dataAdapter = DbProviderFactories.GetFactory(connection as DbConnection).CreateDataAdapter();
                    dataAdapter.SelectCommand = command as DbCommand;
                    DataSet ds = new DataSet();
                    dataAdapter.Fill(ds);
                    
                    response.AddRange(ds.Tables[0].AsEnumerable()
                        .Select(dataRow => new Registry(dataRow.Field<string>("mensaje"),
                                                        (PriorityEnum)Enum.Parse(typeof(PriorityEnum), dataRow.Field<string>("prioridad")),
                                                        new DateTime(long.Parse(dataRow.Field<string>("fecha"))))
                        ).ToList());
                   
                    
                }
                connection.Close();
                return response;
            }
            catch (Exception ex)
            {
                Console.Write(ex.ToString());
                throw ex;
            }
        }

    }
}
