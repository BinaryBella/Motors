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
            // Simulated data - in a real application, this would be fetched from a database
            DataTable dt = new DataTable();
            dt.Columns.Add("Id", typeof(int));
            dt.Columns.Add("Code", typeof(string));
            dt.Columns.Add("Name", typeof(string));
            dt.Columns.Add("ActiveState", typeof(bool));

            // Sample data
            dt.Rows.Add(1, "BRD001", "Toyota", true);
            dt.Rows.Add(2, "BRD002", "Honda", true);
            dt.Rows.Add(3, "BRD003", "Ford", true);
            dt.Rows.Add(4, "BRD004", "Chevrolet", false);
            dt.Rows.Add(5, "BRD005", "BMW", true);

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

        protected void rptPagination_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Page")
            {
                CurrentPage = Convert.ToInt32(e.CommandArgument);
                LoadBanks();
            }
        }

        protected void gvbrands_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            // Note: This is now handled by client-side JavaScript
            // But we keep the method for any server-side processing needed
            try
            {
                if (e.CommandName == "EditRecord" || e.CommandName == "DeleteRecord")
                {
                    // Any additional server-side processing can go here
                }
            }
            catch (Exception)
            {
                // Log the error
                ShowErrorMessage("An error occurred processing your request.");
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