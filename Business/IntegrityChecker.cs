using BitacoraLib.services;
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

        public IntegrityChecker()
        {
            userService = new UserService();
        }
        public  List<String> check()
        {
            List<String> result = new List<String>();

            result.AddRange(BitacoraService.checkintegrity());
            result.AddRange(userService.checkintegrity());


            return result;
        }
    }
}
