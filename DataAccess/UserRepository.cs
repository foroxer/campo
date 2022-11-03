using DigitosVerificadoresLib;
using DigitosVerificadoresLib.services;
using Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using Utiles;

namespace DataAccess
{
    public class UserRepository : IDVDAO<User>
    {
        PermissionsRepository permisosRepository;
        LanguageRepository languageRepository;

        public UserRepository()
        {
            permisosRepository = new PermissionsRepository();
            languageRepository = new LanguageRepository();
        }
        public void save( User user )
        {
            try
            {
                SqlConnection connection = ConnectionSingleton.getConnection();
                connection.Open();
                SqlTransaction transaction = connection.BeginTransaction();
                SqlCommand cmd;
                try
                {
                    cmd = new SqlCommand();
                    cmd.CommandText = $@"INSERT INTO [dbo].[usuarios]
                                    ([Nic]
                                    ,[password]
                                    ,[mail]
                                    ,[key_idioma]
                                    ,[bloqueado]
                                    ,[intentos]
                                    ,[dvh])
                                    VALUES
                                    (@Nic
                                    ,@password
                                    ,@mail
                                    ,1
                                    ,0
                                    ,0
                                    ,@dvh)";


                    cmd.Connection = connection;
                    cmd.Transaction = transaction;
                    cmd.Parameters.Add(new SqlParameter("Nic", user.Nic.NullOrEmpty()));
                    cmd.Parameters.Add(new SqlParameter("password", user.Password.NullOrEmpty()));
                    cmd.Parameters.Add(new SqlParameter("mail", user.Mail.NullOrEmpty()));
                    cmd.Parameters.Add(new SqlParameter("dvh", calculateDVH(user)));



                    cmd.ExecuteNonQuery();

                    cmd = new SqlCommand();
                    cmd.Connection = connection;
                    cmd.Transaction = transaction;
                    cmd.CommandText = $@"select * from usuarios where Nic = @Nic ;";
                    cmd.Parameters.Add(new SqlParameter("Nic", user.Nic));
                    SqlDataReader reader = cmd.ExecuteReader();
                    reader.Read();
                    user.Id = int.Parse(reader.GetValue(reader.GetOrdinal("id_usuario")).ToString());
                    reader.Close();

                    cmd = new SqlCommand();
                    cmd.CommandText = $@"INSERT INTO [dbo].[usuario_data]
                                   ([id_usuario]
                                    ,[nombre]
                                    ,[apellido]
                                    ,[telefono]
                                    ,[direccion]
                                    ,[dni]
                                    ,[dvh])
                                    VALUES
                                    (@id
                                    ,@nombre
                                    ,@apellido
                                    ,@telefono  
                                    ,@direccion
                                    ,@dni
                                    ,@dvh)";

                    cmd.Connection = connection;
                    cmd.Transaction = transaction;
                    cmd.Parameters.Add(new SqlParameter("id", user.Id));
                    cmd.Parameters.Add(new SqlParameter("nombre", user.Name.NullOrEmpty()));
                    cmd.Parameters.Add(new SqlParameter("apellido", user.LastName.NullOrEmpty()));
                    cmd.Parameters.Add(new SqlParameter("telefono", user.Phone.NullOrEmpty()));
                    cmd.Parameters.Add(new SqlParameter("direccion", user.Adress.NullOrEmpty()));
                    cmd.Parameters.Add(new SqlParameter("dni", user.Dni.NullOrEmpty()));
                    cmd.Parameters.Add(new SqlParameter("dvh", calculateDVH(user)));


                    cmd.ExecuteNonQuery();

                    transaction.Commit();

                    connection.Close();

                    savePermissions(user);
                }
                catch
                {
                    transaction.Rollback();
                    connection.Close();
                    throw;
                }


            }
            catch
            {
                throw;
            }
        }
        public User get( String Nic )
        {
            User user = null;
            try
            {
                SqlConnection connection = ConnectionSingleton.getConnection();
                connection.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = connection;
                cmd.CommandText = $@"select * from usuarios u inner join usuario_data ud on u.id_usuario = ud.id_usuario  where Nic = @Nic ;";
                cmd.Parameters.Add(new SqlParameter("Nic", Nic));

                SqlDataReader reader = cmd.ExecuteReader();

                int idLanguaje = 0;
                while ( reader.Read() )
                {
                    user = new User
                    {
                        Id = int.Parse(reader.GetValue(reader.GetOrdinal("id_usuario")).ToString()),
                        Nic = reader.GetValue(reader.GetOrdinal("Nic")).ToString(),
                        Password = reader.GetValue(reader.GetOrdinal("password")).ToString(),
                        Mail = reader.GetValue(reader.GetOrdinal("mail")).ToString(),
                        LastName = reader.GetValue(reader.GetOrdinal("apellido")).ToString(),
                        Name = reader.GetValue(reader.GetOrdinal("nombre")).ToString(),
                        Adress = reader.GetValue(reader.GetOrdinal("direccion")).ToString(),
                        Phone = reader.GetValue(reader.GetOrdinal("telefono")).ToString(),
                        Dni = reader.GetValue(reader.GetOrdinal("dni")).ToString(),
                        Blocked = reader.GetBoolean(reader.GetOrdinal("bloqueado")),
                        Tries = int.Parse(reader.GetValue(reader.GetOrdinal("intentos")).ToString()),
                        dvh = reader.GetValue(reader.GetOrdinal("dvh")).ToString()
                    };
                    idLanguaje = int.Parse(reader.GetValue(reader.GetOrdinal("key_idioma")).ToString());
                }

                reader.Close();
                connection.Close();

                if ( user != null )
                {
                    permisosRepository.FillUserComponents(user);
                    user.Language = languageRepository.GetLanguage(idLanguaje);
                }

                return user;
            }
            catch
            {
                throw;
            }
        }
        public User get( int id )
        {
            User user = null;
            try
            {
                SqlConnection connection = ConnectionSingleton.getConnection();
                connection.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = connection;
                cmd.CommandText = $@"select * from usuarios u inner join usuario_data ud on u.id_usuario = ud.id_usuario  where ud.id_usuario = @id ;";
                cmd.Parameters.Add(new SqlParameter("id", id));

                SqlDataReader reader = cmd.ExecuteReader();

                int idLanguaje = 0;
                while ( reader.Read() )
                {
                    user = new User
                    {
                        Id = int.Parse(reader.GetValue(reader.GetOrdinal("id_usuario")).ToString()),
                        Nic = reader.GetValue(reader.GetOrdinal("Nic")).ToString(),
                        Password = reader.GetValue(reader.GetOrdinal("password")).ToString(),
                        Mail = reader.GetValue(reader.GetOrdinal("mail")).ToString(),
                        LastName = reader.GetValue(reader.GetOrdinal("apellido")).ToString(),
                        Name = reader.GetValue(reader.GetOrdinal("nombre")).ToString(),
                        Adress = reader.GetValue(reader.GetOrdinal("direccion")).ToString(),
                        Phone = reader.GetValue(reader.GetOrdinal("telefono")).ToString(),
                        Dni = reader.GetValue(reader.GetOrdinal("dni")).ToString(),
                        Blocked = reader.GetBoolean(reader.GetOrdinal("bloqueado")),
                        Tries = int.Parse(reader.GetValue(reader.GetOrdinal("intentos")).ToString()),
                        dvh = reader.GetValue(reader.GetOrdinal("dvh")).ToString()
                    };
                    idLanguaje = int.Parse(reader.GetValue(reader.GetOrdinal("key_idioma")).ToString());
                }

                reader.Close();
                connection.Close();

                if ( user != null )
                {
                    permisosRepository.FillUserComponents(user);
                    user.Language = languageRepository.GetLanguage(idLanguaje);
                }

                return user;
            }
            catch
            {
                throw;
            }
        }
        public List<User> getAll()
        {
            //los usuarios no tienen los idiomas 
            SqlConnection connection = ConnectionSingleton.getConnection();
            connection.Open();
            var cmd = new SqlCommand();
            cmd.Connection = connection;

            var sql = $@"select * from usuarios u left join usuario_data ud on ud.id_usuario = u.id_usuario;";

            cmd.CommandText = sql;

            var reader = cmd.ExecuteReader();

            var lista = new List<User>();

            while ( reader.Read() )
            {
                User user = new User()
                {
                    Id = int.Parse(reader.GetValue(reader.GetOrdinal("id_usuario")).ToString()),
                    Nic = reader.GetValue(reader.GetOrdinal("Nic")).ToString(),
                    Password = reader.GetValue(reader.GetOrdinal("password")).ToString(),
                    Mail = reader.GetValue(reader.GetOrdinal("mail")).ToString(),
                    LastName = reader.GetValue(reader.GetOrdinal("apellido")).ToString(),
                    Name = reader.GetValue(reader.GetOrdinal("nombre")).ToString(),
                    Adress = reader.GetValue(reader.GetOrdinal("direccion")).ToString(),
                    Phone = reader.GetValue(reader.GetOrdinal("telefono")).ToString(),
                    Dni = reader.GetValue(reader.GetOrdinal("dni")).ToString(),
                    Blocked = reader.GetBoolean(reader.GetOrdinal("bloqueado")),
                    Tries = int.Parse(reader.GetValue(reader.GetOrdinal("intentos")).ToString()),
                    dvh = reader.GetValue(reader.GetOrdinal("dvh")).ToString(),
                    Language = new Models.language.Language() { ID = int.Parse(reader.GetValue(reader.GetOrdinal("key_idioma")).ToString()) }
                 
                };
                lista.Add(user);
            }

            reader.Close();
            connection.Close();

            //vinculo los usuarios con las patentes y familias que tiene configuradas.
            foreach ( var user in lista )
            {
                permisosRepository.FillUserComponents(user);
            }

            return lista;
        }
        public void savePermissions( User user )
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

