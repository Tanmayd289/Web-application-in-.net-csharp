using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace St.Clair
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            RouteConfig.RegisterRoutes(RouteTable.Routes);

            BundleConfig.RegisterBundles(BundleTable.Bundles);

            //Response.Cache.SetCacheability(System.Web.HttpCacheability.NoCache);
            //Response.Cache.SetNoStore();
        }
        void Session_Start(object sender, EventArgs e)
        {
            // Code that runs when a new session is started          

            Response.Cache.SetCacheability(System.Web.HttpCacheability.NoCache);
            Response.Cache.SetNoStore();





        }
        protected void Application_PreRequestHandlerExecute(HttpApplication sender, EventArgs e)
        {
            string sExtentionOfThisFile = System.IO.Path.GetExtension(HttpContext.Current.Request.Path);

            if (sExtentionOfThisFile.EndsWith("aspx", true, System.Globalization.CultureInfo.InvariantCulture) ||
                sExtentionOfThisFile.EndsWith("ashx", true, System.Globalization.CultureInfo.InvariantCulture) ||
                sExtentionOfThisFile.EndsWith("xml", true, System.Globalization.CultureInfo.InvariantCulture)
                )
            {
                Response.Cache.SetExpires(DateTime.Now.AddSeconds(300));
                Response.Cache.SetCacheability(HttpCacheability.Public);
            }
        }
    }
}