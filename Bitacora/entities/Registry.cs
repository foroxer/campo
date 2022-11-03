using BitacoraLib.entities;
using DigitosVerificadoresLib.interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BitacoraLib.entities
{
    public class Registry : IRegistry
    {
        
        public DateTime dateTime { get; }
        public String message { get; }
        public PriorityEnum priority { get; }
        public String user { get; }
        public String dvh { get; set ; }
        public Registry( String message, PriorityEnum priority, String user, String dvh = "")
        {
            this.dateTime = DateTime.Now;
            this.message = message;
            this.priority = priority;
            this.user = user;
            this.dvh = dvh;
        }

        public Registry( String message, PriorityEnum priority,DateTime dateTime, string user,String dvh = "")
        {
            this.dateTime = dateTime;
            this.message = message;
            this.priority = priority;
            this.user = user;
            this.dvh = dvh;
        }
        private Registry()
        {
        }
    }
}