                foreach ( var item in user.Permissions )
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
            catch ( Exception )
            {

                throw;
            }
        }
        public void updatePassword( User user )
        {

            SqlConnection connection = ConnectionSingleton.getConnection();
            try
            {
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
            catch
            {
                connection.Close();
                throw;
            }
            user = get(user.Nic);
            update(user);
        }
        public void update( User user )
        {
            SqlConnection connection = ConnectionSingleton.getConnection();

            SqlTransaction transaction;
            try
            {
                connection.Open();
                transaction = connection.BeginTransaction();
                try
                {
                    SqlCommand cmd;

                    string query = $@"UPDATE [dbo].[usuarios]
                                       SET [mail] = @mail
                                            ,[nic] = @nic
                                            ,[key_idioma] = @idioma
                                            ,[intentos] = @tries
                                            ,[bloqueado] = @blocked
                                            ,[dvh] = @dvh
                                          where id_usuario =@id
                                        ";

                    cmd = new SqlCommand();
                    cmd.Transaction = transaction;
                    cmd.CommandText = query;
                    cmd.Connection = connection;
                    cmd.Parameters.Add(new SqlParameter("id", user.Id));
                    cmd.Parameters.Add(new SqlParameter("mail", user.Mail));
                    cmd.Parameters.Add(new SqlParameter("nic", user.Nic));
                    cmd.Parameters.Add(new SqlParameter("idioma", user.Language.ID));
                    cmd.Parameters.Add(new SqlParameter("tries", user.Tries));
                    cmd.Parameters.Add(new SqlParameter("blocked", user.Blocked));
                    cmd.Parameters.Add(new SqlParameter("dvh", calculateDVH(user)));

                    cmd.ExecuteNonQuery();

                    query = $@"UPDATE [dbo].[usuario_data]
                               SET  [nombre] = @nombre
                                    ,[apellido] = @apellido
                                    ,[telefono] = @telefono
                                    ,[direccion] = @direccion
                                    ,[dni] = @dni
                                    ,[dvh] = @dvh
                                  where id_usuario =@id
                                ";

                    cmd = new SqlCommand();
                    cmd.Transaction = transaction;
                    cmd.CommandText = query;
                    cmd.Connection = connection;
                    cmd.Parameters.Add(new SqlParameter("id", user.Id));
                    cmd.Parameters.Add(new SqlParameter("nombre", user.Name));
                    cmd.Parameters.Add(new SqlParameter("telefono", user.Phone));
                    cmd.Parameters.Add(new SqlParameter("apellido", user.LastName));
                    cmd.Parameters.Add(new SqlParameter("direccion", user.Adress));
                    cmd.Parameters.Add(new SqlParameter("dni", user.Dni));
                    cmd.Parameters.Add(new SqlParameter("dvh", calculateDVH(user)));

                    cmd.ExecuteNonQuery();
                    transaction.Commit();

                    connection.Close();
                }
                catch
                {
                    transaction.Rollback();
                    throw;
                }
            }
            catch
            {
                connection.Close();
                throw;
            }
        }
        public string calculateDVH( User user )
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(user.Name);
            sb.Append(user.Password);
            sb.Append(user.Blocked.ToString());
            sb.Append(user.Dni);
            sb.Append(user.Mail);
            sb.Append(user.Phone);
            sb.Append(user.Nic);
            sb.Append(user.Tries.ToString());

            return DVService.getDV(sb.ToString());
        }
        public string calculateDVV( List<User> list )
        {
            return DVService.getDV(list.Aggregate<User, String>("", ( a, b ) => a + b.dvh));
        }
    }
}
