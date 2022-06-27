using Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using Utiles;

namespace DataAccess
{
    public class PermissionsRepository
    {
        public List<PermissionsEnum> GetAllPermission()
        {
            return Enum.GetValues(typeof(PermissionsEnum)).Cast<PermissionsEnum>().ToList();
        }
        public Component GuardarComponente(Component component, bool isFamily)
        {
            try
            {
                SqlConnection cnn = ConnectionSingleton.getConnection();
                cnn.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = cnn;

                var sql = $@"insert into permiso (nombre,permiso) values (@nombre,@permiso);  SELECT ID AS LastID FROM permiso WHERE ID = @@Identity;       ";

                cmd.CommandText = sql;
                cmd.Parameters.Add(new SqlParameter("nombre", component.Nombre));


                if (isFamily)
                    cmd.Parameters.Add(new SqlParameter("permiso", DBNull.Value));

                else
                    cmd.Parameters.Add(new SqlParameter("permiso", component.Permiso.ToString()));

                var id = cmd.ExecuteScalar();
                component.Id = (int)id;
                cnn.Close();
                return component;
            }
            catch (Exception e)
            {
                throw e;
            }
        }
        public void SaveFamily(Family family)
        {
            if (!IsValidFamily(family))
            {
                throw new Exception("Familia Recursiva");
            }
            try
            {
                var cnn = ConnectionSingleton.getConnection();
                cnn.Open();
                var cmd = new SqlCommand();
                cmd.Connection = cnn;


                var sql = $@"delete from permiso_permiso where id_permiso_padre=@id;";

                cmd.CommandText = sql;
                cmd.Parameters.Add(new SqlParameter("id", family.Id));
                cmd.ExecuteNonQuery();

                foreach (var item in family.Childs)
                {
                    cmd = new SqlCommand();
                    cmd.Connection = cnn;


                    sql = $@"insert into permiso_permiso (id_permiso_padre,id_permiso_hijo) values (@id_permiso_padre,@id_permiso_hijo) ";

                    cmd.CommandText = sql;
                    cmd.Parameters.Add(new SqlParameter("id_permiso_padre", family.Id));
                    cmd.Parameters.Add(new SqlParameter("id_permiso_hijo", item.Id));

                    cmd.ExecuteNonQuery();
                }
                cnn.Close();
            }
            catch (Exception)
            {
                ConnectionSingleton.getConnection().Close();
                throw;
            }
        }
        private Boolean IsValidFamily(Family family)
        {
            foreach (Component child in family.Childs)
            {
                if (child.GetType() == typeof(Family))
                {
                    if (family.Nombre.Equals(child.Nombre))
                    {
                        return false;
                    }
                    else
                    {
                        return ValidateFamilyRecursion((Family)child, family);
                    }
                }
            }
            return true;
        }
        private Boolean ValidateFamilyRecursion(Family family, Family original)
        {
            foreach (Component child in family.Childs)
            {
                if (child.GetType() == typeof(Family))
                {
                    if (original.Nombre.Equals(child.Nombre))
                    {
                        return false;
                    }
                    else
                    {
                        return ValidateFamilyRecursion((Family)child, original);
                    }
                }
            }
            return true;
        }
        public List<Patent> GetAllPatents()
        {

            var cnn = ConnectionSingleton.getConnection();
            cnn.Open();
            var cmd = new SqlCommand();
            cmd.Connection = cnn;

            var sql = $@"select * from permiso listComponent where listComponent.permiso is not null;";

            cmd.CommandText = sql;

            var reader = cmd.ExecuteReader();

            List<Patent> lista = new List<Patent>();

            while (reader.Read())
            {
                Patent c = new Patent();

                c.Id = reader.GetInt32(reader.GetOrdinal("id"));
                c.Nombre = reader.GetString(reader.GetOrdinal("nombre"));
                c.Permiso = (PermissionsEnum)Enum.Parse(typeof(PermissionsEnum), reader.GetString(reader.GetOrdinal("permiso")));
                c.Description = reader.GetValue(reader.GetOrdinal("descripcion")).ToString();
                lista.Add(c);

            }
            reader.Close();
            cnn.Close();
            return lista;
        }
        public List<Family> GetAllFamilies()
        {

            var cnn = ConnectionSingleton.getConnection();
            cnn.Open();
            var cmd = new SqlCommand();
            cmd.Connection = cnn;

            var sql = $@"select * from permiso listComponent where listComponent.permiso is  null;";

            cmd.CommandText = sql;

            var reader = cmd.ExecuteReader();

            List<Family> lista = new List<Family>();

            while (reader.Read())
            {

                var id = reader.GetInt32(reader.GetOrdinal("id"));
                var nombre = reader.GetString(reader.GetOrdinal("nombre"));

                Family c = new Family();

                c.Id = id;
                c.Nombre = nombre;
                lista.Add(c);

            }
            reader.Close();
            cnn.Close();

            return lista;
        }
        public List<Component> GetAll(string familia)
        {

            var where = "is NULL";

            if (!String.IsNullOrEmpty(familia))
            {
                where = familia;
            }

            SqlConnection cnn = ConnectionSingleton.getConnection();
            cnn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cnn;

            var sql = $@"with recursivo as (
                        select sp2.id_permiso_padre, sp2.id_permiso_hijo  from permiso_permiso SP2
                        where sp2.id_permiso_padre {where} --acá se va variando la familia que busco
                        UNION ALL 
                        select sp.id_permiso_padre, sp.id_permiso_hijo from permiso_permiso sp 
                        inner join recursivo r on r.id_permiso_hijo= sp.id_permiso_padre
                        )
                        select r.id_permiso_padre,r.id_permiso_hijo,listComponent.id,listComponent.nombre, listComponent.permiso
                        from recursivo r 
                        inner join permiso listComponent on r.id_permiso_hijo = listComponent.id 
                        ";

