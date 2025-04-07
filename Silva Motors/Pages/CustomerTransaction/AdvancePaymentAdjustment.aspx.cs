using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Silva_Motors.Pages.CustomerTransaction
{
    public partial class AdvancePaymentAdjustment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDummyData();
            }
        }

        private void LoadDummyData()
        {
            var transactions = new List<Transaction>
            {
                new Transaction { No = 1, RefNo = "CHK123", Bank = "ABC Bank", Branch = "Downtown", Date = DateTime.Now, Amount = 1200.50m },
                new Transaction { No = 2, RefNo = "CHK456", Bank = "XYZ Bank", Branch = "Uptown", Date = DateTime.Now.AddDays(-5), Amount = 850.75m },
                new Transaction { No = 3, RefNo = "CHK789", Bank = "PQR Bank", Branch = "Suburb", Date = DateTime.Now.AddDays(-10), Amount = 1500.00m }
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

        //protected void btnAdd_Click(object sender, EventArgs e)
        //{
        //    try
        //    {
               
        //        // Your existing save logic here
        //        bool success = true; // Replace with your actual save operation result

        //        if (success)
        //        {
        //            // Set success message for SweetAlert2
        //            hfSuccessMessage.Value = brandId > 0
        //                ? "Brand updated successfully!"
        //                : "Brand added successfully!";

        //        }
        //        else
        //        {
        //            // Set error message for SweetAlert2
        //            hfErrorMessage.Value = "Operation failed. Please try again.";
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        // Set error message with exception details
        //        hfErrorMessage.Value = "An error occurred: " + ex.Message;
        //        // Consider logging the exception as well
        //    }
        //}
    }

    public class Transaction
    {
        public int No { get; set; }
        public string RefNo { get; set; }
        public string Bank { get; set; }
        public string Branch { get; set; }
        public DateTime Date { get; set; }
        public decimal Amount { get; set; }
    }

   

}
