using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace St.Clair
{
    public partial class CAE_LOAD : System.Web.UI.Page
    {
        Service.IPL_COMMService IPL_Commservice = new Service.IPL_COMMService();
        bool IsPageRefresh;
        bool Delete = false;
        public static  int Trans_Id;
        public static string program_name;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                try
                {
                    Trans_Id = Convert.ToInt16(Request.QueryString["Trans_Id"]);
                    program_name = Request.QueryString["Pro_Name"].ToString();
                    string usernanme = Session["Username"].ToString();
                    Label5.Text = usernanme;
                    BindGrid();
                    SetInitialRow();
                }
                catch { }
            }
            
        }

        public void BindGrid()
        {
            object[] obj = new object[2];
            obj[0] = program_name;
            obj[1] = Trans_Id;

            DataSet ds= IPL_Commservice.IPL_Data_FetchWithParam("SP_Fetch_CAE_MASTER", obj);
            gridService.DataSource = ds.Tables[0].Copy();
            ViewState["mydatasource"] = ds.Tables[0].Copy();
            gridService.DataBind();
            GridView1.DataSource = null;
            GridView1.DataSource = ds.Tables[2].Copy();
            GridView1.DataBind();
               
        }
        protected void Btn_Search_Click(object sender, EventArgs e)
        {

        }

        protected void btn_view_Click(object sender, EventArgs e)
        {

        }

        protected void gridService_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridService.PageIndex = e.NewPageIndex;
            BindGrid();
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

        protected void ButtonAdd_Click1(object sender, EventArgs e)
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

        protected void Btn_delete_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable dt = (DataTable)ViewState["CurrentTable"];

                int count = dt.Rows.Count - 1;

                dt.Rows.RemoveAt(count);
                dt.AcceptChanges();

                ViewState["CurrentTable"] = dt;
                //Gridview2.DataSource = null;
                //Gridview2.DataBind();
                Delete = true;
                AddNewRowToGrid();
         
            }
            catch { }
        }

        protected void Btn_Save_Click(object sender, EventArgs e)
        {

        }

        protected void Btn_Save_Click1(object sender, EventArgs e)
        {

           
  
            AddNewRowToGrid();
            int val = CheckCourse_Code();

            if (val == 0)
            {
                string message = "Please check the Course code and then try gain.!!";
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
            DataTable dt1 = ViewState["CurrentTable"] as DataTable;
            //dt1.Rows.RemoveAt(dt1.Rows.Count - 1);
            dt1.Columns.RemoveAt(dt1.Columns.Count - 1);
            DataSet ds1 = new DataSet();
            ds1.Tables.Add(dt1);
            string XMl2 = ds1.GetXml();
            object[] Para = new object[2];
            Para[0] = Trans_Id;
            Para[1] = XMl2;

            DataSet dsinsert = new DataSet();
            try
            {
                dsinsert = Class1.WebServiceMaster.IPL_Data_FetchWithParam("SP_Insert_Master_DATA_CAE", Para);

                // DataSet Saveed = IPL_Commservice.IPL_Data_FetchWithParam("SP_Fetch_Master_DATA", Para);
            }
            catch { }

            if (dsinsert.Tables[0].Rows[0][0].ToString() == "successs")
            {
                //Mailsent();
                string message = "The Data has been saved and a mail is sent to you.!!";
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append("<script type = 'text/javascript'>");
                sb.Append("window.onload=function(){");
                sb.Append("alert('");
                sb.Append(message);
                sb.Append("')};");
                sb.Append("</script>");
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
                //Session.Abandon();
                //Session.Remove("username");
                //Session.Remove("password");
                
            }
            else
            {
                string message = "Please try Again.!!";
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append("<script type = 'text/javascript'>");
                sb.Append("window.onload=function(){");
                sb.Append("alert('");
                sb.Append(message);
                sb.Append("')};");
                sb.Append("</script>");
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
                
            }
            Response.Redirect("~/CAE_Form.aspx");
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            this.BindGrid1();
        }

        public void BindGrid1()
        {
            object[] obj = new object[2];
            obj[0] = program_name;
            obj[1] = Trans_Id;

            DataSet ds = IPL_Commservice.IPL_Data_FetchWithParam("SP_Fetch_CAE_MASTER", obj);            
            GridView1.DataSource = null;
            GridView1.DataSource = ds.Tables[2].Copy();
            GridView1.DataBind();

        }
        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        public int CheckCourse_Code()
        {
            DataTable dtCurrent = (DataTable)ViewState["mydatasource"];
            DataTable dtnew = (DataTable)ViewState["CurrentTable"];

            string valuesarr = string.Empty;
            for (int i = 0; i < dtnew.Rows.Count; i++)
            {
                //List<object> lst = dtnew.Rows[i].ItemArray.ToList();
                //foreach (Object s in lst)
                //{
                //    valuesarr = s.ToString();
                //}

                if (String.IsNullOrEmpty(dtnew.Rows[i][1].ToString()) && String.IsNullOrEmpty(dtnew.Rows[i][2].ToString()))
                    dtnew.Rows.RemoveAt(i);
            }
            dtnew.AcceptChanges();

            ViewState["CurrentTable"] = dtnew;
            int lintSumOfItems = 0;

            foreach (DataRow rowMasterItems in dtnew.Rows)
            {

                foreach (DataRow rowItems in dtCurrent.Rows)
                {
                    if (rowMasterItems["Column2"].ToString().Equals(rowItems["Course_Code"].ToString()))
                    {
                        lintSumOfItems += 1;
                    }
                }

            }
            if (lintSumOfItems == dtnew.Rows.Count)
            {
                return lintSumOfItems;
            }
            else
            {
                return 0;
            }
        }
    }
}