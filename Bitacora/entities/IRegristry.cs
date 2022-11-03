using BitacoraLib.entities;
using DigitosVerificadoresLib.interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BitacoraLib.entities
{
    public interface IRegistry : IDVEntity
    {
        DateTime dateTime { get; }
        String message { get; }
        PriorityEnum priority { get; }
        String user { get; }

    }
}
