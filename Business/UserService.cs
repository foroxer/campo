using BitacoraLib.dataAccess;
using BitacoraLib.entities;
using DataAccess;
using Models;
using System;
using System.Collections.Generic;
using System.Text;
using Utiles;

namespace Business
{

    public class UserService
    {
        PermissionsService permissionsService;
        LanguageService languageService;

        UserRepository userRepository;
        public UserService()
        {
            userRepository = new UserRepository();
            permissionsService = new PermissionsService();
            languageService = new LanguageService();
        }
        public List<User> GetAll()
        {
            List<User> users = userRepository.getAll();
            users.ForEach(user => user.Language = languageService.GetLanguage(user.Language.ID));
            return users;
        }
        public User Get(String nic)
        {
            return userRepository.get(nic);
        }
        public User Get( int id )
        {
            return userRepository.get(id);
        }
        public void SavePermissions(User user)
        {
            userRepository.savePermissions(user);
        }
        public void ResetPassword(User user)
        {
            string oldPassword = user.Password;
            try
            {
                string nonHashedPassword = Crypto.RandomString(10);
                user.Password = Crypto.HashSha256(nonHashedPassword);
                userRepository.updatePassword(user);

                StringBuilder sb = new StringBuilder();
                sb.Append("Hola, ");
                sb.Append(user.Name);
                sb.AppendLine("Su contraseña fue actualizada: ");
                sb.AppendLine(nonHashedPassword);

                MailService.SendMail(sb.ToString(), user.Mail);
            }
            catch (Exception)
            {
                try
                {
                    user.Password = oldPassword;
                    userRepository.updatePassword(user);
                }
                catch (Exception)
                {
                    throw;
                }
            }
        }
        public void CreateUser(User user)
        {
            try
            {
                user.Permissions.Add(permissionsService.GetPatent(PermissionsEnum.VerRutina));

                string nonHashedPassword = Crypto.RandomString(10);
                user.Password = Crypto.HashSha256(nonHashedPassword);
                userRepository.save(user);

                StringBuilder sb = new StringBuilder();
                sb.Append("Hola, ");
                sb.Append(user.Name);
                sb.AppendLine("Su cuenta fue creada. ");
                sb.AppendLine("Su password es: ");
                sb.AppendLine(nonHashedPassword);

                MailService.SendMail(sb.ToString(), user.Mail);
            }
            catch (Exception)
            {
                throw;
            }  
        }
        public void UpdateUser(User user)
        {
            userRepository.update(user);
        }
        public void AddTries(User user)
        {
            User toUpdate = Get(user.Nic);
            toUpdate.Tries += 1;
            UpdateUser(toUpdate);
        }
        public void ResetTries(User user)
        {
            User toUpdate = Get(user.Nic);
            toUpdate.Tries = 0;
            UpdateUser(toUpdate);
        }
        public void BlockUser(User user)
        {
            User toUpdate = Get(user.Nic);
            toUpdate.Blocked = true;
            UpdateUser(toUpdate);
        }
        public void UnblockUser(User user)
        {
            User toUpdate = Get(user.Nic);
            toUpdate.Blocked = false;
            UpdateUser(toUpdate);
        }
        public void ChangePassword(string pass, string newPass, User user)
        {
           if( Crypto.HashSha256(pass) == user?.Password)
            {
                string oldPassword = user.Password;
                try
                {
                    string nonHashedPassword = newPass;
                    user.Password = Crypto.HashSha256(nonHashedPassword);
                    userRepository.updatePassword(user);

                    StringBuilder sb = new StringBuilder();
                    sb.Append("Hola, ");
                    sb.Append(user.Name);
                    sb.AppendLine("Su contraseña fue actualizada: ");
                    sb.AppendLine(nonHashedPassword);

                    MailService.SendMail(sb.ToString(), user.Mail);
                }
                catch (Exception)
                {
                    try
                    {
                        user.Password = oldPassword;
                        userRepository.updatePassword(user);
                    }
                    catch (Exception)
                    {
                        throw;
                    }
                }
            }
              
        }
        public List<String> checkintegrity()
        {
            List<String> errors = new List<string>();
            List<User> list = userRepository.getAll();

            list.ForEach(item =>
            {
                if ( !item.dvh.Equals(userRepository.calculateDVH(item)) )
                {
                    errors.Add($"Usuarios: El Usuario con id : {item.Id} , fue modificado");
                }
            });

            if ( !userRepository.calculateDVV(list).Equals(userRepository.getDVV()) )
            {
                errors.Add($"El digito verificador vertical de la tabla usuarios no es correcto");
            }

            return errors;
        }
    }
}
