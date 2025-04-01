using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Silva_Motors.Pages.MasterFiles
{
    public partial class Customer1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindDummyData();
            }
        }

        private void BindDummyData()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("Id", typeof(int));
            dt.Columns.Add("Code", typeof(string));
            dt.Columns.Add("Name", typeof(string));
            dt.Columns.Add("Address", typeof(string));
            dt.Columns.Add("Telephone", typeof(string));
            dt.Columns.Add("CreditLimit", typeof(decimal));
            dt.Columns.Add("Outstanding", typeof(decimal));
            dt.Columns.Add("ActiveState", typeof(bool));

            dt.Rows.Add(1, "C001", "John Doe", "123 Street, City", "9876543210", 5000.00, 1200.00, true);
            dt.Rows.Add(2, "C002", "Jane Smith", "456 Avenue, City", "9123456789", 7000.00, 3000.00, false);
            dt.Rows.Add(3, "C003", "Mike Johnson", "789 Road, City", "9345678901", 4000.00, 800.00, true);
            dt.Rows.Add(4, "C004", "Emily Davis", "101 Blvd, City", "9456789012", 6000.00, 2500.00, false);

            gvCustomers.DataSource = dt;
            gvCustomers.DataBind();
        }
    }
}