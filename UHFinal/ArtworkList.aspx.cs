using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UHFinal
{
    public partial class ArtworkList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtSearch.Text = "";
            SqlDataSource2.FilterExpression = null;
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {

        }
    }
}