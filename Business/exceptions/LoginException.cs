using System;

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
