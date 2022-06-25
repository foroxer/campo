using Models;
using DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utiles;

namespace Business
{
      
    public class UserService 
    {
        UserRepository userRepository;

        public UserService()
        {
            userRepository = new UserRepository();
        }

        public List<User> GetAll()
        {
            return userRepository.GetAll();
        }

        public void Save(User user)
        {
            userRepository.Save(user);
        }

        public User Get(String name)
        {
            return userRepository.Get(name);
        }

        public void SavePermissions(User u)
        {
            userRepository.SavePermissions(u);
        }

        public void ResetPassword(User user)
        {
            string oldPassword = user.Password;
            try
            {
                string nonHashedPassword = Crypto.RandomString(10);
                user.Password = Crypto.HashSha256(nonHashedPassword);
                userRepository.UpdatePassword(user);

                StringBuilder sb = new StringBuilder();
                sb.Append("Hola, ");
                sb.Append(user.Name);
                sb.AppendLine("su contraseña fue actualizada: ");
                sb.AppendLine(nonHashedPassword);

                MailService.SendMail(sb.ToString(), user.Mail);
            }
            catch (Exception)
            {
                try
                {
                    user.Password = oldPassword;
                    userRepository.SavePermissions(user);
                }
                catch (Exception)
                {
                    throw;
                }
            }
        }
    }
}
