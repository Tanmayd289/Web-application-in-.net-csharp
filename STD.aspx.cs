using Microsoft.AspNetCore.Mvc.ModelBinding;
using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//using System.Windows.Forms;
//using Outlook = Microsoft.Office.Interop.Outlook;

namespace St.Clair
{
    public partial class STD : System.Web.UI.Page
    {
        Service.IPL_COMMService service = new Service.IPL_COMMService();
        bool IsPageRefresh;
        bool Delete = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            //TextBox3.KeyPress += new KeyPressEventHandler(txtHomePhone_KeyPress);

            //this.TextBox2.Text = DateTime.Now.ToString("yyyy/mm/dd");

            if (!IsPostBack)
            {
                try
                {
                    DataSet ds = service.IPL_Data_Fetch("USP_FETCH_CourseDetail");
                    DataTable dt = new DataTable();
                    dt = ds.Tables[0].Copy();
                    DropDownList1.DataSource = dt;
                    DropDownList1.DataTextField = "Course_Name";
                    DropDownList1.DataValueField = "Course_Name";
                    DropDownList1.DataBind();
                    DropDownList1.Items.Insert(0, "--Select--");

                    //SetInitialRow();
                    Label11.Visible = false;
                    ViewState["postids"] = System.Guid.NewGuid().ToString();
                    Session["postid"] = ViewState["postids"].ToString();

                    //Panel1.Visible = false;
                    //ButtonAdd.Visible = false;
                    //Btn_delete.Visible= false;
                    //Button1.Visible = false;

                    //DateTime date = DateTime.Today;
                    //TextBox2.Text = date.ToString("dd/MM/yyyy");
                }
                catch (Exception ex)
                {

                }

            }
            else
            {
                try
                {
                    if (ViewState["postids"].ToString() != Session["postid"].ToString())
                    {
                        IsPageRefresh = true;
                    }
                    if (IsPageRefresh == true)
                    {
                        Session["postid"] = System.Guid.NewGuid().ToString();
                        ViewState["postids"] = Session["postid"].ToString();
                        GridView1.DataSource = null;
                        GridView1.DataBind();

                        TextBox2.Text = null;
                        TextBox3.Text = null;
                        TextBox4.Text = null;
                        TextBox5.Text = null;
                        TextBox6.Text = null;
                        TextBox7.Text = null;

                    }
                }
                catch { }


            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Remove("username");
            Session.Remove("password");
            Response.Redirect("~/Login.aspx");
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DropDownList1_SelectedIndexChanged1(object sender, EventArgs e)
        {
            if (IsPageRefresh != true)
            {
                string Dropvalue = DropDownList1.SelectedItem.Value.ToString();

                if (Dropvalue != "--Select--")
                {
                    object[] cmd1 = new object[1];
                    cmd1[0] = Dropvalue.ToString();

                    DataSet ds = service.IPL_Data_FetchWithParam("USP_FETCH_CourseData", cmd1);
                    ViewState["mydatasource"] = ds.Tables[0];
                    GridView1.DataSource = ds.Tables[0];
                    GridView1.DataBind();
                    Label11.Visible = true;
                    SetInitialRow();
                    TextBox4.Text = ds.Tables[1].Rows[0][1].ToString();
                    TextBox5.Text = ds.Tables[1].Rows[0][0].ToString();

                }
                else
                {
                    // Response.Write("<script>alert('Please select the value!!');</script>");
                }
            }
            else
            {
                DropDownList1.SelectedIndex = 0;
                //int i=Gridview2.Rows.Count-1;
                //for(int j=0;j<=1;j++)
                //{
                //    Gridview2.DeleteRow(j);
                //}

            }


        }

        private void SetInitialRow()

        {
            try
            {
                DataTable dt = new DataTable();

                DataRow dr = null;

                dt.Columns.Add(new DataColumn("RowNumber", typeof(string)));

                dt.Columns.Add(new DataColumn("Column1", typeof(string)));

                dt.Columns.Add(new DataColumn("Column2", typeof(string)));

                dt.Columns.Add(new DataColumn("Column3", typeof(string)));

                dr = dt.NewRow();

                dr["RowNumber"] = 1;

                dr["Column1"] = string.Empty;

                dr["Column2"] = string.Empty;

                dr["Column3"] = string.Empty;

                dt.Rows.Add(dr);

                //dr = dt.NewRow();

                //Store the DataTable in ViewState

                ViewState["CurrentTable"] = dt;

                Gridview2.DataSource = dt;

                Gridview2.DataBind();
            }
            catch (Exception ex)
            {

            }


        }
        private void AddNewRowToGrid()
        {
            int rowIndex = 0;
            if (ViewState["CurrentTable"] != null)
            {
                DataTable dtCurrentTable = (DataTable)ViewState["CurrentTable"];

                DataRow drCurrentRow = null;

                if (dtCurrentTable.Rows.Count > 0)
                {
                    for (int i = 1; i <= dtCurrentTable.Rows.Count; i++)
                    {
                        //extract the TextBox values

                        TextBox box1 = (TextBox)Gridview2.Rows[rowIndex].Cells[1].FindControl("TextBox1");

                        TextBox box2 = (TextBox)Gridview2.Rows[rowIndex].Cells[2].FindControl("TextBox2");

                        //TextBox box3 = (TextBox)Gridview2.Rows[rowIndex].Cells[3].FindControl("TextBox3");

                        if (Delete != true)
                        {
                            drCurrentRow = dtCurrentTable.NewRow();

                            drCurrentRow["RowNumber"] = i + 1;

                        }

                        dtCurrentTable.Rows[i - 1]["Column1"] = box1.Text;

                        dtCurrentTable.Rows[i - 1]["Column2"] = box2.Text;

                        // dtCurrentTable.Rows[i - 1]["Column3"] = box3.Text;

                        rowIndex++;

                    }
                    if (Delete != true)
                    {
                        dtCurrentTable.Rows.Add(drCurrentRow);
                    }

                    ViewState["CurrentTable"] = dtCurrentTable;
                    Gridview2.DataSource = dtCurrentTable;
                    Gridview2.DataBind();
                }
            }
            else
            {
                Response.Write("ViewState is null");
            }
            //Set Previous Data on Postbacks
            SetPreviousData();
        }
        private void SetPreviousData()
        {
            int rowIndex = 0;

            if (ViewState["CurrentTable"] != null)
            {
                DataTable dt = (DataTable)ViewState["CurrentTable"];

                if (dt.Rows.Count > 0)
                {

                    for (int i = 0; i < dt.Rows.Count; i++)
                    {

                        TextBox box1 = (TextBox)Gridview2.Rows[rowIndex].Cells[1].FindControl("TextBox1");

                        TextBox box2 = (TextBox)Gridview2.Rows[rowIndex].Cells[2].FindControl("TextBox2");

                        // TextBox box3 = (TextBox)Gridview2.Rows[rowIndex].Cells[3].FindControl("TextBox3");

                        box1.Text = dt.Rows[i]["Column1"].ToString();

                        box2.Text = dt.Rows[i]["Column2"].ToString();

                        // box3.Text = dt.Rows[i]["Column3"].ToString();

                        rowIndex++;
                    }
                }
            }
        }

        protected void ButtonAdd_Click(object sender, EventArgs e)
        {
            if (IsPageRefresh == true)
            {
                int i = Gridview2.Rows.Count - 1;
                for (int j = 0; j <= 1; j++)
                {
                    Gridview2.DeleteRow(j);
                }
            }
            else
            {
                AddNewRowToGrid();
            }

        }

        protected void Button1_Click2(object sender, EventArgs e)
        {
            AddNewRowToGrid();
        }

        protected void Btn_delete_Click(object sender, EventArgs e)
        {
            try
            {
                //DataTable dt1 = Gridview2.DataSource as DataTable;

                DataTable dt = (DataTable)ViewState["CurrentTable"];

                int count = dt.Rows.Count - 1;


                //if (count > 1)
                //{
                dt.Rows.RemoveAt(count);
                dt.AcceptChanges();

                //DataSet ds = new DataSet();
                //ds.Tables.Add(dt);

                ViewState["CurrentTable"] = dt;
                //Gridview2.DataSource = null;
                //Gridview2.DataBind();
                Delete = true;
                AddNewRowToGrid();



                //}
                //else if (count == 1)
                //{
                //    dt.Rows.RemoveAt(1);
                //    dt.AcceptChanges();


                //    ViewState["CurrentTable"] = dt;
                //    Gridview2.DataSource = dt;
                //    Gridview2.DataBind();
                //}

            }
            catch { }

        }

        protected void Button1_Click3(object sender, EventArgs e)
        {
            try
            {
                if(TextBox2.Text==""|| TextBox3.Text=="" || TextBox4.Text=="" || TextBox5.Text==""||(CheckBox1.Checked==false && CheckBox2.Checked==false) || (CheckBox3.Checked == false && CheckBox4.Checked == false) || TextBox6.Text=="" && TextBox7.Text=="" || ( CheckBox5.Checked==false && CheckBox6.Checked==false  && CheckBox7.Checked==false))
                {
                    string message = "Please fill the form and then try gain.!!";
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

                if(Gridview2.Rows.Count==0)
                {
                    return;
                }
                AddNewRowToGrid();

                DataTable dt = ViewState["mydatasource"] as DataTable;
                DataSet ds = new DataSet();
                ds.Tables.Add(dt);
                string XMl = ds.GetXml();


                DataTable dt1 = ViewState["CurrentTable"] as DataTable;
                dt1.Rows.RemoveAt(dt1.Rows.Count - 1);
                DataSet ds1 = new DataSet();             
                ds1.Tables.Add(dt1);
                string XMl2 = ds1.GetXml();


                int chck1;
                int chck2;

                string location = "";
                if (CheckBox1.Checked)
                {
                    chck1 = 1;
                }
                else
                {
                    chck1 = 0;
                }
                if (CheckBox3.Checked)
                {
                    chck2 = 1;
                }
                else
                {
                    chck2 = 0;
                }

                if (CheckBox5.Checked)
                {
                    location = CheckBox5.Text.ToString();
                }
                else if (CheckBox6.Checked)
                {
                    location = CheckBox5.Text.ToString();
                }
                else if (CheckBox7.Checked)
                {
                    location = CheckBox5.Text.ToString();
                }

                string Dropvalue = DropDownList1.SelectedItem.Value.ToString();

                //try
                //{
                //    DateTime date = Convert.ToDateTime(TextBox2.Text);
                //    string dateString = date.ToString("yyyy-MM-dd", CultureInfo.InvariantCulture);
                //}

                //catch { }

                object[] cmdI = new object[14];
                cmdI[0] = Dropvalue.ToString();
                cmdI[1] = TextBox2.Text.ToString();
                cmdI[2] = TextBox3.Text.ToString();
                cmdI[3] = TextBox4.Text.ToString();
                cmdI[4] = TextBox5.Text.ToString();
                cmdI[5] = chck1.ToString();
                cmdI[6] = chck2.ToString();
                cmdI[7] = TextBox6.Text.ToString();
                cmdI[8] = TextBox7.Text.ToString();
                cmdI[9] = location.ToString();
                //cmdI[10] = location.ToString();
                //cmdI[11] = location.ToString();               
                cmdI[10] = Session["Username"].ToString();
                cmdI[11] = Session["Email"].ToString();
                cmdI[12] = XMl.ToString();
                cmdI[13] = XMl2.ToString();



                DataSet ds12 = new DataSet();
                ds12 = service.IPL_Data_FetchWithParam("SP_Insert_Master_DATA_NEW", cmdI);

                DataSet dsinsert = new DataSet();

                if (dsinsert.Tables[0].Rows[0][0].ToString()== "successs")
                {
                    Mailsent();
                    string message = "The Data has been saved and a mail is sent to you.!!";
                    System.Text.StringBuilder sb = new System.Text.StringBuilder();
                    sb.Append("<script type = 'text/javascript'>");
                    sb.Append("window.onload=function(){");
                    sb.Append("alert('");
                    sb.Append(message);
                    sb.Append("')};");
                    sb.Append("</script>");
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());


                }
                else
                {
                    string message = "The Data Is not saved Please try again.!!";
                    System.Text.StringBuilder sb = new System.Text.StringBuilder();
                    sb.Append("<script type = 'text/javascript'>");
                    sb.Append("window.onload=function(){");
                    sb.Append("alert('");
                    sb.Append(message);
                    sb.Append("')};");
                    sb.Append("</script>");
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());

                    Response.Redirect("~/LandingPage.aspx");  
                }
            }
            catch(Exception ex)
            {

            }
           



          

        }

