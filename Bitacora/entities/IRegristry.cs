using BitacoraLib.entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BitacoraLib.entities
{
    public interface IRegistry
    {
        DateTime dateTime { get; }
        String message { get; }
        PriorityEnum priority { get; }
    }
}
