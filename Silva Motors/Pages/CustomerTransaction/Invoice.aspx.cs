using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Silva_Motors.Pages.CustomerTransaction
{
    public partial class Invoice : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var items = GetItems(); // Fetch your data
                gvItems.DataSource = items;
                gvItems.DataBind();
            }

        }

        private List<Item> GetItems()
        {
            // Sample data for binding
            return new List<Item>
    {
        new Item { Code = "A001", ItemDesc = "Item 1", Qty = 2, UnitPrice = 50.00m, UnitDisc = 5.00m, Amount = 95.00m },
        new Item { Code = "A002", ItemDesc = "Item 2", Qty = 1, UnitPrice = 30.00m, UnitDisc = 3.00m, Amount = 27.00m }
    };
        }

        public class Item
        {
            public string Code { get; set; }
            public string ItemDesc { get; set; }
            public int Qty { get; set; }
            public decimal UnitPrice { get; set; }
            public decimal UnitDisc { get; set; }
            public decimal Amount { get; set; }
        }
    }
}