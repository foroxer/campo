using Models.interfaces;
using Models.language;
using System.Collections.Generic;


namespace Models
{
    public class Session : ILanguajeObserbable

    {
        private Session()
        {
            languageObserbers = new List<ILanguageObserber>();
        }
        static Session _session;
        private Language _language;
        public User user;
        public Language language
        {
            get { return _language; }
            set
            {
                _language = value;
                notifyObserbers(_language);
            }
        }
        public List<ILanguageObserber> languageObserbers { get; set; }
        public static Session GetInstance
        {
            get
            {
                if (_session == null) _session = new Session();
                return _session;
            }
        }

        //todos estos metodos debrian estar en sessionService
        public bool IsLoggedIn()
        {
            return user != null;
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
            foreach (var item in user.Permissions)
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
            _session.user = null;
            _session.language = null;
        }
        public void Login(User user)
        {
            _session.user = user;
            _session.language = user.Language;

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
