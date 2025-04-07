using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Silva_Motors.Pages.View
{
    public partial class BinCard1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridView();
            }
        }

        private void BindGridView()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("Date", typeof(string));
            dt.Columns.Add("TrxID", typeof(string));
            dt.Columns.Add("Particulars", typeof(string));
            dt.Columns.Add("User", typeof(string));
            dt.Columns.Add("In", typeof(int));
            dt.Columns.Add("Out", typeof(int));
            dt.Columns.Add("Balance", typeof(int));
            dt.Columns.Add("SellPrice", typeof(decimal));

            // Add dummy data rows
            dt.Rows.Add("2025-04-01", "TX1001", "GRN Received", "admin", 100, 0, 100, 1200.00m);
            dt.Rows.Add("2025-04-02", "TX1002", "Issued to Workshop", "storeuser", 0, 20, 80, 1200.00m);
            dt.Rows.Add("2025-04-03", "TX1003", "Stock Adjustment", "supervisor", 10, 0, 90, 1200.00m);
            dt.Rows.Add("2025-04-04", "TX1004", "Issued to Dept A", "admin", 0, 25, 65, 1200.00m);

            gvTransactions.DataSource = dt;
            gvTransactions.DataBind();
        }
    }
}
