using Models;
using Models.bussines;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utiles;

namespace DataAccess
{
    public class ExerciseRepository
    {
        public List<MachineType> GetMachineTypes()
        {
            SqlConnection connection = ConnectionSingleton.getConnection();
            try
            {
                connection.Open();
                var cmd = new SqlCommand();
                cmd.Connection = connection;

                var sql = $@"select * from tipo_maquina;";

                cmd.CommandText = sql;

                SqlDataReader reader = cmd.ExecuteReader();

                List<MachineType> lista = new List<MachineType>();

                while (reader.Read())
                {
                    MachineType machine = new MachineType();
                    machine.Id = reader.GetInt32(reader.GetOrdinal("id"));
                    machine.Name = reader.GetString(reader.GetOrdinal("nombre"));
                    lista.Add(machine);
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

        public List<Exercise> GetAllExercises()
        {
            SqlConnection connection = ConnectionSingleton.getConnection();
            try
            {
                connection.Open();
                var cmd = new SqlCommand();
                cmd.Connection = connection;

                var sql = $@"select gmm.id,gmm.descripcion,gmm.id_tipo_maquina,gmm.id_tipo_grupo_muscular,tgm.nombre as nombre_grupo_muscular,tm.nombre as nombre_maquina 
                            from dbo.grupo_muscular_maquina gmm 
                            inner join dbo.tipo_maquina tm on gmm.id_tipo_maquina = tm.id 
                            inner join dbo.tipo_grupo_muscular tgm on gmm.id_tipo_grupo_muscular = tgm.id";

                cmd.CommandText = sql;

                SqlDataReader reader = cmd.ExecuteReader();

                List<Exercise> lista = new List<Exercise>();

                while (reader.Read())
                {
                    Exercise exercise = new Exercise()
                    {
                        Id = reader.GetInt32(reader.GetOrdinal("id")),
                        Description = reader.GetString(reader.GetOrdinal("descripcion")),
                        MachineType = new MachineType()
                        {
                            Id = reader.GetInt32(reader.GetOrdinal("id_tipo_maquina")),
                            Name = reader.GetString(reader.GetOrdinal("nombre_maquina")),
                        },
                        MuscularGroup = new MuscularGroup()
                        {
                            Id = reader.GetInt32(reader.GetOrdinal("id_tipo_grupo_muscular")),
                            Name = reader.GetString(reader.GetOrdinal("nombre_grupo_muscular")),
                        },
                    };
                    lista.Add(exercise);
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

        public List<MuscularGroup> GetMuscularGroups()
        {
            SqlConnection connection = ConnectionSingleton.getConnection();
            try
            {
                connection.Open();
                var cmd = new SqlCommand();
                cmd.Connection = connection;

                var sql = $@"select * from tipo_grupo_muscular;";

                cmd.CommandText = sql;

                SqlDataReader reader = cmd.ExecuteReader();

                List<MuscularGroup> lista = new List<MuscularGroup>();

                while (reader.Read())
                {
                    MuscularGroup muscularGroup = new MuscularGroup();
                    muscularGroup.Id = reader.GetInt32(reader.GetOrdinal("id"));
                    muscularGroup.Name = reader.GetString(reader.GetOrdinal("nombre"));
                    lista.Add(muscularGroup);
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

        public List<Exercise> GetExercisesBy(int muscularGroupId)
        {
            SqlConnection connection = ConnectionSingleton.getConnection();
            try
            {
                connection.Open();
                var cmd = new SqlCommand();
                cmd.Connection = connection;

                var sql = $@"select gmm.id,gmm.descripcion,gmm.id_tipo_maquina,gmm.id_tipo_grupo_muscular,tgm.nombre as nombre_grupo_muscular,tm.nombre as nombre_maquina 
                            from dbo.grupo_muscular_maquina gmm 
                            inner join dbo.tipo_maquina tm on gmm.id_tipo_maquina = tm.id 
                            inner join dbo.tipo_grupo_muscular tgm on gmm.id_tipo_grupo_muscular = tgm.id where gmm.id_tipo_grupo_muscular = {muscularGroupId};";

                cmd.CommandText = sql;

                SqlDataReader reader = cmd.ExecuteReader();

                List<Exercise> lista = new List<Exercise>();

                while (reader.Read())
                {
                    Exercise exercise = new Exercise()
                    {
                        Id = reader.GetInt32(reader.GetOrdinal("id")),
                        Description = reader.GetString(reader.GetOrdinal("descripcion")),
                        MachineType = new MachineType()
                        {
                            Id = reader.GetInt32(reader.GetOrdinal("id_tipo_maquina")),
                            Name = reader.GetString(reader.GetOrdinal("nombre_maquina")),
                        },
                        MuscularGroup = new MuscularGroup()
                        {
                            Id = reader.GetInt32(reader.GetOrdinal("id_tipo_grupo_muscular")),
                            Name = reader.GetString(reader.GetOrdinal("nombre_grupo_muscular")),
                        },
                    };
                    lista.Add(exercise);
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

        public List<Exercise> GetExercisesBy(MuscularGroup muscularGroup)
        {
            return GetExercisesBy(muscularGroup.Id);
        }
        public List<Exercise> GetExercisesBy(MachineType machine)
        {
            SqlConnection connection = ConnectionSingleton.getConnection();
            try
            {
                connection.Open();
                var cmd = new SqlCommand();
                cmd.Connection = connection;

                var sql = $@"select gmm.id,gmm.descripcion,gmm.id_tipo_maquina,gmm.id_tipo_grupo_muscular,tgm.nombre as nombre_grupo_muscular,tm.nombre as nombre_maquina 
                            from dbo.grupo_muscular_maquina gmm 
                            inner join dbo.tipo_maquina tm on gmm.id_tipo_maquina = tm.id 
                            inner join dbo.tipo_grupo_muscular tgm on gmm.id_tipo_grupo_muscular = tgm.id 
                            where gmm.id_tipo_maquina = {machine.Id};";

                cmd.CommandText = sql;

                SqlDataReader reader = cmd.ExecuteReader();

                List<Exercise> lista = new List<Exercise>();

                while (reader.Read())
                {
                    Exercise exercise = new Exercise()
                    {
                        Id = reader.GetInt32(reader.GetOrdinal("id")),
                        Description = reader.GetString(reader.GetOrdinal("descripcion")),
                        MachineType = new MachineType()
                        {
                            Id = reader.GetInt32(reader.GetOrdinal("id_tipo_maquina")),
                            Name = reader.GetString(reader.GetOrdinal("nombre_maquina")),
                        },
                        MuscularGroup = new MuscularGroup()
                        {
                            Id = reader.GetInt32(reader.GetOrdinal("id_tipo_grupo_muscular")),
                            Name = reader.GetString(reader.GetOrdinal("nombre_grupo_muscular")),
                        },
                    };
                    lista.Add(exercise);
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
        public List<Exercise> GetExercisesBy(MachineType machine, MuscularGroup muscularGroup)
        {
            SqlConnection connection = ConnectionSingleton.getConnection();
            try
            {
                connection.Open();
                var cmd = new SqlCommand();
                cmd.Connection = connection;

                var sql = $@"select gmm.id,gmm.descripcion,gmm.id_tipo_maquina,gmm.id_tipo_grupo_muscular,tgm.nombre as nombre_grupo_muscular,tm.nombre as nombre_maquina 
                            from dbo.grupo_muscular_maquina gmm 
                            inner join dbo.tipo_maquina tm on gmm.id_tipo_maquina = tm.id 
                            inner join dbo.tipo_grupo_muscular tgm on gmm.id_tipo_grupo_muscular = tgm.id 
                            where gmm.id_tipo_maquina = {machine.Id} and gmm.id_tipo_grupo_muscular = {muscularGroup.Id};";

                cmd.CommandText = sql;

                SqlDataReader reader = cmd.ExecuteReader();

                List<Exercise> lista = new List<Exercise>();

                while (reader.Read())
                {
                    Exercise exercise = new Exercise()
                    {
                        Id = reader.GetInt32(reader.GetOrdinal("id")),
                        Description = reader.GetString(reader.GetOrdinal("descripcion")),
                        MachineType = new MachineType()
                        {
                            Id = reader.GetInt32(reader.GetOrdinal("id_tipo_maquina")),
                            Name = reader.GetString(reader.GetOrdinal("nombre_maquina")),
                        },
                        MuscularGroup = new MuscularGroup()
                        {
                            Id = reader.GetInt32(reader.GetOrdinal("id_tipo_grupo_muscular")),
                            Name = reader.GetString(reader.GetOrdinal("nombre_grupo_muscular")),
                        },
                    };
                    lista.Add(exercise);
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
        public void CreateExercise(MachineType machine, MuscularGroup muscularGroup, string description)
        {
            SqlConnection connection = ConnectionSingleton.getConnection();
            try
            {
                connection.Open();
                var cmd = new SqlCommand();
                cmd.Connection = connection;

                var sql = $@"INSERT INTO [dbo].[grupo_muscular_maquina]
                                       ([id_tipo_maquina]
                                       ,[id_tipo_grupo_muscular]
                                       ,[descripcion])
                                 VALUES
                                       (@machine
                                       ,@muscularGroup
                                       ,@description) ";

                cmd.CommandText = sql;
                cmd.Parameters.Add(new SqlParameter("machine", machine.Id));
                cmd.Parameters.Add(new SqlParameter("muscularGroup", muscularGroup.Id));
                cmd.Parameters.Add(new SqlParameter("description", description));

                cmd.ExecuteNonQuery();

                connection.Close();
            }
            catch
            {
                connection.Close();
                throw;
            }
        }
        public void CreateMachineType(String name)
        {
            SqlConnection connection = ConnectionSingleton.getConnection();
            try
            {
                connection.Open();
                var cmd = new SqlCommand();
                cmd.Connection = connection;

                var sql = $@"INSERT INTO [dbo].[tipo_maquina] (nombre) VALUES (@name)";

                cmd.CommandText = sql;
                cmd.Parameters.Add(new SqlParameter("name", name));

                cmd.ExecuteNonQuery();

                connection.Close();
            }
            catch
            {
                connection.Close();
                throw;
            }
        }
        public void CreateMuscularGroup(String name)
        {
            SqlConnection connection = ConnectionSingleton.getConnection();
            try
            {
                connection.Open();
                var cmd = new SqlCommand();
                cmd.Connection = connection;

                var sql = $@"
                            INSERT INTO [dbo].[tipo_grupo_muscular]
                                       ([nombre])
                                 VALUES
                                       (@name)
                            ";

                cmd.CommandText = sql;
                cmd.Parameters.Add(new SqlParameter("name", name));

                cmd.ExecuteNonQuery();

                connection.Close();
            }
            catch
            {
                connection.Close();
                throw;
            }
        }
        public void DeleteMachineType(MachineType machineType)
        {
            SqlConnection connection = ConnectionSingleton.getConnection();
            try
            {
                connection.Open();
                var cmd = new SqlCommand();
                cmd.Connection = connection;

                var sql = $@"DELETE FROM [dbo].[tipo_maquina] WHERE id = @id";

                cmd.CommandText = sql;
                cmd.Parameters.Add(new SqlParameter("id", machineType.Id));

                cmd.ExecuteNonQuery();

                connection.Close();
            }
            catch
            {
                connection.Close();
                throw;
            }
        }
        public void DeleteMuscularGroup(MuscularGroup muscularGroup)
        {
            SqlConnection connection = ConnectionSingleton.getConnection();
            try
            {
                connection.Open();
                var cmd = new SqlCommand();
                cmd.Connection = connection;

                var sql = $@"DELETE FROM [dbo].[tipo_grupo_muscular] WHERE id = @id";

                cmd.CommandText = sql;
                cmd.Parameters.Add(new SqlParameter("id", muscularGroup.Id));

                cmd.ExecuteNonQuery();

                connection.Close();
            }
            catch
            {
                connection.Close();
                throw;
            }
        }
        public void DeleteExercise(Exercise exercise)
        {
            SqlConnection connection = ConnectionSingleton.getConnection();
            try
            {
                connection.Open();
                var cmd = new SqlCommand();
                cmd.Connection = connection;

                var sql = $@"DELETE FROM [dbo].[grupo_muscular_maquina] WHERE id = @id";

                cmd.CommandText = sql;
                cmd.Parameters.Add(new SqlParameter("id", exercise.Id));

                cmd.ExecuteNonQuery();

                connection.Close();
            }
            catch
            {
                connection.Close();
                throw;
            }
        }

        public void AssingMuscularGroup(User user, MuscularGroup muscularGroup, int repetitions = 1, double weight = 0.0)
        {
            SqlConnection connection = ConnectionSingleton.getConnection();
            try
            {
                connection.Open();
                var cmd = new SqlCommand
                {
                    Connection = connection
                };

                var sql = $@"INSERT INTO [dbo].[ejercicios_usuario]
                            ([id_usuario]
                            ,[id_grupo_muscular]
                            ,[repeticiones]
                            ,[peso])
                        VALUES
                            (@userId
                            ,@muscularGroupId
                            ,@repetitions
                            ,@weight)";

                cmd.CommandText = sql;
                cmd.Parameters.Add(new SqlParameter("userId", user.Id));
                cmd.Parameters.Add(new SqlParameter("muscularGroupId", muscularGroup.Id));
                cmd.Parameters.Add(new SqlParameter("repetitions", repetitions));
                cmd.Parameters.Add(new SqlParameter("weight", weight));

                cmd.ExecuteNonQuery();

                connection.Close();
            }
            catch (Exception ex)
            {
                connection.Close();
                throw ex;
            }
        }
        public DataSet GetAssignedMuscularGroupBy(int userId)
        {
            SqlConnection connection = ConnectionSingleton.getConnection();
            try
            {
                connection.Open();
                var cmd = new SqlCommand();
                cmd.Connection = connection;

                var sql = $@"select id_usuario,id_grupo_muscular,nombre as grupoMuscular, repeticiones,peso from ejercicios_usuario ej left join tipo_grupo_muscular tgm on ej.id_grupo_muscular = tgm.id where id_usuario = @userId";

                cmd.CommandText = sql;
                cmd.Parameters.Add(new SqlParameter("userId", userId));

                SqlDataAdapter adapter = new SqlDataAdapter();
                adapter.SelectCommand = cmd;

                DataSet dataSet = new DataSet();

                adapter.Fill(dataSet, "mitabla");

                connection.Close();

                return dataSet;
            }
            catch
            {
                connection.Close();
                throw;
            }
        }        
        public void UnassingMuscularGroup(int userId, int muscularGroupId)
        {
            SqlConnection connection = ConnectionSingleton.getConnection();
            try
            {
                connection.Open();
                var cmd = new SqlCommand
                {
                    Connection = connection
                };

                var sql = $@"DELETE FROM [dbo].[ejercicios_usuario]   WHERE id_usuario = @userId and id_grupo_muscular = @muscularGroupId";

                cmd.CommandText = sql;
                cmd.Parameters.Add(new SqlParameter("userId", userId));
                cmd.Parameters.Add(new SqlParameter("muscularGroupId", muscularGroupId));
                cmd.ExecuteNonQuery();

                connection.Close();
            }
            catch (Exception ex)
            {
                connection.Close();
                throw ex;
            }
        }

    }
}

