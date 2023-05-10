using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.DataVisualization.Charting;
using System.Data;
using System.Web.UI.WebControls;
using FusionCharts.Charts;
using Chart = FusionCharts.Charts.Chart;
using System.Text;
using FusionCharts.DataEngine;
using FusionCharts.Visualization;

namespace St.Clair
{
    public partial class CAE_Form : System.Web.UI.Page
    {
        Service.IPL_COMMService service = new Service.IPL_COMMService();

        protected void Page_Load(object sender, EventArgs e)
        {
            //object[] cmd = new object[2];
            //cmd[0] = Session["Username"].ToString();
            //cmd[1] = Session["Password"].ToString();

            if (!IsPostBack)
            {
                Chart();
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
            if (String.IsNullOrEmpty(Txt_From.Text) && String.IsNullOrEmpty(txt_To.Text))
            {
                searchdata();
            }
            else
            {
                Btn_Search_Click(sender, e);
            }

            //this.BindGrid();
        }

        public void BindGrid()
        {
            try
            {
                DataSet ds = service.IPL_Data_Fetch("SP_Fetch_CAE_Data");
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
                DataSet dssearch = service.IPL_Data_FetchWithParam("SP_FetchData_CAE", cmd);
                gridService.DataSource = null;
                gridService.DataSource = dssearch.Tables[0].Copy();
                gridService.DataBind();
            }
            catch (Exception ex)
            {

            }


        }

        public void Chart()
        {

            DataSet ds = service.IPL_Data_Fetch("SP_Fetch_CAE_Data");

            StaticSource source = new StaticSource(ds.Tables[1].Copy());
            DataModel model = new DataModel();
            model.DataSources.Add(source);

            Charts.LineChart line = new Charts.LineChart("line_chart_db");

            line.ThemeName = FusionChartsTheme.ThemeName.FUSION;
            line.Width.Pixel(1000);
            line.Height.Pixel(400);

            line.Data.Source = model;

            line.Caption.Text = "Total Requests by Faculty";
            line.Caption.Bold = true;


            line.SubCaption.Text = "This Year";
            line.XAxis.Text = "Month";
            line.YAxis.Text = "No. of Requets";

            line.Legend.Show = false;
            line.ThemeName = FusionChartsTheme.ThemeName.FUSION;
            // Render the chart to 'Literal1' literal control
            chart.Text = line.Render();
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


            Response.Redirect("~/CAE_LOAD.aspx?Trans_Id=" + Trans_Id + "&" + "Pro_Name=" + Pro_Name + "");

            //Response.Redirect("~/CAE_LOAD.aspx?Trans_Id="+Trans_Id+"");
            //Server.Transfer("~/CAE_LOAD.aspx?Trans_Id=" + Trans_Id + "");
        }


        public void searchdata()
        {

            try
            {

                DataSet dssearch = service.IPL_Data_Fetch("SP_FetchData_CAE_NEW");
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