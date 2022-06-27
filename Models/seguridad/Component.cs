using System.Collections.Generic;

namespace Models
{
    public abstract class Component
    {
        public string Nombre { get; set; }
        public int Id { get; set; }
        public string Description { get; set; }

        public abstract List<Component> Childs { get; }
        public abstract void AddChild(Component c);
        public abstract void RemoveChild(Component c);
        public abstract void ClearChilds();
        public PermissionsEnum Permiso { get; set; }

        public override string ToString()
        {
            return Nombre;
        }

    }
}
