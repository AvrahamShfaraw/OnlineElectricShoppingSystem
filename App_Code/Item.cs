using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MyFirstWebApplication.App_Code
{
    public class Item
    {
        public int S_No{ get; set; }
        public int ProId { get; set; }
        public int CatId { get; set; }
        public string ProName { get; set; }
        public int ProPrice { get; set; }
        public string ProImage { get; set; }
        public int ProAmount { get; set; }
        public int Total { get; set; }
    }
}