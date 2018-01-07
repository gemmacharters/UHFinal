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
    public partial class PostList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                if (User.IsInRole("AA") || User.IsInRole("UA"))
                {
                    //do nothing
                }
                else
                {
                    txtPostComment.Visible = false;
                    btnPost.Visible = false;
                    lblAccess.Text = "You need to be an approved Artist or User before adding posts. Check with the administrator";

                }
            }
        }
        protected void btnPost_Click(object sender, EventArgs e)
        {
            if(txtPostComment.Text != "")
            {
                string userId = User.Identity.GetUserId();
                int ThreadID = int.Parse(Request.QueryString["ThreadID"]);

                string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["defaultConnection"].ConnectionString;
                SqlConnection conn = new SqlConnection(connStr);
                SqlCommand PostInsert = new SqlCommand("insert into Post(ThreadID, PostUserID, PostComment, PostApproved, PostAdded) " +
                    "values(@ThreadID, @PostUserID, @PostComment, 1, @PostAdded)", conn);

                PostInsert.Parameters.AddWithValue("@ThreadID", ThreadID);
                PostInsert.Parameters.AddWithValue("@PostUserID", userId);
                PostInsert.Parameters.AddWithValue("@PostComment", txtPostComment.Text);
                PostInsert.Parameters.AddWithValue("@PostAdded", DateTime.Now);
                try
                {
                    conn.Open();
                    PostInsert.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    lblError.Text = "Error: " + ex.Message;
                    conn.Close();
                }
                Response.Redirect("PostList.aspx?ThreadID=" + ThreadID);
            } else
            {
                lblError.Text = "You must add text before posting";
            }

        }
    }
}