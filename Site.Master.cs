using System;
using System.Web.UI;
using Ferro_Oriente.Services;

namespace Ferro_Oriente
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                litCartCount.Text = CartService.CountItems(Session).ToString();
                var userName = Session["UserName"] as string;
                var userRole = Session["UserRole"] as string;

                if (string.IsNullOrWhiteSpace(userName))
                {
                    phAuthenticated.Visible = false;
                    phAnonymous.Visible = true;
                }
                else
                {
                    phAuthenticated.Visible = true;
                    phAnonymous.Visible = false;
                    litUserName.Text = userName;
                    litUserRole.Text = userRole;
                }
            }
        }

        protected void Logout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Default.aspx");
        }
    }
}
