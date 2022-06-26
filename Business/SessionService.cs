using Business.exceptions;
using Models;
using System;
using Utiles;

namespace Business
{
    public class SessionService
    {

        UserService userService = new UserService();
        LanguageService languageService = new LanguageService();
        public void Login(User user)
        {
            Session session = Session.GetInstance;
            session.Login(user);
            session.language = languageService.GetLanguage(user.language.Key);

        }

        public void Login(String name, String Password)
        {
            if (string.IsNullOrEmpty(name) || string.IsNullOrEmpty(Password))
            {
                throw new LoginException();
            }
            User usuario = userService.Get(name);

            if (Crypto.HashSha256(Password) != usuario?.Password)
            {
                throw new LoginException();
            }
            Session.GetInstance.Login(usuario);
        }

        public void Logout()
        {
            Session.GetInstance.Logout();
        }
    }
}
