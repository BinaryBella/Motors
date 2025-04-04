using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Silva_Motors.Pages.VendorTransaction
{
    public partial class VendorChequeRegistry : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadDummyData();
        }
        private void LoadDummyData()
        {
            var transactions = new List<Transaction>
            {
                new Transaction { ChequeNo = "CHK123", BankName = "ABC Bank", Branch = "Downtown", Date = DateTime.Now, Status="H",Vendor="Test",Amount = 1200.50m },
                new Transaction { ChequeNo = "CHK456", BankName = "XYZ Bank", Branch = "Uptown", Date = DateTime.Now.AddDays(-5),Status="Z",Vendor="Test1", Amount = 850.75m },
                new Transaction { ChequeNo = "CHK789", BankName = "PQR Bank", Branch = "Suburb", Date = DateTime.Now.AddDays(-10), Status="H",Vendor="Test2",Amount = 1500.00m }
            };

            gvTransactions.DataSource = transactions;
            gvTransactions.DataBind();
        }

        protected void gvTransactions_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Example: Modify rows if needed (e.g., add styling or calculations)
            }
        }
    }

    public class Transaction
    {
       
        public string ChequeNo { get; set; }
        public string BankName { get; set; }
        public string Branch { get; set; }
        public DateTime Date { get; set; }
        public string Status { get; set; }
        public string Vendor { get; set; }

        public decimal Amount { get; set; }
    }
}