        public void Mailsent()
        {
            try
            {
                MailMessage message = new MailMessage();
                SmtpClient smtp = new SmtpClient();

                message.From = new MailAddress("tanmaydaulatwal18021998@gmail.com");
                message.To.Add(new MailAddress("tanmayd289@gmail.com"));
                message.Subject = "Test";
                message.Body = "Content";

                smtp.Port = 587;
                smtp.Host = "smtp.gmail.com";
                smtp.EnableSsl = true;
                smtp.UseDefaultCredentials = false;
                smtp.Credentials = new NetworkCredential("tanmaydaulatwal18021998@gmail.com", "Marlboro@123");
                smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                smtp.Send(message);
            }
            catch (Exception ex)
            {
                
            }
        }

        
        protected void TextBox3_TextChanged1(object sender, EventArgs e)
        {
            if (System.Text.RegularExpressions.Regex.IsMatch(TextBox3.Text, "[^0-9]"))
            {
                // MessageBox.Show("Please enter only numbers.");
                TextBox3.Text = "";
            }
        }

        protected void TextBox6_TextChanged(object sender, EventArgs e)
        {
            if (System.Text.RegularExpressions.Regex.IsMatch(TextBox6.Text, "[^0-9]"))
            {
                // MessageBox.Show("Please enter only numbers.");
                TextBox6.Text = "";
            }
        }

