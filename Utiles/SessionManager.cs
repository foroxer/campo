using Models;
using System;

namespace Utiles
{
    public class SessionManager
    {
        private static SessionManager session;

        public static SessionManager getInstance
        {
            get
            {
                if (session == null) throw new Exception("User not logged-in");
                return session;
            }
        }

        public User user { get; set; }
        //Log data
        public DateTime startTime { get; set; }

        //Session check session==created?return session:create session;
        public static void Login(User us)
        {
            if (session == null)
            {
                session = new SessionManager();
                session.user = us;
                session.startTime = DateTime.Now;
            }
            else
            {
                throw new Exception("User already logged-in");
            }
        }

        public static void LogOut()
        {
            _ = session == null ? session.user = null : throw new Exception("User not logged-in");

        }

        private SessionManager()
        {

        }

        public SessionManager getSession()
        {
            return new SessionManager();
        }

        public User getUser()
        {
            return new User();
        }

    }
}