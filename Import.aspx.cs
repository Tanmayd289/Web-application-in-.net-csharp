using DocumentFormat.OpenXml.Spreadsheet;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.OleDb;
using System.IO;
using System.Linq;
using System.Net;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace St.Clair
{
    public partial class Import : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FIllDropdown();
            }

        }

        protected void ddlFileName_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void BtnExlFile_Click(object sender, EventArgs e)
        {

        }

        protected void BtnCSVFile_Click(object sender, EventArgs e)
        {

        }

        protected void BtnShowTab_Click(object sender, EventArgs e)
        {

        }

        protected void ddlSheetTabName_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void BtnImport_Click(object sender, EventArgs e)
        {
            try
            {

                if (FileUpload1.FileName == "")
                {
                    string Messa = "Please select the Valid File";
                    Message(Messa);
                }
                else if (System.IO.Path.GetExtension(FileUpload1.FileName).ToLower() != ".xls" && System.IO.Path.GetExtension(FileUpload1.FileName).ToLower() != ".xlsx")
                {
                    string Messa = "Please select the Valid File";
                    Message(Messa);
                }
                else
                {
                    //Refreshdata();

                    if (FileUpload1.HasFile)
                    {
                        //string filePath, fileName;
                        if (FileUpload1.PostedFile != null)
                        {
                            FileInfo fL1 = new FileInfo(FileUpload1.FileName);
                            //Label2.Text = FileUpload1.FileName.ToString();
                            string fileExt = fL1.Extension.ToString();
                            FileUpload1.SaveAs(Server.MapPath("ImportFile\\" + FileUpload1.FileName + " "));
                            string Path = Server.MapPath("ImportFile\\" + FileUpload1.FileName + " ");

                            if (fileExt.ToUpper() == ".XLS" || fileExt.ToUpper() == ".XLSX") //|| fileExt.ToUpper() == ".CSV"
                            {
                                DataSet DTNEW = ConvertExcelToDataTable(Path);
                                ViewState["CurrentTable"] = DTNEW.Tables[0].Copy();
                                ViewState["CurrentTable1"] = DTNEW.Tables[1].Copy();
                                GridView2.DataSource = DTNEW.Tables[0].Copy();
                                GridView2.DataBind();

                               DataTable dataTable = DTNEW.Tables[1].Rows.Cast<DataRow>()
                                    .Where(row => !row.ItemArray.All(field => field is DBNull || string.IsNullOrWhiteSpace(field as string)))
                                    .CopyToDataTable();

                                GridView1.DataSource = dataTable;
                                GridView1.DataBind();
                                GridView1.Columns[0].HeaderStyle.Width = 25;
                            }
                            else
                            {
                            }


                        }

                    }
                    else
                    {

                    }

                   
                }
            }
            catch (Exception ex)
            {
                // lblmsg.Text = ex.Message.ToString();

            }
        }

        protected void BtnSave_Click(object sender, EventArgs e)
        {
            try
            {
                if (GridView1.Rows.Count > 0 && GridView2.Rows.Count > 0)
                {
                    DataTable dt = ViewState["CurrentTable"] as DataTable;
                    DataSet ds = new DataSet();
                    ds.Tables.Add(dt);
                    string XMl = ds.GetXml();


                    DataTable dt1 = ViewState["CurrentTable1"] as DataTable;
                    DataSet ds1 = new DataSet();
                    ds1.Tables.Add(dt1);
                    string XMl1 = ds1.GetXml();



                    object[] Para = new object[2];
                    Para[0] = XMl;
                    Para[1] = XMl1;
                    DataSet dsinsert = new DataSet();
                    try
                    {
                        dsinsert = Class1.WebServiceMaster.IPL_Data_FetchWithParam("SP_Import_Master_DATA", Para);

                        // DataSet Saveed = IPL_Commservice.IPL_Data_FetchWithParam("SP_Fetch_Master_DATA", Para);

                        if (dsinsert.Tables[2].Rows[0][0].ToString() == "Success")
                        {
                            //Mailsent();
                            string message = "The Data has been saved !!";
                            Message(message);
                            //System.Text.StringBuilder sb = new System.Text.StringBuilder();
                            //sb.Append("<script type = 'text/javascript'>");
                            //sb.Append("window.onload=function(){");
                            //sb.Append("alert('");
                            //sb.Append(message);
                            //sb.Append("')};");
                            //sb.Append("</script>");
                            //ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
                            //Session.Abandon();
                            //Session.Remove("username");
                            //Session.Remove("password");
                            //Response.Redirect("~/Registration.aspx",true);
                            GridView1.DataSource = null;
                            GridView1.DataBind();
                            GridView2.DataSource = null;
                            GridView2.DataBind();

                        }
                    }
                    catch { }
                }
                else
                {
                    string Messa = "Please try the Process again.!!";
                    Message(Messa);
                }

            }
            catch (Exception ex)
            {

            }




        }

        public void FIllDropdown()
        {
            //ddlFileName.Items.Insert(0, new ListItem("--Select File Name--", "0"));
            //ddlFileName.Items.Insert(1, new ListItem("CourseData", "10"));
            //ddlFileName.SelectedIndex = 0;
        }

        public static DataSet ConvertExcelToDataTable(string FileName)
        {
            DataSet dtResult = null;
            try
            {

                DataTable dtResult_New = null;
                int totalSheet = 0; //No of sheets on excel file  
                using (OleDbConnection objConn = new OleDbConnection(@"Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + FileName + ";Extended Properties='Excel 12.0;HDR=YES;IMEX=1;';"))
                {
                    objConn.Open();
                    OleDbCommand cmd = new OleDbCommand();
                    OleDbDataAdapter oleda = new OleDbDataAdapter();
                    DataSet ds = new DataSet();
                    DataTable dt = objConn.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null);
                    string sheetName = string.Empty;

                    for (int i = 0; i <= dt.Rows.Count; i++)
                    {
                        if (dt != null)
                        {
                            var tempDataTable = (from dataRow in dt.AsEnumerable()
                                                 where !dataRow["TABLE_NAME"].ToString().Contains("FilterDatabase")
                                                 select dataRow).CopyToDataTable();
                            dt = tempDataTable;
                            totalSheet = dt.Rows.Count;
                            sheetName = dt.Rows[i]["TABLE_NAME"].ToString();
                        }

                        cmd.Connection = objConn;
                        cmd.CommandType = CommandType.Text;
                        cmd.CommandText = "SELECT * FROM [" + sheetName + "]";
                        oleda = new OleDbDataAdapter(cmd);
                        oleda.Fill(ds, "excelData" + i.ToString());
                        if (dtResult == null)
                        {
                            dtResult = ds.Copy();
                        }
                        else
                        {
                            dtResult.Tables.Add(ds.Tables[0].Copy());

                        }

                        ds.Reset();
                    }
                    objConn.Close();
                    //Returning Dattable  
                }
            }
            catch (Exception ex)
            {

            }
            return dtResult;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Registration.aspx", false);
            //Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
            //Response.Cache.SetCacheability(HttpCacheability.NoCache);
            //Response.Cache.SetNoStore();
        }


        public void Download()
        {
            try
            {
                String FileData = ConfigurationManager.AppSettings["FilePath"].ToString();
                if (FileData != string.Empty)
                {
                    WebClient req = new WebClient();
                    HttpResponse response = HttpContext.Current.Response;
                    string filePath = FileData;
                    response.Clear();
                    response.ClearContent();
                    response.ClearHeaders();
                    response.Buffer = true;
                    response.AppendHeader("content-disposition", "attachment; filename=" + "CMP_TEMPLATES.xlsx");
                    //response.AddHeader("Content-Disposition", "attachment;filename=Filename.extension");

                    byte[] data = req.DownloadData(filePath);
                    response.BinaryWrite(data);
                    response.End();
                }
            }
            catch (Exception ex)
            {

            }

        }

        protected void Btn_Download_Click(object sender, EventArgs e)
        {
            Download();
        }

        public void Message(string Message)
        {
            string message = Message;
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
}
