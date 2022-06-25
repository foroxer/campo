using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business
{
   public class VentasServiece
    {
        public void Facturar()
        {
            if (!Session.GetInstance.IsInRole(PermissionsEnum.PuedeHacerE)) throw new Exception("No tiene permisos");
        }
    }
}
