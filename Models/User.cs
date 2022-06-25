using Models.language;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models
{
    public class User
    {
        public User()
        {
            _Permissions = new List<Component>();
        }

        private List<Component> _Permissions;

        public Int32 Id { get; set; }
        public String Name { get; set; }
        public String Password { get; set; }
        public String Mail { get; set; }
        public Language language { get; set; }

        public List<Component> Permissions
        {
            get
            {
                return _Permissions;
            }
        }

        public override string ToString()
        {
            return Name;
        }

    }
}
