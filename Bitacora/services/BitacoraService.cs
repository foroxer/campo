
using BitacoraLib.dataAccess;
using BitacoraLib.entities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;

namespace BitacoraLib.services
{
    public class BitacoraService
    {
        private static IDbConnection connection;
        private static String tableName;
        private static RegistryDAO registryDAO;

        private BitacoraService()
        {

        }

        public static void config(IDbConnection conn, String tablename)
        {
            connection = conn;
            tableName = tablename;
            registryDAO = new RegistryDAO(conn, tablename);
        }

        public static void register(PriorityEnum priority , String toRegister, String user = "System")
        {
            IRegistry registry = new Registry(toRegister, priority, user);

            registryDAO.save(registry);
        }


        public static void register(PriorityEnum priority , Object objectToRegister, String user)
        {
            //hacer un string del objeto toRetoRegister

            IRegistry registry = new Registry((string)objectToRegister , priority, user);

            registryDAO.save(registry);
        }

        public static  List<IRegistry> getRegisters()
        {
            //recuperar data
            return registryDAO.getRegistries();
        }

    }
}
