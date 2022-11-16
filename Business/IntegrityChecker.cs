using BitacoraLib.services;
using DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business
{
    public  class IntegrityChecker
    {
        UserService userService;
        DBchecker dBchecker;

        public IntegrityChecker()
        {
            userService = new UserService();
            dBchecker = new DBchecker();
        }
        public  List<String> check()
        {
            List<String> result = new List<String>();

            try
            {
                result.AddRange(BitacoraService.checkintegrity());
                result.AddRange(userService.checkintegrity());

            }
            catch ( Exception )
            {
                try
                {
                    dBchecker.testDB();
                    result.Add("Errores al obtener informacion");
                }
                catch
                {
                    result.Add("Errores al conectarse a la DB");
                }
                
            }

            return result;
        }
    }
}
