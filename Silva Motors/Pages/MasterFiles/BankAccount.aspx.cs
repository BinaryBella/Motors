using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Silva_Motors.Pages.MasterFiles
{
    public partial class BankAccount : System.Web.UI.Page
    {
        // Property to track current page for pagination
        protected int CurrentPage
        {
            get { return ViewState["CurrentPage"] != null ? Convert.ToInt32(ViewState["CurrentPage"]) : 1; }
            set { ViewState["CurrentPage"] = value; }
        }

        protected int PageSize = 10; // Number of records per page

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Initial data load
                LoadBankAccounts();
            }
        }

        private void LoadBankAccounts()
        {
            try
            {
                // Here you would normally fetch data from a database
                // This is a simulation using a DataTable
                DataTable dt = GetBankAccountData();

                // Apply pagination
                DataTable pagedData = ApplyPaging(dt, CurrentPage, PageSize);

                // Bind grid data
                gvBankAccounts.DataSource = pagedData;
                gvBankAccounts.DataBind();

                // Setup pagination
                SetupPagination(dt.Rows.Count);
            }
            catch (Exception)
            {
                // Log the error and display a user-friendly message
                ShowErrorMessage("An error occurred while loading data.");
            }
        }

        private DataTable GetBankAccountData()
        {
            DataTable dt = new DataTable();

            // Define table columns
            dt.Columns.Add("AccountId", typeof(int));
            dt.Columns.Add("BankAccountCode", typeof(string));
            dt.Columns.Add("BankId", typeof(string));
            dt.Columns.Add("AccountHolder", typeof(string));
            dt.Columns.Add("Balance", typeof(decimal));
            dt.Columns.Add("DateCreated", typeof(DateTime));
            dt.Columns.Add("ActiveState", typeof(bool));

            // Sample data entries
            dt.Rows.Add(1, "ACCT001", "1001", "John Doe", 5000.00, DateTime.Now.AddDays(-5), true);
            dt.Rows.Add(2, "ACCT002", "1002", "Jane Smith", 1500.00, DateTime.Now.AddDays(-10), true);
            dt.Rows.Add(3, "ACCT003", "1003", "Robert Brown", 2000.00, DateTime.Now.AddDays(-15), false);
            dt.Rows.Add(4, "ACCT004", "1004", "Alice Johnson", 3000.00, DateTime.Now.AddDays(-20), true);
            dt.Rows.Add(5, "ACCT005", "1005", "Charlie Davis", 4000.00, DateTime.Now.AddDays(-25), true);
            dt.Rows.Add(6, "ACCT006", "1006", "Emily Wilson", 10000.00, DateTime.Now.AddDays(-30), false);
            dt.Rows.Add(7, "ACCT007", "1007", "David Miller", 3500.00, DateTime.Now.AddDays(-35), true);
            dt.Rows.Add(8, "ACCT008", "1008", "Sophia Moore", 2500.00, DateTime.Now.AddDays(-40), true);

            return dt;
        }

        private DataTable ApplyPaging(DataTable sourceTable, int currentPage, int pageSize)
        {
            // Create a new table with the same structure
            DataTable result = sourceTable.Clone();

            // Calculate the start and end rows for the current page
            int startRow = (currentPage - 1) * pageSize;
            int endRow = startRow + pageSize;

            // Get the rows for the current page
            if (startRow < sourceTable.Rows.Count)
            {
                // Don't exceed the total number of rows
                endRow = Math.Min(endRow, sourceTable.Rows.Count);

                // Copy the rows
                for (int i = startRow; i < endRow; i++)
                {
                    result.ImportRow(sourceTable.Rows[i]);
                }
            }

            return result;
        }

        private void SetupPagination(int totalRecords)
        {
            int totalPages = (int)Math.Ceiling((double)totalRecords / PageSize);

            List<PaginationItem> paginationItems = new List<PaginationItem>();

            // Add pagination items
            for (int i = 1; i <= totalPages; i++)
            {
                paginationItems.Add(new PaginationItem { PageNumber = i });
            }
        }

        // Class to represent pagination items
        public class PaginationItem
        {
            public int PageNumber { get; set; }
        }

        protected void gvBankAccounts_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditAccount")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = gvBankAccounts.Rows[rowIndex];

                // Retrieve data from the selected row
                string accountId = gvBankAccounts.DataKeys[rowIndex].Value.ToString();
                string accountNumber = row.Cells[0].Text;
                string bankName = row.Cells[1].Text;
                string branch = row.Cells[2].Text;
                bool activeState = Convert.ToBoolean(((Label)row.Cells[3].FindControl("lblStatus")).Text == "Active");

                // Set values in the modal for editing
                //txtAccountId.Text = accountId;
                txtAccountNumber.Text = accountNumber;
                txtBankName.Text = bankName;
                txtBranch.Text = branch;

                // Show the modal
                ScriptManager.RegisterStartupScript(this, GetType(), "ShowEditModal", "$('#bankAccountModal').modal('show');", true);
            }
            else if (e.CommandName == "DeleteAccount")
            {
                int accountId = Convert.ToInt32(e.CommandArgument);

                // Call delete method (you would implement your delete logic here)
                //DeleteAccount(accountId);

                // Refresh the GridView after deletion
                LoadBankAccounts();
            }
        }

        protected void rptPagination_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Page")
            {
                CurrentPage = Convert.ToInt32(e.CommandArgument);
                LoadBankAccounts();
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                //int accountId = Convert.ToInt32(txtAccountId.Text); // Assuming txtAccountId is a hidden field or a text box
                string accountNumber = txtAccountNumber.Text.Trim();
                string bankName = txtBankName.Text.Trim();
                string branch = txtBranch.Text.Trim();

                //// Your save logic goes here (add or update the account)
                //if (accountId > 0)
                //{
                //    // Update existing account
                //    UpdateBankAccount(accountId, accountNumber, bankName, branch, isActive);
                //    hfSuccessMessage.Value = "Bank Account updated successfully.";
                //}
                //else
                //{
                //    // Add new account
                //    AddNewBankAccount(accountNumber, bankName, branch, isActive);
                //    hfSuccessMessage.Value = "Bank Account added successfully.";
                //}

                //// Clear the form fields after saving
                //ClearFormFields();

                // Reload bank accounts
                LoadBankAccounts();

                // Close the modal
                ScriptManager.RegisterStartupScript(this, GetType(), "CloseModal", "$('#bankAccountModal').modal('hide');", true);
            }
            catch (Exception )
            {
                hfErrorMessage.Value = "Failed to save account. Please try again.";
                // Log exception if needed
            }

            // Trigger client-side script to show messages
            ScriptManager.RegisterStartupScript(this, GetType(), "PageLoad", "pageLoad();", true);
        }

        protected void btnConfirmDelete_Click(object sender, EventArgs e)
        {
            try
            {
                int accountId = Convert.ToInt32(hfDeleteId.Value);

                // Your existing delete logic here
                bool success = true; // Replace with your actual delete operation result

                if (success)
                {
                    // Set success message for SweetAlert2
                    hfSuccessMessage.Value = "Bank account deleted successfully!";
                }
                else
                {
                    // Set error message for SweetAlert2
                    hfErrorMessage.Value = "Delete operation failed. Please try again.";
                }
            }
            catch (Exception ex)
            {
                // Set error message with exception details
                hfErrorMessage.Value = "An error occurred during deletion: " + ex.Message;
                // Consider logging the exception as well
            }
        }

        protected void btnCloseModal_Click(object sender, EventArgs e)
        {
            // Any server-side logic before closing the modal
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            // Any server-side logic before closing the modal
        }

        private void ShowSuccessMessage(string message)
        {
            ScriptManager.RegisterStartupScript(this, GetType(),
                "successAlert", $"alert('{message}');", true);
        }

        private void ShowErrorMessage(string message)
        {
            ScriptManager.RegisterStartupScript(this, GetType(),
                "errorAlert", $"alert('{message}');", true);
        }
    }
}
