using DataAccess;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business
{
    public class BackupService
    {
        private BackupRepository backupRepository;

        public BackupService()
        {
            backupRepository = new BackupRepository();
        }
        public void realizarBackup( int partes, String directorio )
        {
            String date = DateTime.Now.Date.ToShortDateString();
            date = date.Replace("/", "_");
            String nombreDelBack = "campo_" + date + "-";
            directorio += "//" + nombreDelBack;
            backupRepository.realizarBackup(partes, directorio);

        }

        public void realizarRestore( String fullPath )
        {
            String regex = Path.GetFileName(fullPath).Split('-')[0] + "??" + Path.GetExtension(fullPath);

            String directorioActual = Path.GetDirectoryName(fullPath);
            List<String> todosLosArchivos = Directory.GetFiles(directorioActual, regex).ToList();
            todosLosArchivos.Sort(( String a, String b ) =>
            { return long.Parse(a.Split('-')[1].Replace(".bak", "")).CompareTo(long.Parse(b.Split('-')[1].Replace(".bak", ""))); });

            StringBuilder bs = new StringBuilder();

            for ( int i = 0; i < todosLosArchivos.Count; i++ )
            {
                if ( i == 0 )
                {
                    bs.Append(" FROM DISK = '" + todosLosArchivos[i] + "' ");
                }
                else
                {
                    bs.Append(" ,DISK = '" + todosLosArchivos[i] + "' ");
                }

            }
            backupRepository.realizarRestore(bs.ToString());
        }
    }
}
