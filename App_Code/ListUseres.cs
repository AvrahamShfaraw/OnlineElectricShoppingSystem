using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MyFirstWebApplication.App_Code
{
    public class ListUseres
    {
        public List<User> Listuser;
        public ListUseres()
        {
            Listuser = new List<User>();
        }
        public void Add2List(User temp)
        {
            int i = 0;
            for (i = 0; i < Listuser.Count; i++)
            {
                if(i==Listuser.Count)
                    Listuser.Add(temp);
                
            }
        }

    }
}