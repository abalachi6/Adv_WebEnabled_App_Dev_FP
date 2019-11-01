using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MGO
{
    public partial class TotalPurchasesAndSales : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        double totalSales = 0;
        protected void grdPTotals_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                totalSales += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "Column1"));
            }
            else if (e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[4].Text = "Total Purchases";
                e.Row.Cells[4].Font.Bold = true;
                e.Row.Cells[5].Text = $"{totalSales:C}";
            }
        }

        double totalSales2 = 0;
        protected void grdSTotals_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                totalSales2 += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "Column1"));
            }
            else if (e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[4].Text = "Total Sales";
                e.Row.Cells[4].Font.Bold = true;
                e.Row.Cells[5].Text = $"{totalSales:C}";
            }
        }
    }
}