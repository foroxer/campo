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

        public Registry(string message, PriorityEnum priority)
        {
            this.dateTime = DateTime.Now;
            this.message = message;
            this.priority = priority;
        }

        public Registry(string message, PriorityEnum priority,DateTime dateTime)
        {
            this.dateTime = dateTime;
            this.message = message;
            this.priority = priority;
        }
        private Registry()
        {
        }
    }
}
