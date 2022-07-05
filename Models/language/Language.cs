using System.Collections.Generic;

namespace Models.language
{
    public class Language
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public List<Translation> Translations { get; set; }
    }
}
