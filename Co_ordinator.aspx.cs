using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace St.Clair
{
    public partial class Co_ordinator : System.Web.UI.Page
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
        public void BindGrid()
        {
            try
            {

                object[] cmd = new object[2];
                cmd[0] = DateTime.Now.ToString("yyyy-MM-dd");
                cmd[1] = DateTime.Now.ToString("yyyy-MM-dd");
                DataSet ds = service.IPL_Data_FetchWithParam("SP_FetchData_Co_ordinator", cmd);
                DataTable dt = new DataTable();
                dt = ds.Tables[0].Copy();
                gridService.DataSource = dt;
                gridService.DataBind();
            }
            catch (Exception ex)
            {

            }

        }
        protected void gridService_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }

        protected void gridService_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        protected void gridService_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Btn_Search_Click(object sender, EventArgs e)
        {

        }

        protected void gridService_PageIndexChanging1(object sender, GridViewPageEventArgs e)
        {

        }

        protected void gridService_RowEditing1(object sender, GridViewEditEventArgs e)
        {

        }

        protected void gridService_SelectedIndexChanged1(object sender, EventArgs e)
        {
            int ID = Convert.ToInt32((gridService.SelectedIndex).ToString());


            //int iAddressId = Convert.ToInt32(gridService.Rows[ID].Cells[1].Text);

            Label Transaction_ID = (Label)gridService.Rows[ID].FindControl("Transaction_Id");
            Label Program_Name = (Label)gridService.Rows[ID].FindControl("Program_Name");

            int Trans_Id = Convert.ToInt16(Transaction_ID.Text);

            string Pro_Name = Program_Name.Text;


            Response.Redirect("~/Co_ordinator_LOAD.aspx?Trans_Id=" + Trans_Id + "&" + "Pro_Name=" + Pro_Name + "");
        }

        protected void Btn_Search_Click1(object sender, EventArgs e)
        {
            try
            {
                object[] cmd = new object[2];
                cmd[0] = Txt_From.Text;
                cmd[1] = txt_To.Text;
                DataSet dssearch = service.IPL_Data_FetchWithParam("SP_FetchData_Co_ordinator", cmd);
                gridService.DataSource = null;
                gridService.DataSource = dssearch.Tables[0].Copy();
                gridService.DataBind();
            }
            catch (Exception ex)
            {

            }
        }
    }
}