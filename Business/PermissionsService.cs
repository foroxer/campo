using DataAccess;
using Models;
using System.Collections.Generic;

namespace Business
{
    public class PermissionsService
    {
        private PermissionsRepository permissionsRepository;
        public PermissionsService()
        {
            permissionsRepository = new PermissionsRepository();
        }
        public bool Contains(Component component, Component includes)
        {
            bool exist = false;
            if (component.Id.Equals(includes.Id))
            {
                exist = true;
            }
            else
            {
                foreach (Component item in component.Childs)
                {
                    if (Contains(item, includes)) return true;
                }
            }
            return exist;
        }
        public List<PermissionsEnum> GetAllPermission()
        {
            return permissionsRepository.GetAllPermission();
        }
        public Component SaveComponent(Component component, bool isFamily)
        {
            return permissionsRepository.GuardarComponente(component, isFamily);
        }
        public void SaveFamily(Family family)
        {
            permissionsRepository.SaveFamily(family);
        }
        public List<Patent> GetAllPatentes()
        {
            return permissionsRepository.GetAllPatents();
        }
        public List<Family> GetAllFamilies()
        {
            return permissionsRepository.GetAllFamilies();
        }
        public List<Component> GetAll(string familia)
        {
            return permissionsRepository.GetAll(familia);

        }
        public void FillUserComponents(User u)
        {
            permissionsRepository.FillUserComponents(u);

        }
        public void FillFamilyComponents(Family familia)
        {
            permissionsRepository.FillFamilyComponents(familia);
        }
        public Patent GetPatent(PermissionsEnum permissionsEnum)
        {
           return  permissionsRepository.GetPatent(permissionsEnum);
        }
    }
}
