using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Exceptions
{
    public class DBException : Exception
    {
        public DBException() : base("Ocurrio un error al acceder a la BD")
        {
        }

        public DBException( string message ) : base(message)
        {
        }
    }
}
