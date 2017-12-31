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
using System.Configuration;
using System.Data;

namespace UHFinal.Account
{
    public partial class Approval : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                this.BindGrid();
            }
        }

        protected void BindGrid()
        {
            //Selecting pending users so that the admin person can approve them..
            string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["defaultConnection"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand UserSelect = new SqlCommand("SELECT AspNetUsers.Id, AspNetUsers.UserName, UserAccount.UserPicture, UserAccount.userStatus, UserAccount.ArtistIntro" +
                    " FROM AspNetUsers INNER JOIN UserAccount ON AspNetUsers.Id = UserAccount.UserID WHERE(UserAccount.userStatus = 'AP' OR UserAccount.userStatus = 'UP')", conn);
            
            using (SqlDataAdapter sda = new SqlDataAdapter())
            {
                sda.SelectCommand = UserSelect;
                conn.Open();
                object returnObj = UserSelect.ExecuteNonQuery();
                using (DataTable dt = new DataTable())
                {
                    sda.Fill(dt);
                    gvUsers.DataSource = dt;
                    gvUsers.DataBind();
                }
            }
        }

        protected void Approve_Click(object sender, EventArgs e)
        {
            string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["defaultConnection"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand update = new SqlCommand("UPDATE userAccount SET userStatus=@UserStatus WHERE UserID=@userId", conn);

            //loop through the gridview to see if check box is selected
            //then update the status of the user

            foreach (GridViewRow row in gvUsers.Rows)
            {
                var userID = row.Cells[0];
                var chk = (CheckBox)row.FindControl("ApproveUser");
                var status = row.Cells[3].ToString();

                if (chk != null && chk.Checked)
                {
                    update.Parameters.AddWithValue("@userId", userID);
                    if (status == "AP") { status = "AA"; }
                    else { status = "UA"; }

                    update.Parameters.AddWithValue("@UserStatus", status);
                    try
                    {
                        conn.Open();
                        object returnObj = update.ExecuteNonQuery();
                    }
                    catch (Exception ex)
                    {
                        lblError.Text = "Error: " + ex.Message;
                    }
                    conn.Close();
                }
            }
        }
    }
}