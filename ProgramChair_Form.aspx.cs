using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace St.Clair
{
    public partial class ProgramChair_Form : System.Web.UI.Page
    {
        Service.IPL_COMMService service = new Service.IPL_COMMService();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                //DataModel DM=new DataModel();   
                //Chart newChart = new Chart("column3d", "simplechart", "600", "400", "jsonurl", "data.json");
                //chart.Text = newChart.Render();
                //newChart.Render();
                string usernanme = Session["Username"].ToString();
                Label3.Text = usernanme;
                BindGrid();
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {

        }

        protected void gridService_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        protected void gridService_RowCreated(object sender, GridViewRowEventArgs e)
        {

        }

        protected void gridService_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }

        protected void gridService_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridService.PageIndex = e.NewPageIndex;
            Btn_Search_Click(sender, e);
            //this.BindGrid();
        }

        public void BindGrid()
        {
            try
            {

                object[] cmd = new object[2];
                cmd[0] = DateTime.Now.ToString("yyyy-MM-dd");
                cmd[1] = DateTime.Now.ToString("yyyy-MM-dd");
                DataSet ds = service.IPL_Data_FetchWithParam("SP_FetchData_Programchair", cmd);
                DataTable dt = new DataTable();
                dt = ds.Tables[0].Copy();
                gridService.DataSource = dt;
                gridService.DataBind();
            }
            catch (Exception ex)
            {

            }

        }

        protected void Btn_Search_Click(object sender, EventArgs e)
        {
            try
            {
                object[] cmd = new object[2];
                cmd[0] = Txt_From.Text;
                cmd[1] = txt_To.Text;
                DataSet dssearch = service.IPL_Data_FetchWithParam("SP_FetchData_Programchair", cmd);
                gridService.DataSource = null;
                gridService.DataSource = dssearch.Tables[0].Copy();
                gridService.DataBind();
            }
            catch (Exception ex)
            {

            }


        }



        protected void btn_view_Click(object sender, EventArgs e)
        {

            //string ID = gridService.SelectedRow.Cells[1].Text;
            //Response.Redirect("~/CAE_LOAD.aspx");

            //Response.Redirect("WebForm2.aspx?id=123");
        }

        protected void gridService_RowEditing1(object sender, GridViewEditEventArgs e)
        {

        }

        protected void gridService_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {

            }
        }

        protected void gridService_SelectedIndexChanged(object sender, EventArgs e)
        {


            int ID = Convert.ToInt32((gridService.SelectedIndex).ToString());


            //int iAddressId = Convert.ToInt32(gridService.Rows[ID].Cells[1].Text);

            Label Transaction_ID = (Label)gridService.Rows[ID].FindControl("Transaction_Id");
            Label Program_Name = (Label)gridService.Rows[ID].FindControl("Program_Name");

            int Trans_Id = Convert.ToInt16(Transaction_ID.Text);

            string Pro_Name = Program_Name.Text;


            Response.Redirect("~/Programchair_LOAD.aspx?Trans_Id=" + Trans_Id + "&" + "Pro_Name=" + Pro_Name + "");

            //Response.Redirect("~/CAE_LOAD.aspx?Trans_Id="+Trans_Id+"");
            //Server.Transfer("~/CAE_LOAD.aspx?Trans_Id=" + Trans_Id + "");
        }
    }
}
