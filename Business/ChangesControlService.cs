using DataAccess;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business
{
    public class ChangesControlService
    {
        ChangesControlRepository changesControlRepository;

        public ChangesControlService()
        {
            changesControlRepository = new ChangesControlRepository();  
        }
       public DataTable getAllChanges()
        {
            return changesControlRepository.getAll();
        }
    }
}
