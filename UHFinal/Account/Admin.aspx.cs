using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using UHFinal.Models;
using System.Data.SqlClient;
using Microsoft.AspNetCore.Session;
using Microsoft.Extensions.Caching;
using System.Configuration;
using System.Data;

namespace UHFinal.Account
{
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                this.BindGrid();
            }
            else
            {
                if (UserPicture.HasFile)
                {
                    UserImage.ImageUrl = "~/UserPics/" + UserPicture.FileName;
                }
            }
        }
        protected void BindGrid()
        {
            string userId = User.Identity.GetUserId();
            //getting the initial user data including profile picture

            string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["defaultConnection"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand UserSelect = new SqlCommand("SELECT AspNetUsers.Id, AspNetUsers.UserName, UserAccount.UserPicture, UserAccount.ArtistIntro" + 
                    " FROM AspNetUsers INNER JOIN UserAccount ON AspNetUsers.Id = UserAccount.UserID WHERE(AspNetUsers.Id = @userID)", conn);
            UserSelect.Parameters.AddWithValue("@userId", userId);

            
            conn.Open();
            SqlDataReader dr = UserSelect.ExecuteReader();
            dr.Read();
            ArtistIntro.Text = dr["ArtistIntro"].ToString();
            UserName.Text = dr["UserName"].ToString();
            UserImage.ImageUrl = "~/" + dr["UserPicture"].ToString();
            conn.Close();

        }
        protected void UpdateUser_Click(object sender, EventArgs e)
        {
            string userId = User.Identity.GetUserId();
            string fileUp = UserPicture.FileName;
            string ArtworkFolder = Server.MapPath("/UserPics");
            if (UserPicture.HasFile)
            {
                try
                {
                    UserPicture.SaveAs(ArtworkFolder + "/" + fileUp);
                }
                catch (Exception ex)
                {
                    lblError.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
                }
            }
            string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["defaultConnection"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand update = new SqlCommand("UPDATE userAccount SET UserPicture=@UserPicture, ArtistIntro=@UserIntro " +
                    "WHERE UserID=@userId", conn);
            
            update.Parameters.AddWithValue("@UserPicture", "UserPics/" + UserPicture.FileName);
            update.Parameters.AddWithValue("@UserIntro", ArtistIntro.Text);
            update.Parameters.AddWithValue("@userID", userId);
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