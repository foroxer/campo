using Models.language;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utiles;

namespace DataAccess
{
    public class LanguageRepository
    {
        public List<Language> GetAllLanguagesWithoutTranslations()
        {
            SqlConnection connection = ConnectionSingleton.getConnection();
            try
            {
                connection.Open();
                var cmd = new SqlCommand();
                cmd.Connection = connection;

                var sql = $@"select * from idioma;";

                cmd.CommandText = sql;

                SqlDataReader reader = cmd.ExecuteReader();

                List<Language> lista = new List<Language>();

                while (reader.Read())
                {
                    Language language = new Language();
                    language.ID = reader.GetInt32(reader.GetOrdinal("id"));
                    language.Name = reader.GetString(reader.GetOrdinal("name"));
                    language.Key = reader.GetString(reader.GetOrdinal("key"));
                    lista.Add(language);
                }

                reader.Close();
                connection.Close();

                return lista;
            }
            catch
            {
                connection.Close();
                throw;
            }
        }


        public Language GetLanguage(string key)
        {
            SqlConnection connection = ConnectionSingleton.getConnection();

            try
            {
                connection.Open();
                var cmd = new SqlCommand();
                cmd.Connection = connection;

                var sql = $@"select * from idioma i where i.[key] = '{key}'";

                cmd.CommandText = sql;

                SqlDataReader reader = cmd.ExecuteReader();


                Language language = new Language();
                while (reader.Read())
                {
                    language.ID = reader.GetInt32(reader.GetOrdinal("id"));
                    language.Name = reader.GetString(reader.GetOrdinal("name"));
                    language.Key = reader.GetString(reader.GetOrdinal("key"));
                }
                reader.Close();
                connection.Close();

                language.Translations = this.GetTranslations(language);

                return language;
            }
            catch (Exception)
            {
                connection.Close();
                throw;
            }
            

            
        }public Language GetLanguage(int id)
        {
            SqlConnection connection = ConnectionSingleton.getConnection();

            try
            {
                connection.Open();
                var cmd = new SqlCommand();
                cmd.Connection = connection;

                var sql = $@"select * from idioma i where i.id = '{id}'";

                cmd.CommandText = sql;

                SqlDataReader reader = cmd.ExecuteReader();


                Language language = new Language();
                while (reader.Read())
                {
                    language.ID = reader.GetInt32(reader.GetOrdinal("id"));
                    language.Name = reader.GetString(reader.GetOrdinal("name"));
                    language.Key = reader.GetString(reader.GetOrdinal("key"));
                }
                reader.Close();
                connection.Close();

                language.Translations = this.GetTranslations(language);

                return language;
            }
            catch (Exception)
            {
                connection.Close();
                throw;
            }  
        }

        private List<Translation> GetTranslations (Language language)
        {
            SqlConnection connection = ConnectionSingleton.getConnection();

            try
            {

                connection.Open();
                var cmd = new SqlCommand();
                cmd.Connection = connection;

                var sql = $@"select * from traduccion where id_idioma = {language.ID};";

                cmd.CommandText = sql;

                SqlDataReader reader = cmd.ExecuteReader();

                List<Translation> lista = new List<Translation>();

                while (reader.Read())
                {
                    Translation translation = new Translation();
                    translation.ID = reader.GetInt32(reader.GetOrdinal("id"));
                    translation.Translate = reader.GetString(reader.GetOrdinal("traduccion"));
                    translation.Key = reader.GetString(reader.GetOrdinal("key"));
                    lista.Add(translation);
                }

                reader.Close();
                connection.Close();

                return lista;

            }
            catch (Exception)
            {
                connection.Close();
                throw;
            }

        }
    }
}
