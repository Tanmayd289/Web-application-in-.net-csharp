using Microsoft.SharePoint.Client.UserProfiles;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace St.Clair
{
    public partial class Registration : System.Web.UI.Page
    {
        Service.IPL_COMMService service = new Service.IPL_COMMService();

        public static String SP;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                try
                {
                    login_container.Visible = false;
                    Grid_Fill();
                    //object[] cmd = new object[2];
                    //cmd[0] = Session["Username"].ToString();
                    //cmd[1] = Session["Password"].ToString();

                    //DataSet ds = service.IPL_Data_FetchWithParam("SP_CHECK_USER_MASTER", cmd);
                    //DataTable dt = new DataTable();
                    //dt = ds.Tables[0].Copy();
                    //gvUSER_MASTER.DataSource = dt;
                    //gvUSER_MASTER.DataBind();
                    //DropDownList1.DataSource = dt;
                    //DropDownList1.DataTextField = "RoleName";
                    //DropDownList1.DataValueField = "RoleName";
                    //DropDownList1.DataBind();

      
                }
                catch
                {

                }
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {

                if (TextBox1.Text != "" && TextBox2.Text != "" && TextBox3.Text != "" && DropDownList1.SelectedItem.Text != "--Select--")
                {
                    string Password = ClsEncryptionHelper.Encrypt(TextBox2.Text);
                    object[] cmd1 = new object[6];
                    try
                    {
                        cmd1[0] = Session["Userid_New"].ToString();

                    }
                    catch { }
                    cmd1[1] = TextBox1.Text;
                    cmd1[2] = Password.ToString();
                    cmd1[3] = TextBox3.Text;
                    try
                    {
                        cmd1[4] = Session["RoleID"].ToString();
                    }
                    catch
                    {
                        cmd1[4] = DropDownList1.SelectedValue.ToString().ToString();
                    }
                    //cmd1[4] = DropDownList1.SelectedValue.ToString().ToString();
                    cmd1[5] = "True";


                    DataSet ds = service.IPL_Data_FetchWithParam(SP, cmd1);

                    try
                    {
                        SP = "";
                        if (ds.Tables[0].Rows[0][0].ToString() == "Success")
                        {
                            string message = "The User Has been submitted!!";
                            System.Text.StringBuilder sb = new System.Text.StringBuilder();
                            sb.Append("<script type = 'text/javascript'>");
                            sb.Append("window.onload=function(){");
                            sb.Append("alert('");
                            sb.Append(message);
                            sb.Append("')};");
                            sb.Append("</script>");
                            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());

                            Response.Redirect("~/Registration.aspx");
                        }
                        else
                        {
                            string message = "The User is not been submitted!!";
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
                    }
                    catch
                    {

                    }



                }
                else
                {
                    string message = "Please check the Fields that you have entered!!";
                    System.Text.StringBuilder sb = new System.Text.StringBuilder();
                    sb.Append("<script type = 'text/javascript'>");
                    sb.Append("window.onload=function(){");
                    sb.Append("alert('");
                    sb.Append(message);
                    sb.Append("')};");
                    sb.Append("</script>");
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
                }


            }
            catch
            {

            }
        }

        protected void gvUSER_MASTER_RowCommand(object sender, GridViewCommandEventArgs e)
        {
         
            try
            {
                
                if (e.CommandName == "Modify")
                {
                    try
                    {
                        SP = "USP_UPDATE_USER_MASTER";
                        login_container.Visible = true;
                        gvUSER_MASTER.Visible = false;

                        int index = Convert.ToInt32(e.CommandArgument);
                        //int rowIndex = ((GridViewRow)((ImageButton)e.CommandSource).NamingContainer).RowIndex;
                        GridViewRow row = gvUSER_MASTER.Rows[index];
                        Btn_AddUser.Visible = false;
                        Btn_Import.Visible = false; 
                        //Button2.Visible = true;
                        string Userid = row.Cells[0].Text;
                        string txtUserName = row.Cells[1].Text;
                        string txtEmailID = row.Cells[3].Text;
                        string ddlRoleName = row.Cells[4].Text;
                        TextBox1.Text = txtUserName.ToString();
                        TextBox3.Text = txtEmailID.ToString();
                        Session["RoleID"] = ddlRoleName.ToString();
                        Session["Userid_New"] = Userid.ToString();
                    }
                    catch(Exception ex)
                    {

                    }
                    
                }
                else if (e.CommandName == "Delete_Row")
                {
                    try
                    {
                        int index = Convert.ToInt32(e.CommandArgument);
                        GridViewRow row = gvUSER_MASTER.Rows[index];
                        object[] cmd1 = new object[1];
                        cmd1[0] = row.Cells[0].Text;
                        DataSet ds = service.IPL_Data_FetchWithParam("USP_DELETE_USER_MASTER", cmd1);

                        if (ds.Tables[0].Rows[0][0].ToString() == "success")
                        {
                            string message = "User Deleted Successfully!!";
                            System.Text.StringBuilder sb = new System.Text.StringBuilder();
                            sb.Append("<script type = 'text/javascript'>");
                            sb.Append("window.onload=function(){");
                            sb.Append("alert('");
                            sb.Append(message);
                            sb.Append("')};");
                            sb.Append("</script>");
                            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
                            Grid_Fill();
                        }
                        else
                        {
                            return;
                        }
                    }
                    catch
                    {

                    }
                    
                }
            }

            catch
            {

            }



        }

        protected void gvUSER_MASTER_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (!IsPostBack)
            {
            }
        }

        protected void gvUSER_MASTER_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }

        protected void Btn_AddUser_Click(object sender, EventArgs e)
        {

            
            login_container.Visible = true;
            gvUSER_MASTER.Visible = false;
            Btn_AddUser.Visible = false;
            SP = "USP_INSERT_USER_MASTER";
            Btn_Import.Visible = false;
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";

        }

        protected void gvUSER_MASTER_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {

        }

        public void Grid_Fill()
        {
            try
            {
                object[] cmd = new object[2];
                cmd[0] = Session["Username"].ToString();
                cmd[1] = Session["Password"].ToString();

                DataSet ds = service.IPL_Data_FetchWithParam("SP_CHECK_USER_MASTER", cmd);
                DataTable dt = new DataTable();
                dt = ds.Tables[0].Copy();
                gvUSER_MASTER.DataSource = dt;
                gvUSER_MASTER.DataBind();


                //DataView view = new DataView(dt);
                //DataTable distinctValues = view.ToTable(true, "RoleName");


                DataSet distinctValues = service.IPL_Data_Fetch("SP_Get_RoleMaster");

                DropDownList1.DataSource = distinctValues.Tables[0];
                DropDownList1.DataTextField = "RoleName";
                DropDownList1.DataValueField = "RoleName";
                DropDownList1.DataBind();
                DropDownList1.Items.Insert(0, "--Select--");

            }
            catch
            {

            }
            
        }

        protected void Btn_Logout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Remove("username");
            Session.Remove("password");
            Response.Redirect("~/Login.aspx");
        }

        protected void Btn_Import_Click(object sender, EventArgs e)
        {
            //Session.Abandon();
            //Session.Remove("username");
            //Session.Remove("password");
            Response.Redirect("~/Import.aspx");
        }

        protected void Btn_Back_Click(object sender, EventArgs e)
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            
            login_container.Visible = false;
            gvUSER_MASTER.Visible = true;
            Btn_AddUser.Visible = true;
            Btn_Import.Visible = true;
            SP = "USP_INSERT_USER_MASTER";
            Btn_Import.Visible = true;
        }
    }
}