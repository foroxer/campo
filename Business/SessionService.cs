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
        private readonly int REINTENTOS_MAXIMOS_LOGIN = 3;

        public void Login(User user)
        {
            Session session = Session.GetInstance;
            session.Login(user);
            session.language = user.Language;

        }
        public void Login(String name, String password)
        {
            try
            {
                if (name.IsNullOrEmpty() || password.IsNullOrEmpty())
                {
                    throw new LoginException();
                }
                User user = userService.Get(name);
                if (user.Tries > REINTENTOS_MAXIMOS_LOGIN)
                {
                    throw new LoginException("Se exedio la cantidad maxima de intentos por favor hable con un administrador");
                }
                if (user.Blocked)
                {
                    throw new LoginException("Por favor hable con un administrador");
                }
                if (Crypto.HashSha256(password) != user?.Password)
                {
                    userService.AddTries(user);
                    throw new LoginException();

                }
                userService.ResetTries(user);
                Session.GetInstance.Login(user);
            }
            catch
            {
                throw;
            }
        }
            public void Logout()
            {
                Session.GetInstance.Logout();
            }

        }
    }
