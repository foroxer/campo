using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models.language
{
    public class Language
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public string Key { get; set; }
        public List<Translation> Translations { get; set; }
    }
}
