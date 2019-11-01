using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MGO
{
    public partial class SalesByCategory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        double totalSales = 0;
        protected void grdSalesByCat_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            

            if(e.Row.RowType == DataControlRowType.DataRow)
            {
                totalSales += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "Column1"));
            }
            else if (e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[6].Text = "Total Sales";
                e.Row.Cells[6].Font.Bold = true;
                e.Row.Cells[7].Text = $"{totalSales:C}";
            }
        }

        
    }
}