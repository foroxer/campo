using System.Collections.Generic;

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
