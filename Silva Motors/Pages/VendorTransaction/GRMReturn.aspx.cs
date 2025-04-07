using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Silva_Motors.Pages.VendorTransaction
{
    public partial class GRMReturn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindMainGridView();       // gvItems
                BindModalGridView();      // gvModalTable
            }
        }

        private void BindMainGridView()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("Code");
            dt.Columns.Add("ItemDesc");
            dt.Columns.Add("Qty");
            dt.Columns.Add("UnitPrice");
            dt.Columns.Add("Amount");

            dt.Rows.Add("A001", "Item 1", 2, 50.00, 100.00);
            dt.Rows.Add("A002", "Item 2", 1, 30.00, 30.00);
            dt.Rows.Add("A003", "Item 3", 5, 20.00, 100.00);
            dt.Rows.Add("A004", "Item 4", 3, 40.00, 120.00);

            gvItems.DataSource = dt;
            gvItems.DataBind();
        }

        private void BindModalGridView()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("Code");
            dt.Columns.Add("Description");
            dt.Columns.Add("Qty");
            dt.Columns.Add("Price");

            dt.Rows.Add("M001", "Modal Item 1", 1, 45.00);
            dt.Rows.Add("M002", "Modal Item 2", 2, 60.00);
            dt.Rows.Add("M003", "Modal Item 3", 3, 25.00);

            gvModalTable.DataSource = dt;
            gvModalTable.DataBind();
        }
    }
}
