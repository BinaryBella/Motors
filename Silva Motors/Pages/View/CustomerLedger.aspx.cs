using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Silva_Motors.Pages.View
{
    public partial class CustomerLedger1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Create a DataTable to hold dummy data
                DataTable dt = new DataTable();
                dt.Columns.Add("Date");
                dt.Columns.Add("TransactionID");
                dt.Columns.Add("Description");
                dt.Columns.Add("Amount");
                dt.Columns.Add("Balance");

                // Add dummy rows
                dt.Rows.Add("2025-04-01", "TXN001", "Invoice Payment", "15000.00", "5000.00");
                dt.Rows.Add("2025-04-03", "TXN002", "Advance Payment", "-2000.00", "3000.00");
                dt.Rows.Add("2025-04-05", "TXN003", "Service Charge", "500.00", "3500.00");
                dt.Rows.Add("2025-04-06", "TXN004", "Full Payment", "-3500.00", "0.00");

                // Bind the data to the GridView
                CustomerLedgerGridView.DataSource = dt;
                CustomerLedgerGridView.DataBind();
            }
        }
    }
}