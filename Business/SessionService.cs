using Business.exceptions;
using Models;
using Models.language;
using System;
using Utiles;

namespace Business
{
    public class SessionService
    {

        UserService userService = new UserService();
        public static readonly int REINTENTOS_MAXIMOS_LOGIN = 3;

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
                if (user == null) throw new LoginException("No existe el user");
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

        public void LoginWithDBProblem( String name, String password )
        {
            try
            {

                String defUser = RegReader.read("def_user");
                String defPass = RegReader.read("def_pass");

                if ( name.IsNullOrEmpty() || password.IsNullOrEmpty() || !Crypto.HashSha256(password).Equals(defPass) || !name.Equals(defUser) )
                {
                    throw new LoginException();
                }
                User user = new User()
                {
                    Nic = "superUser",
                    Name = defUser,
                    Password = defPass,
                };


                user.Permissions.Add(new Patent
                {
                    Description = PermissionsEnum.Restore.ToString(),
                    Nombre = PermissionsEnum.Restore.ToString(),
                    Permiso = PermissionsEnum.Restore
                });

                user.Permissions.Add(new Patent
                {
                    Description = PermissionsEnum.DVRecalc.ToString(),
                    Nombre = PermissionsEnum.DVRecalc.ToString(),
                    Permiso = PermissionsEnum.DVRecalc
                });

                Session.GetInstance.Login(user);

            }
            catch (Exception e)
            {
                throw e;
            }
        }

    }
}
