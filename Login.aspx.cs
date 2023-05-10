using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace St.Clair
{
    public partial class Login : System.Web.UI.Page
    {
        Service.IPL_COMMService service = new Service.IPL_COMMService();
        List<UserEntity> ObjFilterUserList = new List<UserEntity>();
        Registration RG = new Registration();

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtPassword.Text != "" && txtUserName.Text != "")
                {
                    String Username = txtUserName.Text.ToLower();
                    string pwd = ClsEncryptionHelper.Decrypt("zrv3u9k9C2o6Nw5o46TBHg==");

                    string encryptpwd = ClsEncryptionHelper.Encrypt(txtPassword.Text);

                    
                    object[] cmd = new object[2];
                    cmd[0] = Username.ToString();
                    cmd[1] = encryptpwd.ToString();

                    DataSet ds = service.IPL_Data_FetchWithParam("SP_CHECK_USER_MASTER", cmd);

                    if (ds.Tables[0].Rows[0][0].ToString()=="Error")
                    {
                        
                        string message = "Please check the Username and Password that you have entered!!";
                        System.Text.StringBuilder sb = new System.Text.StringBuilder();
                        sb.Append("<script type = 'text/javascript'>");
                        sb.Append("window.onload=function(){");
                        sb.Append("alert('");
                        sb.Append(message);
                        sb.Append("')};");
                        sb.Append("</script>");
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
                        return;
                    }
                    else if(ds.Tables[0].Rows.Count== 0)
                    {
                        string message = "Please check the Username and Password that you have entered!!";
                        System.Text.StringBuilder sb = new System.Text.StringBuilder();
                        sb.Append("<script type = 'text/javascript'>");
                        sb.Append("window.onload=function(){");
                        sb.Append("alert('");
                        sb.Append(message);
                        sb.Append("')};");
                        sb.Append("</script>");
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
                        return;
                    }

                    Session["Username"] = Username.ToString();
                    Session["Password"] = encryptpwd.ToString();
                    string userid = ds.Tables[0].Rows[0][0].ToString();

                    string UserName = Username.ToString();
                    string url = "";

                    Session["Email"] = ds.Tables[0].Rows[0][3].ToString();

                    if (UserName != "admin")
                    {
                        object[] cmd1 = new object[1];
                        cmd1[0] = userid.ToString();
                        DataSet dsuserList = service.IPL_Data_FetchWithParam("USP_FETCH_MenuList", cmd1);


                        url = dsuserList.Tables[0].Rows[0]["LINK_NAME"].ToString();
                        if (url != "")
                        {
                            //Response.Redirect("~/Dashboard.aspx", false); 
                            Response.Redirect("~/" + url, false);
                        }
                        else
                        {
                            ScriptManager.RegisterClientScriptBlock(this.Page, typeof(Page), "MyScript", "alert('Page Not Found');", true);
                        }


                    }
                    else
                    {
                        Response.Redirect("~/Registration.aspx", false);
                        Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
                        Response.Cache.SetCacheability(HttpCacheability.NoCache);
                        Response.Cache.SetNoStore();
                    }

                }
                else
                {
                    string message = "Please check the Username and Password that you have entered!!";
                    System.Text.StringBuilder sb = new System.Text.StringBuilder();
                    sb.Append("<script type = 'text/javascript'>");
                    sb.Append("window.onload=function(){");
                    sb.Append("alert('");
                    sb.Append(message);
                    sb.Append("')};");
                    sb.Append("</script>");
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
                    //string message = "Do you want to Submit?";
                    //System.Text.StringBuilder sb = new System.Text.StringBuilder();
                    //sb.Append("return confirm('");
                    //sb.Append(message);
                    //sb.Append("');");
                    //ClientScript.RegisterOnSubmitStatement(this.GetType(), "alert", sb.ToString());
                }
            }
            catch
            {

            }



        }

        protected void lnkbtnForgotPassword_Click(object sender, EventArgs e)
        {

        }

        protected void btnSentPassword_Click(object sender, EventArgs e)
        {

        }
    }
}