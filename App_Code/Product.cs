using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MyFirstWebApplication.App_Code
{
    public class Product
    {
        public string catid { get; set; }
        public string Pid { get; set; }
        public int Price { get; set; }
        public int Amount { get; set; }

        public string Pname { get; set; }
        public string PicName { get; set; }
    }
}