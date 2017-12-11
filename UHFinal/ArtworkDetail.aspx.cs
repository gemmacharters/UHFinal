using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using Microsoft.AspNet.Identity;
using Microsoft.AspNetCore.Session;
using Microsoft.Extensions.Caching;

namespace UHFinal
{
    public partial class ArtworkDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Write(Request.QueryString["ArtworkID"]);
        }
    }
}