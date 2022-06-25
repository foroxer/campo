using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models
{
    public class Patent : Component
    {


        public override List<Component> Childs
        {
            get
            {
                return new List<Component>();
            }

        }

        public override void AddChild(Component c)
        {

        }

        public override void ClearChilds()
        {
           
        }

        public override void RemoveChild(Component c)
        {
           
        }
    }
}
