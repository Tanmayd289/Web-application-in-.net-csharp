using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace St.Clair
{
    public partial class LandingPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Button btn = this.Master.FindControl("Button1") as Button;
                btn.Visible = true;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("STD_NEW.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

        }

        protected void Button3_Click(object sender, EventArgs e)
        {

        }

        protected void Button4_Click(object sender, EventArgs e)
        {

        }
    }
}