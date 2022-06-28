﻿using DataAccess;
using Models;
using System;
using System.Collections.Generic;
using System.Text;
using Utiles;

namespace Business
{

    public class UserService
    {
        UserRepository userRepository;
        PermissionsRepository permissionsRepository;

        public UserService()
        {
            userRepository = new UserRepository();
            permissionsRepository = new PermissionsRepository();
        }
        public List<User> GetAll()
        {
            return userRepository.GetAll();
        }
        public User Get(String nic)
        {
            return userRepository.Get(nic);
        }
        public void SavePermissions(User user)
        {
            userRepository.SavePermissions(user);
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
                sb.AppendLine("Su contraseña fue actualizada: ");
                sb.AppendLine(nonHashedPassword);

                MailService.SendMail(sb.ToString(), user.Mail);
            }
            catch (Exception)
            {
                try
                {
                    user.Password = oldPassword;
                    userRepository.UpdatePassword(user);
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
                user.Permissions.Add(permissionsRepository.GetPatent(PermissionsEnum.Default));

                string nonHashedPassword = Crypto.RandomString(10);
                user.Password = Crypto.HashSha256(nonHashedPassword);
                userRepository.Create(user);

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
            userRepository.updateUser(user);
        }
        public void addTries(User user)
        {
            userRepository.addTries(user);
        }
        public void resetTries(User user)
        {
            userRepository.resetTries(user);
        }
    }
}
