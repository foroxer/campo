using BitacoraLib.entities;
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

        public string user { get; }
        public Registry(string message, PriorityEnum priority, string user)
        {
            this.dateTime = DateTime.Now;
            this.message = message;
            this.priority = priority;
            this.user = user;
        }

        public Registry(string message, PriorityEnum priority,DateTime dateTime, string user)
        {
            this.dateTime = dateTime;
            this.message = message;
            this.priority = priority;
            this.user = user;
        }
        private Registry()
        {
        }
    }
}
