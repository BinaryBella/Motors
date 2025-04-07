using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Silva_Motors.Pages.MasterFiles
{
    public partial class Bank : System.Web.UI.Page
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
                LoadBanks();

            }
        }

        private void LoadBanks()
        {
            try
            {
                // Here you would normally fetch data from a database
                // This is a simulation using a DataTable
                DataTable dt = GetBankData();

                // Apply pagination
                DataTable pagedData = ApplyPaging(dt, CurrentPage, PageSize);

                // Bind grid data
                gvbanks.DataSource = pagedData;
                gvbanks.DataBind();

                // Setup pagination
                SetupPagination(dt.Rows.Count);
            }
            catch (Exception)
            {
                // Log the error and display a user-friendly message
                // Logger.LogError(ex);
                ShowErrorMessage("An error occurred while loading data.");
            }
        }

        private DataTable GetBankData()
        {
            DataTable dt = new DataTable();

            // Define table columns
            dt.Columns.Add("Id", typeof(int));
            dt.Columns.Add("Code", typeof(string));
            dt.Columns.Add("BankId", typeof(string));
            dt.Columns.Add("BankName", typeof(string));
            dt.Columns.Add("User", typeof(string));
            dt.Columns.Add("Date", typeof(DateTime));
            dt.Columns.Add("ActiveState", typeof(bool));

            // Sample data entries
            dt.Rows.Add(1, "BNK001", "1001", "Bank of America", "Admin", DateTime.Now.AddDays(-5), true);
            dt.Rows.Add(2, "BNK002", "1002", "JPMorgan Chase", "User1", DateTime.Now.AddDays(-10), true);
            dt.Rows.Add(3, "BNK003", "1003", "Wells Fargo", "Admin", DateTime.Now.AddDays(-15), false);
            dt.Rows.Add(4, "BNK004", "1004", "Citibank", "User2", DateTime.Now.AddDays(-20), true);
            dt.Rows.Add(5, "BNK005", "1005", "HSBC", "User3", DateTime.Now.AddDays(-25), true);
            dt.Rows.Add(6, "BNK006", "1006", "Barclays", "Admin", DateTime.Now.AddDays(-30), false);
            dt.Rows.Add(7, "BNK007", "1007", "Standard Chartered", "User4", DateTime.Now.AddDays(-35), true);
            dt.Rows.Add(8, "BNK008", "1008", "Goldman Sachs", "User5", DateTime.Now.AddDays(-40), true);
            dt.Rows.Add(9, "BNK009", "1009", "Morgan Stanley", "Admin", DateTime.Now.AddDays(-45), false);
            dt.Rows.Add(10, "BNK010", "1010", "Deutsche Bank", "User6", DateTime.Now.AddDays(-50), true);
            dt.Rows.Add(11, "BNK011", "1011", "UBS", "User7", DateTime.Now.AddDays(-55), true);
            dt.Rows.Add(12, "BNK012", "1012", "Royal Bank of Canada", "User8", DateTime.Now.AddDays(-60), false);
            dt.Rows.Add(13, "BNK013", "1013", "TD Bank", "Admin", DateTime.Now.AddDays(-65), true);
            dt.Rows.Add(14, "BNK014", "1014", "Santander", "User9", DateTime.Now.AddDays(-70), true);
            dt.Rows.Add(15, "BNK015", "1015", "BNP Paribas", "User10", DateTime.Now.AddDays(-75), false);

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

        protected void gvbanks_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditBank")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = gvbanks.Rows[rowIndex];

                // Retrieve data from the selected row
                string bankId = gvbanks.DataKeys[rowIndex].Value.ToString();
                string code = row.Cells[0].Text;
                string bankName = row.Cells[2].Text;

                // Set values in the modal for editing
                txtBankId.Text = bankId;
                txtCode.Text = code;
                txtBankName.Text = bankName;

                // Show the modal
                ScriptManager.RegisterStartupScript(this, GetType(), "ShowEditModal", "$('#bankModal').modal('show');", true);
            }
            else if (e.CommandName == "DeleteBank")
            {
                int bankId = Convert.ToInt32(e.CommandArgument);

                // Refresh the GridView
                LoadBanks();
            }
        }

        protected void rptPagination_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Page")
            {
                CurrentPage = Convert.ToInt32(e.CommandArgument);
                LoadBanks();
            }
        }

        protected void btnFilters_Click(object sender, EventArgs e)
        {
            // Implement filter functionality
            // This would typically show a filter panel or modal
        }

        // Modified Save method to use SweetAlert2
        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {

            int bankId = Convert.ToInt32(hfBankId.Value);
            string code = txtCode.Text.Trim();
            string bankIdText = txtBankId.Text.Trim();
            string bankName = txtBankName.Text.Trim();

                hfSuccessMessage.Value = bankId > 0 ? "Bank updated successfully." : "Bank added successfully.";

                // Clear form fields
                hfBankId.Value = "0";
                txtCode.Text = string.Empty;
                txtBankId.Text = string.Empty;
                txtBankName.Text = string.Empty;

                // Reload data
                LoadBanks();

                // Close modal via script
                ScriptManager.RegisterStartupScript(this, GetType(), "CloseModal", "$('#bankModal').modal('hide');", true);
            }
            catch
            {
                if (string.IsNullOrEmpty(hfErrorMessage.Value))
                {
                    hfErrorMessage.Value = "Failed to save bank. Please try again.";
                }
            }

            // Trigger client-side script to show messages
            ScriptManager.RegisterStartupScript(this, GetType(), "PageLoad", "pageLoad();", true);
        }

        // Modified Delete method to use SweetAlert2
        protected void btnConfirmDelete_Click(object sender, EventArgs e)
        {
            try
            {
                int brandId = Convert.ToInt32(hfDeleteId.Value);

                // Your existing delete logic here
                bool success = true; // Replace with your actual delete operation result

                if (success)
                {
                    // Set success message for SweetAlert2
                    hfSuccessMessage.Value = "Bank deleted successfully!";

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