using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace St.Clair
{
    public partial class Request_Form : System.Web.UI.Page
    {
        Service.IPL_COMMService service = new Service.IPL_COMMService();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                object[] cmd = new object[1];
                cmd[0] = Convert.ToInt16(2);
                DataSet dssearch = service.IPL_Data_FetchWithParam("SP_Fetch_Request_NEW", cmd);
                gridService.DataSource = null;
                gridService.DataSource = dssearch.Tables[0].Copy();
                gridService.DataBind();
            }
        }

        protected void Btn_Search_Click(object sender, EventArgs e)
        {
            try
            {               
                object[] cmd = new object[3];
                cmd[0] = Txt_From.Text.ToString();
                cmd[1] = txt_To.Text.ToString();
                cmd[2] = Convert.ToInt16(2);
                DataSet dssearch = service.IPL_Data_FetchWithParam("SP_Fetch_Request", cmd);
                gridService.DataSource = null;
                gridService.DataSource = dssearch.Tables[0].Copy();
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
    }
}