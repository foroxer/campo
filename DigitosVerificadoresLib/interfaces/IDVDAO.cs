using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DigitosVerificadoresLib
{
    public interface IDVDAO<T>
    {
        List<T> getAll();

        String calculateDVH( T obj );

        String calculateDVV( List<T> list );

        void save( T obj );

        void update( T obj );
    }
}
