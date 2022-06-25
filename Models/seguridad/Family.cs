using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models
{
    public class Family : Component
    {
        private List<Component> _childs;
        public Family()
        {
            _childs = new List<Component>();
        }

        public override List<Component> Childs
        {
            get
            {
                return _childs.ToList();
            }

        }

        public override void ClearChilds()
        {
            _childs = new List<Component>();
        }
        public override void AddChild(Component c)
        {
            _childs.Add(c);
        }

        public override void RemoveChild(Component c)
        {
            _childs.Remove(c);
        }
    }
}
