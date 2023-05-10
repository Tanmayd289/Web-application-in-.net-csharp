using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace St.Clair
{
    public class MessageBox : System.Web.UI.Page
    {

        public void Data( string value)
        {
            string message = value;
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append("return confirm('");
            sb.Append(message);
            sb.Append("');");
            ClientScript.RegisterOnSubmitStatement(this.GetType(), "alert", sb.ToString());
        }

    }

    //public MessageBox(string value)
    //{
    //    string message = value;
    //    System.Text.StringBuilder sb = new System.Text.StringBuilder();
    //    sb.Append("return confirm('");
    //    sb.Append(message);
    //    sb.Append("');");
    //    ClientScript.RegisterOnSubmitStatement(this.GetType(), "alert", sb.ToString());
    //}
}
