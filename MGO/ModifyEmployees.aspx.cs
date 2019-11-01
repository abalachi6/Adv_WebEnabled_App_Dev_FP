using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MGO
{
    public partial class ModifyEmployees : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private string DatabaseErrorMessage(string msg)
        {
            return $"A database error has occurred. Message: {msg}";
        }


        private string ConcurrencyErrorMessage()
        {
            return "Another user may have updated this product.  Please try again or contact Tech Support at ext. 2544.";
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                SqlEmployees.InsertParameters["Emp_ID"].DefaultValue = txtEmployeeID.Text;
                SqlEmployees.InsertParameters["Emp_FName"].DefaultValue = txtFName.Text;
                SqlEmployees.InsertParameters["Emp_LName"].DefaultValue = txtLName.Text;
                SqlEmployees.InsertParameters["Emp_Position"].DefaultValue = ddlPosition.SelectedValue;
                SqlEmployees.InsertParameters["Emp_Commission"].DefaultValue = txtCommission.Text;

                try
                {
                    SqlEmployees.Insert();
                    txtEmployeeID.Text = "";
                    txtFName.Text = "";
                    txtLName.Text = "";
                    ddlPosition.SelectedValue = "Buyer/Seller";
                    lblErrorMessage.Text = "Employee was added successfully";

                }
                catch(Exception ex)
                {
                    lblErrorMessage.Text = DatabaseErrorMessage(ex.Message);
                }
            }
        }

        protected void grdEmployees_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            if (e.Exception != null)
            {
                lblErrorMessage.Text = DatabaseErrorMessage(e.Exception.Message);
                e.ExceptionHandled = true;
            }
            else if (e.AffectedRows == 0)
            {
                lblErrorMessage.Text = ConcurrencyErrorMessage();
            }
        }

        protected void grdEmployees_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            if (e.Exception != null)
            {
                lblErrorMessage.Text = DatabaseErrorMessage(e.Exception.Message);
                e.KeepInEditMode = true;
                e.ExceptionHandled = true;
            }
            else if (e.AffectedRows == 0)
            {
                lblErrorMessage.Text = ConcurrencyErrorMessage();
            }
        }
    }
}