        protected void TextBox7_TextChanged(object sender, EventArgs e)
        {
            if (System.Text.RegularExpressions.Regex.IsMatch(TextBox7.Text, "[^0-9]"))
            {
                // MessageBox.Show("Please enter only numbers.");
                TextBox7.Text = "";
            }
        }


        // public void DATA()
        //{
        //    Outlook.Application oApp = new Outlook.Application();

        //    //Create the new message by using the simplest approach.
        //    Outlook.MailItem oMsg = (Outlook.MailItem)oApp.CreateItem(Outlook.OlItemType.olMailItem);

        //    //Add a recipient.
        //    // TODO: Change the following recipient where appropriate.
        //    Outlook.Recipient oRecip = (Outlook.Recipient)oMsg.Recipients.Add("e-mail address");
        //    oRecip.Resolve();

        //    //Set the basic properties.
        //    oMsg.Subject = "This is the subject of the test message";
        //    oMsg.Body = "This is the text in the message.";

        //    //Add an attachment.
        //    // TODO: change file path where appropriate
        //    String sSource = "C:\\setupxlg.txt";
        //    String sDisplayName = "MyFirstAttachment";
        //    int iPosition = (int)oMsg.Body.Length + 1;
        //    int iAttachType = (int)Outlook.OlAttachmentType.olByValue;
        //    Outlook.Attachment oAttach = oMsg.Attachments.Add(sSource, iAttachType, iPosition, sDisplayName);

        //    // If you want to, display the message.
        //    // oMsg.Display(true);  //modal

        //    //Send the message.
        //    oMsg.Save();
        //    oMsg.Send();

        //    //Explicitly release objects.
        //    oRecip = null;
        //    oAttach = null;
        //    oMsg = null;
        //    oApp = null;
        //}
    }
}