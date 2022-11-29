using BitacoraLib.dataAccess;
using BitacoraLib.services;
using DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceProcess;
using System.Text;
using System.Threading.Tasks;

namespace Business
{
    public class IntegrityService
    {
        UserService userService;
        DBchecker dBchecker;
        VentaService ventaService;
        CouponsService couponsService;

        public IntegrityService()
        {
            userService = new UserService();
            dBchecker = new DBchecker();
            couponsService = new CouponsService();
            ventaService = new VentaService();
        }
        public List<String> check()
        {
            List<String> result = new List<String>();

            result.AddRange(checkDBService());
            result.AddRange(checkDV());


            return result;
        }

        public void recalcDV()
        {
            BitacoraService.reacalcDV();
            userService.reacalcDV();
            ventaService.reacalcDV();
            couponsService.reacalcDV();

        }


        private List<String> checkDV()
        {
            List<String> result = new List<String>();

            try
            {
                dBchecker.testDB();
                result.AddRange(BitacoraService.checkintegrity());
                result.AddRange(userService.checkintegrity());
                result.AddRange(ventaService.checkintegrity());
                result.AddRange(couponsService.checkintegrity());
                

            }
            catch ( Exception )
            {
                result.Add("Errores al obtener informacion por favor verifique la coneccion a la BD");
            }

            return result;
        }
        private List<String> checkDBService()
        {
            List<String> result = new List<String>();

            try
            {
                //TODO: en las compus de la facu  el process no se llama asi  
                //
                //ServiceController sc = new ServiceController("MSSQLSERVER");

                //switch ( sc.Status )
                //{
                //    case ServiceControllerStatus.Running:
                //        break;
                //    default:
                //        result.Add("La base de datos no esta disponible");
                //        break;
                //}
            }
            catch ( Exception ex )
            {

                result.Add("no se pudo verificar si el servicio de la BD se encuentra activo");
                result.Add(ex.Message);
            }
            return result;
        }
    }
}
