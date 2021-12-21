using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MyFirstWebApplication.App_Code
{
    public class Category
    {
        public List<Product> ProCategory;
        public Category()
        {
            ProCategory = new List<Product>();

        }
        public void Add2List(Product temp)
        {
            int i = 0;
            for (i = 0; i < ProCategory.Count; i++)
            {
                if (i == ProCategory.Count)
                        
                    ProCategory.Add(temp);
            }
        }
        public string CategoryId { get; set; }
        public string CategoryNmae { get; set; }
    }
}