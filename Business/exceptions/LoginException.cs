using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace Business.exceptions
{
    public class LoginException : Exception
    {
        public LoginException() : base("Login Failed , Please try again")
        {
        }

        public LoginException(string message) : base(message)
        {
        }
    }
}
