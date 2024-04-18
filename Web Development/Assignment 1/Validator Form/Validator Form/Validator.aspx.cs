using System;

namespace YourNamespace
{
    public partial class Validator : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnCheck_Click(object sender, EventArgs e)
        {
            // Validate all conditions here
            if (IsValid)
            {
                Response.Redirect("AnotherPage.aspx");
            }
            else
            {
                // Validation failed, display error message
                lblValidationResult.Text = "Validation failed!";
                lblValidationResult.Visible = true;
            }
        }
    }
}
