using Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utiles;

namespace DataAccess
{
    public class UserRepository
    {

        PermissionsRepository permisosRepository;
        LanguageRepository languageRepository;

        public UserRepository()
        {
           permisosRepository = new PermissionsRepository();
            languageRepository = new LanguageRepository();
        }

        public void Save(User user)
        {
            SqlConnection connection = ConnectionSingleton.getConnection();
            connection.Open();
            string query = $@"INSERT INTO usuarios
                            ([nombre]
                            ,[password]
                            ,[key_idioma]
                            ,[mail])
                             VALUES
                            (@nombre
                            ,@password
                            ,'ES'
                            ,@mail)";

            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = query;
            cmd.Connection = connection;
            cmd.Parameters.Add(new SqlParameter("nombre", user.Name));
            cmd.Parameters.Add(new SqlParameter("password", user.Password));
            cmd.Parameters.Add(new SqlParameter("mail", user.Mail));

            cmd.ExecuteNonQuery();
            connection.Close();
        }

        public User Get(String nombre)
        {
            User user  = null;
            try
            {
                SqlConnection connection = ConnectionSingleton.getConnection();
                connection.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = connection;

                cmd.CommandText = $@"select * from usuarios where nombre = @nombre ;";
                cmd.Parameters.Add(new SqlParameter("nombre", nombre));

                SqlDataReader reader = cmd.ExecuteReader();

                string idLanguaje = "";
                while (reader.Read())
                {
                    user = new User
                    {
                        Id = int.Parse(reader.GetValue(reader.GetOrdinal("id_usuario")).ToString()),
                        Name = reader.GetValue(reader.GetOrdinal("nombre")).ToString(),
                        Password = reader.GetValue(reader.GetOrdinal("password")).ToString(),
                        Mail = reader.GetValue(reader.GetOrdinal("mail")).ToString()
                    };
                    idLanguaje = reader.GetValue(reader.GetOrdinal("key_idioma")).ToString();
                        
                }

                reader.Close();
                connection.Close();

                if (user != null)
                {
                    permisosRepository.FillUserComponents(user);
                    user.language = languageRepository.GetLanguage(idLanguaje);
                }

                return user;
            }
            catch
            {
                throw;
            }
        }

        public List<User> GetAll()
        {
            SqlConnection connection = ConnectionSingleton.getConnection();
            connection.Open();
            var cmd = new SqlCommand();
            cmd.Connection = connection;

            var sql = $@"select * from usuarios;";

            cmd.CommandText = sql;

            var reader = cmd.ExecuteReader();

            var lista = new List<User>();

            while (reader.Read())
            {
                User user = new User();
                user.Id = reader.GetInt32(reader.GetOrdinal("id_usuario"));
                user.Name = reader.GetString(reader.GetOrdinal("nombre"));
                user.Password = reader.GetString(reader.GetOrdinal("password"));
                user.Mail = reader.GetString(reader.GetOrdinal("mail"));
                lista.Add(user);
            }

            reader.Close();
            connection.Close();

            //vinculo los usuarios con las patentes y familias que tiene configuradas.
            foreach (var user in lista)
            {
               permisosRepository.FillUserComponents(user);
            }

            return lista;
        }

        public void SavePermissions(User user)
        {
            try
            {
                SqlConnection connection = ConnectionSingleton.getConnection();
                connection.Open();

                var cmd = new SqlCommand();
                cmd.Connection = connection;

                cmd.CommandText = $@"delete from usuarios_permisos where id_usuario=@id;";
                cmd.Parameters.Add(new SqlParameter("id", user.Id));
                cmd.ExecuteNonQuery();

                foreach (var item in user.Permissions)
                {
                    cmd = new SqlCommand();
                    cmd.Connection = connection;

                    cmd.CommandText = $@"insert into usuarios_permisos (id_usuario,id_permiso) values (@id_usuario,@id_permiso) "; ;
                    cmd.Parameters.Add(new SqlParameter("id_usuario", user.Id));
                    cmd.Parameters.Add(new SqlParameter("id_permiso", item.Id));

                    cmd.ExecuteNonQuery();
                }
                connection.Close();
            }
            catch (Exception)
            {

                throw;
            }
        }

        public void UpdatePassword(User user)
        {
            SqlConnection connection = ConnectionSingleton.getConnection();
            connection.Open();
            string query = $@"update usuarios set password = @password where id_usuario =@id";

            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = query;
            cmd.Connection = connection;
            cmd.Parameters.Add(new SqlParameter("id", user.Id));
            cmd.Parameters.Add(new SqlParameter("password", user.Password));

            cmd.ExecuteNonQuery();
            connection.Close();
        }
    }
   
}