            cmd.CommandText = sql;

            var reader = cmd.ExecuteReader();

            List<Component> lista = new List<Component>();

            while (reader.Read())
            {
                int id_padre = 0;
                if (reader["id_permiso_padre"] != DBNull.Value)
                {
                    id_padre = reader.GetInt32(reader.GetOrdinal("id_permiso_padre"));
                }

                var id = reader.GetInt32(reader.GetOrdinal("id"));
                var nombre = reader.GetString(reader.GetOrdinal("nombre"));

                var permiso = string.Empty;
                if (reader["permiso"] != DBNull.Value)
                    permiso = reader.GetString(reader.GetOrdinal("permiso"));


                Component c;

                if (string.IsNullOrEmpty(permiso))//usamos este campo para identificar. Solo las patentes van a tener un permiso del sistema relacionado
                    c = new Family();

                else
                    c = new Patent();

                c.Id = id;
                c.Nombre = nombre;
                if (!string.IsNullOrEmpty(permiso))
                    c.Permiso = (PermissionsEnum)Enum.Parse(typeof(PermissionsEnum), permiso);

                var padre = GetComponent(id_padre, lista);

                if (padre == null)
                {
                    lista.Add(c);
                }
                else
                {
                    padre.AddChild(c);
                }
            }
            reader.Close();
            cnn.Close();

            return lista;
        }
        private Component GetComponent(int id, List<Component> lista)
        {
            Component component = lista != null ? lista.Where(listComponent => listComponent.Id.Equals(id)).FirstOrDefault() : null;

            if (component == null && lista != null)
            {
                foreach (var c in lista)
                {
                    var l = GetComponent(id, c.Childs);
                    if (l != null && l.Id == id)
                    {
                        return l;
                    }
                    else
                    {
                        if (l != null)
                        {
                            return GetComponent(id, l.Childs);
                        }
                    }
                }
            }
            return component;
        }
        public void FillUserComponents(User user)
        {

            var cnn = ConnectionSingleton.getConnection();
            cnn.Open();

            var cmd2 = new SqlCommand();
            cmd2.Connection = cnn;
            cmd2.CommandText = $@"select listComponent.* from usuarios_permisos up inner join permiso listComponent on up.id_permiso=listComponent.id where id_usuario=@id;";
            cmd2.Parameters.AddWithValue("id", user.Id);

            var reader = cmd2.ExecuteReader();
            user.Permissions.Clear();
            while (reader.Read())
            {
                int id = reader.GetInt32(reader.GetOrdinal("id"));
                String nombre = reader.GetString(reader.GetOrdinal("nombre"));
                String permiso = String.Empty;

                if (reader["permiso"] != DBNull.Value)
                    permiso = reader.GetString(reader.GetOrdinal("permiso"));

                Component componente;
                if (!String.IsNullOrEmpty(permiso))
                {
                    componente = new Patent();
                    componente.Id = id;
                    componente.Nombre = nombre;
                    componente.Permiso = (PermissionsEnum)Enum.Parse(typeof(PermissionsEnum), permiso);
                    user.Permissions.Add(componente);
                }
                else
                {
                    componente = new Family();
                    componente.Id = id;
                    componente.Nombre = nombre;
                    user.Permissions.Add(componente);
                }
            }
            reader.Close();
            cnn.Close();

            foreach (Component componente in user.Permissions)
            {
                if (componente is Family)
                {
                    List<Component> familias = GetAll("=" + componente.Id);

                    foreach (var familia in familias)
                    {
                        componente.AddChild(familia);
                    }
                }
            }
        }
        public void FillFamilyComponents(Family familia)
        {
            familia.ClearChilds();
            foreach (var item in GetAll("=" + familia.Id))
            {
                familia.AddChild(item);
            }
        }
        public Patent GetPatent(PermissionsEnum permissionsEnum)
        {
            SqlConnection connection = ConnectionSingleton.getConnection();
            SqlCommand cmd = new SqlCommand();
            Patent permission = null;
            try
            {
                connection.Open();
                cmd.Connection = connection;
                cmd.CommandText = $@"select * from permiso p where p.permiso = @permiso;";
                cmd.Parameters.Add(new SqlParameter("permiso", permissionsEnum.ToString()));

                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    permission = new Patent
                    {
                        Id = int.Parse(reader.GetValue(reader.GetOrdinal("id")).ToString()),
                        Description = reader.GetValue(reader.GetOrdinal("descripcion")).ToString(),
                        Nombre = reader.GetValue(reader.GetOrdinal("nombre")).ToString(),
                        Permiso = permissionsEnum
                    };
                }

                reader.Close();
                connection.Close();
                return permission;
            }
            catch (Exception)
            {
                connection.Close();
                throw;
            }
        }
    }
}
