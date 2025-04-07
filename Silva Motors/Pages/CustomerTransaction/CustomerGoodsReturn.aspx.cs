using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Silva_Motors.Pages.CustomerTransaction
{
    public partial class CustomerGoodsReturn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Sample data to bind to GridView
                DataTable dt = new DataTable();
                dt.Columns.Add("Code");
                dt.Columns.Add("Description");
                dt.Columns.Add("Qty");
                dt.Columns.Add("UnitPrice");
                dt.Columns.Add("Amount");

                // Add sample rows
                dt.Rows.Add("A001", "Item 1", 2, 50.00, 95.00);
                dt.Rows.Add("A002", "Item 2", 1, 30.00, 27.00);

                gvGoodreturnItems.DataSource = dt;
                gvGoodreturnItems.DataBind();
            }
        }
    }
}