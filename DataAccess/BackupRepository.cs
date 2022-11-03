using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utiles;
using BitacoraLib.services;
using BitacoraLib.entities;

namespace DataAccess
{
    public class BackupRepository
    {

        public void realizarBackup( int partes, String directorio )
        {
            SqlConnection connection = ConnectionSingleton.getConnection();
            connection.Open();
            StringBuilder queryText = new StringBuilder();
            directorio = directorio.Replace("//", "\\");
            queryText.Append(" USE MASTER ");
            queryText.Append(" BACKUP DATABASE campo ");

            for ( int i = 0; i < partes; i++ )
            {
                if ( i == 0 )
                {
                    queryText.Append(" TO DISK = '" + directorio + ( i + 1 ) + ".bak '");
                }
                else
                {
                    queryText.Append(" , DISK = '" + directorio + ( i + 1 ) + ".bak '");
                }
            }

            queryText.Append(" WITH init ");
            SqlCommand query = new SqlCommand(queryText.ToString(), connection);
            try
            {
                query.ExecuteNonQuery();
                connection.Close();
                BitacoraService.register(PriorityEnum.Medium, "Se realizo un backup con exito");

            }
            catch ( Exception e )
            {
                connection.Close();
                BitacoraService.register(PriorityEnum.High, "Falló el backup ");
                throw e;
            }
        }

        public void realizarRestore( String directorio )

        {
            SqlConnection connection = ConnectionSingleton.getConnection();
            connection.Open();
            StringBuilder queryText = new StringBuilder();
            queryText.Append(" USE MASTER ");

            queryText.Append(" alter database [campo]  ");
            queryText.Append(" set offline with rollback immediate ");
            queryText.Append(" RESTORE DATABASE campo ");
            //FROM  DISK = '" + directorio + "' WITH REPLACE");
            queryText.Append(directorio);
            queryText.Append(" WITH REPLACE ");
            queryText.Append(" alter database [campo]  ");
            queryText.Append(" set online with rollback immediate ");
            SqlCommand query = new SqlCommand(queryText.ToString(), connection);
            try
            {
                query.ExecuteNonQuery();
                connection.Close();
            }
            catch ( Exception e )
            {
                BitacoraService.register(PriorityEnum.High, "Se realizo un restore con exito");
                throw e;
            }

            BitacoraService.register(PriorityEnum.High, "Falló el restore");

        }
    }
}
