using Models.interfaces;
using Models.language;
using System.Collections.Generic;


namespace Models
{
    public class Session : ILanguajeObserbable

    {
        static Session _sesion;
        public User usuario;
        private Language _language;
        public List<ILanguageObserber> languageObserbers { get; set; }
        private Session()
        {
            languageObserbers = new List<ILanguageObserber>();
        }
        public Language language
        {
            get { return _language; }
            set
            {
                _language = value;
                notifyObserbers(_language);
            }
        }
        public static Session GetInstance
        {
            get
            {
                if (_sesion == null) _sesion = new Session();
                return _sesion;
            }
        }
        public bool IsLoggedIn()
        {
            return usuario != null;
        }
        bool isInRole(Component c, PermissionsEnum permiso, bool existe)
        {


            if (c.Permiso.Equals(permiso))
                existe = true;
            else
            {
                foreach (var item in c.Childs)
                {
                    existe = isInRole(item, permiso, existe);
                    if (existe) return true;
                }
            }

            return existe;
        }
        public bool IsInRole(PermissionsEnum permiso)
        {
            bool existe = false;
            foreach (var item in usuario.Permissions)
            {
                if (item.Permiso.Equals(permiso))
                    return true;
                else
                {
                    existe = isInRole(item, permiso, existe);
                    if (existe) return true;
                }
            }
            return existe;
        }
        public void Logout()
        {
            _sesion.usuario = null;
            _sesion.language = null;
        }
        public void Login(User user)
        {
            _sesion.usuario = user;
            _sesion.language = user.Language;

        }
        public void addObserber(ILanguageObserber languageObserber)
        {
            languageObserbers.Add(languageObserber);
        }
        public void removeObserber(ILanguageObserber languageObserber)
        {
            languageObserbers.Remove(languageObserber);
        }
        public void notifyObserbers(Language languaje)
        {
            foreach (ILanguageObserber obserber in languageObserbers)
            {
                obserber.updateLanguage(language);
            }
        }
    }
}
