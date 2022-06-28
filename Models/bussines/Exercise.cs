using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models.bussines
{
    public class Exercise
    {
        public int Id { get; set; }
        public Machine Machine { get; set; }
        public MuscularGroup MuscularGroup { get; set; }
        public string Description { get; set; }
    }
}
