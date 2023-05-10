using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace St.Clair
{
    public class Class1
    {

        public static Service.IPL_COMMService WebServiceMaster = new Service.IPL_COMMService();

        // public static HHTLGService.HHTServiceMaster WebServiceMaster = new HHTLGService.HHTServiceMaster(clsLocalDB.WebIP);

        public static void SetConnection(string serviceURL)
        {
            WebServiceMaster.Url = serviceURL;

        }

        public static System.Data.DataSet ExecuteDataset(string sqlQuery)
        {
            //return "0";
            return WebServiceMaster.IPL_Data_Fetch(sqlQuery);
        }
        public static System.Data.DataSet ExecuteDataset(string sqlQuery, params object[] Parameters)
        {
            //return "0";
            return WebServiceMaster.IPL_Data_FetchWithParam(sqlQuery, Parameters);
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="sqlQuery"></param>
        /// <param name="UserID"></param>
        /// <param name="Parameters"></param>
        /// <returns></returns>
        public static bool Insert_ExecuteNonQuery(string sqlQuery, int UserID, params object[] Parameters)
        {
            //return "0";
            return WebServiceMaster.IPL_Data_Insert(sqlQuery, UserID, Parameters);

        }

        public static bool Insert_ExecuteNonQuery(string sqlQuery, params object[] Parameters)
        {
            //return "0";
            try
            {
                WebServiceMaster.IPL_Data_FetchWithParam(sqlQuery, Parameters);
                return true;
            }
            catch
            {
                return false;
            }

        }

        public static bool Insert_ExecuteNonQuery_DT(string sqlQuery, int UserID, DataTable dtVendorPOTranDetail, params object[] Parameters)
        {
            //return "0";
            //System.IO.MemoryStream DetXML = new System.IO.MemoryStream();
            //dtVendorPOTranDetail.WriteXml(DetXML);
            //string DetStr = Encoding.UTF8.GetString(DetXML.GetBuffer(), 0, (int)DetXML.Length);

            //Parameters[Parameters.Length - 1] = DetStr;
            return WebServiceMaster.IPL_Data_Insert_DT(sqlQuery, UserID, dtVendorPOTranDetail, Parameters);
        }

        public static object Insert_ExecuteNonQuery_Out(string sqlQuery, int UserID, params object[] Parameters)
        {
            //return "0";
            //object ReturnedID=0;
            return WebServiceMaster.IPL_Data_Insert_Out(sqlQuery, UserID, Parameters);
        }
        public static bool Update_ExecuteNonQuery(string sqlQuery, int UserID, params object[] Parameters)
        {
            //return "0";
            return WebServiceMaster.IPL_Data_Update(sqlQuery, UserID, Parameters);
        }
        public static bool Delete_ExecuteNonQuery(string sqlQuery, int UserID, params object[] Parameters)
        {
            //return "0";
            return WebServiceMaster.IPL_Data_Delete(sqlQuery, UserID, Parameters);
        }

        public static object ExecuteScalar(string strSP)
        {

            //return "0";
            return WebServiceMaster.IPL_ExecuteScaler(strSP);
        }

        public static object ExecuteScalar(string strSP, params object[] Parameters)
        {
            //return "0";
            return WebServiceMaster.IPL_ExecuteScalerWithParam(strSP, Parameters);
        }

        public static bool IPL_Data_UpdateToCIT_ID(int RecId)
        {
            //return "0";
            return WebServiceMaster.IPL_Data_UpdateToCIT_ID(Service.CIT_InboundType.CIT_GRNMapping, RecId);
        }
    }
}