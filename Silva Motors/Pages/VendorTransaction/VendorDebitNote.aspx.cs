using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Silva_Motors.Pages.VendorTransaction
{
    public partial class VendorDebitNote : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindDummyTransactions();
            }
        }

        private void BindDummyTransactions()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("No", typeof(int));
            dt.Columns.Add("RefNo", typeof(string));
            dt.Columns.Add("Date", typeof(DateTime));
            dt.Columns.Add("Partiulars", typeof(string));
            dt.Columns.Add("trxNetAm", typeof(decimal));
            dt.Columns.Add("trxDueAm", typeof(decimal));
            dt.Columns.Add("Age", typeof(int));
            dt.Columns.Add("Amount", typeof(decimal));
            dt.Columns.Add("AtrxDueAm", typeof(decimal));

            dt.Rows.Add(1, "REF001", DateTime.Today.AddDays(-10), "Invoice 001", 1000.00m, 300.00m, 10, 200.00m, 300.00m);
            dt.Rows.Add(2, "REF002", DateTime.Today.AddDays(-5), "Invoice 002", 1500.00m, 500.00m, 5, 300.00m, 500.00m);
            dt.Rows.Add(3, "REF003", DateTime.Today.AddDays(-20), "Invoice 003", 2000.00m, 800.00m, 20, 600.00m, 800.00m);

            gvTransactions.DataSource = dt;
            gvTransactions.DataBind();
        }
    }
}