using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MyFirstWebApplication.App_Code
{
    public class CartItem
    {
        public List<Item> ListItem;
        public CartItem()
        {
            ListItem = new List<Item>();
        }
        public void Add2List(Item temp)
        {
            int i = 0;
            for (i = 0; i < ListItem.Count; i++)
            {
                if (ListItem[i].ProId == temp.ProId)
                {
                    ListItem[i].ProAmount++;
                }
            }
            if (i == ListItem.Count)

            {
                ListItem.Add(temp);
            }
        }
        
        
    }
}