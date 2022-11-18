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

        public IntegrityService()
        {
            userService = new UserService();
            dBchecker = new DBchecker();
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

        }


        private List<String> checkDV()
        {
            List<String> result = new List<String>();

            try
            {
                
                result.AddRange(BitacoraService.checkintegrity());
                result.AddRange(userService.checkintegrity());
                dBchecker.testDB();

            }
            catch ( Exception )
            {
                result.Add("Errores al obtener informacion");
            }

            return result;
        }
        private List<String> checkDBService()
        {
            List<String> result = new List<String>();

            try
            {
                ServiceController sc = new ServiceController("MSSQLSERVER");

                switch ( sc.Status )
                {
                    case ServiceControllerStatus.Running:
                        break;
                    default:
                        result.Add("La base de datos no esta disponible");
                        break;
                }
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
