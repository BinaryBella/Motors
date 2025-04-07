using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Silva_Motors.Pages.CustomerTransaction
{
    public partial class CustomerPaymentReciept : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Fetch data from the database or other data source
                var transactions = GetTransactions();

                // Bind the data to the GridView
                gvTransactions.DataSource = transactions;
                gvTransactions.DataBind();
            }

        }

        private List<Transaction> GetTransactions()
        {
            // Example data for the GridView
            return new List<Transaction>
    {
        new Transaction { No = 1, RefNo = "001", Date = DateTime.Now, Particulars = "Item 1", AtrxNetAm = 100, AtrxDueAm = 50, Age = 5, Amount = 150 },
        new Transaction { No = 2, RefNo = "002", Date = DateTime.Now, Particulars = "Item 2", AtrxNetAm = 200, AtrxDueAm = 150, Age = 10, Amount = 350 }
        // Add more transactions if needed
    };
        }

        public class Transaction
        {
            public int No { get; set; }
            public string RefNo { get; set; }
            public DateTime Date { get; set; }
            public string Particulars { get; set; }
            public decimal AtrxNetAm { get; set; }
            public decimal AtrxDueAm { get; set; }
            public int Age { get; set; }
            public decimal Amount { get; set; }
        }
    }
}