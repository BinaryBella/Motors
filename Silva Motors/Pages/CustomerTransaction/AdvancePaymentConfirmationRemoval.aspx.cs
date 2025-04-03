using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Silva_Motors.Pages.CustomerTransaction
{
    public partial class AdvancePaymentConfirmationRemoval : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }
        }

        private void BindGrid()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("Code");
            dt.Columns.Add("ItemDesc");
            dt.Columns.Add("Qty");
            dt.Columns.Add("UnitPrice");
            dt.Columns.Add("Amount");

            // Adding dummy data
            dt.Rows.Add("A001", "Brake Pads", "2", "150.00", "300.00");
            dt.Rows.Add("A002", "Engine Oil", "1", "250.00", "250.00");
            dt.Rows.Add("A003", "Air Filter", "3", "100.00", "300.00");
            dt.Rows.Add("A004", "Battery", "1", "1200.00", "1200.00");
            dt.Rows.Add("A005", "Wiper Blades", "2", "50.00", "100.00");

            gvItem.DataSource = dt;
            gvItem.DataBind();
        }
    }
}
