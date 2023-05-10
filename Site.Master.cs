using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace St.Clair
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Button1.Visible = false;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Remove("username");
            Session.Remove("password");
            Response.Redirect("~/Login.aspx");
        }
    }
}