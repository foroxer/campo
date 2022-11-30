using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DigitosVerificadoresLib.interfaces
{
    public interface IDVService
    {
        void reacalcDV();
        List<String> checkintegrity();
    }
}
