using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Silva_Motors.Pages.VendorTransaction
{
    public partial class GoodReceivedMemo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindDummyData();
                BindDummyGoodReceivedItems();
            }
        }

        private void BindDummyData()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("Code");
            dt.Columns.Add("Part");
            dt.Columns.Add("Brand");
            dt.Columns.Add("Category");
            dt.Columns.Add("Model");
            dt.Columns.Add("Description");
            dt.Columns.Add("Qty");
            dt.Columns.Add("Price");
            dt.Columns.Add("OldName");

            // Add dummy rows
            dt.Rows.Add("P001", "Brake Pad", "Toyota", "Brakes", "Corolla 2018", "Front Brake Pad Set", "10", "2500.00", "BrakeSet_Old");
            dt.Rows.Add("P002", "Oil Filter", "Nissan", "Filters", "Navara 2020", "Engine Oil Filter", "20", "900.00", "OilFilter_2022");
            dt.Rows.Add("P003", "Air Filter", "Honda", "Filters", "Civic 2016", "Cabin Air Filter", "15", "1200.00", "FilterX");

            gvModalItems.DataSource = dt;
            gvModalItems.DataBind();
        }
        private void BindDummyGoodReceivedItems()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("Code");
            dt.Columns.Add("ItemDesc");
            dt.Columns.Add("Qty");
            dt.Columns.Add("UnitPrice");
            dt.Columns.Add("Amount");

            // Add dummy rows
            dt.Rows.Add("P001", "Brake Pad", "5", "2500.00", "12500.00");
            dt.Rows.Add("P002", "Oil Filter", "10", "850.00", "8500.00");
            dt.Rows.Add("P003", "Air Filter", "3", "1200.00", "3600.00");

            gvGoodReceivedItems.DataSource = dt;
            gvGoodReceivedItems.DataBind();
        }
        protected void gvGoodReceivedItems_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DataRowView drv = (DataRowView)e.Row.DataItem;

                ((TextBox)e.Row.FindControl("txtCode")).Text = drv["Code"].ToString();
                ((TextBox)e.Row.FindControl("txtItemDesc")).Text = drv["ItemDesc"].ToString();
                ((TextBox)e.Row.FindControl("txtQty")).Text = drv["Qty"].ToString();
                ((TextBox)e.Row.FindControl("txtUnitPrice")).Text = drv["UnitPrice"].ToString();
                ((TextBox)e.Row.FindControl("txtAmount")).Text = drv["Amount"].ToString();
            }
        }
    }
}