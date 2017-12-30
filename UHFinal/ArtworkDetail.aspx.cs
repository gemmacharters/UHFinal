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
            if (!IsPostBack)
            {
                if (!User.Identity.IsAuthenticated)
                {
                    //if no logon then cannot like artwork
                    chkLike.Visible = false;
                }
                else
                {
                    //if logged on compare logon ID with Artist User ID
                    string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["defaultConnection"].ConnectionString;
                    SqlConnection conn = new SqlConnection(connStr);
                    SqlCommand ArtistSelect = new SqlCommand("SELECT UserID FROM Artwork WHERE ArtworkID=@ArtworkID", conn);

                    //gets Artist UserID using Artwork ID from request string
                    int ArtworkID = int.Parse(Request.QueryString["ArtworkID"]);
                    ArtistSelect.Parameters.AddWithValue("ArtworkID", ArtworkID);
                    conn.Open();
                    SqlDataReader drUS = ArtistSelect.ExecuteReader();
                    drUS.Read();
                    string ArtistUserID = drUS["UserID"].ToString();
                    drUS.Close();

                    //sets logged on userId and tests to see it it is the artist
                    //Artist cannot like their own artwork
                    string userId = User.Identity.GetUserId();

                    if (userId == ArtistUserID)
                    {
                        chkLike.Visible = false;
                    }
                    else
                    {
                        //if the logged on user has already liked the artwork
                        SqlCommand LikeSelect = new SqlCommand("SELECT Id FROM Likes WHERE Likes.ArtworkID=@ArtworkID AND Likes.UserID=@LikeUserID", conn);
                        LikeSelect.Parameters.AddWithValue("LikeUserID", userId);
                        LikeSelect.Parameters.AddWithValue("ArtworkID", ArtworkID);
                        SqlDataReader drLS = LikeSelect.ExecuteReader();
                        if (drLS.HasRows)
                        {
                            chkLike.Checked = true;
                        }
                        drLS.Close();
                    }
                    conn.Close();
                }
            }
        }

        protected void chkLike_CheckedChanged(object sender, EventArgs e)
        {
            string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["defaultConnection"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            string LikesSQL = "";
            //if checked is on then add row to table Likes
            //If not checked then delete row from Likes
            if (chkLike.Checked == true)
            {
                LikesSQL = "INSERT INTO Likes(userID, ArtworkID) VALUES (@userID, @ArtworkID)";
            }
            else
            {
                LikesSQL = "DELETE FROM Likes WHERE userID=@userID AND ArtworkID=@ArtworkID";
            }
            
            SqlCommand cmdLikes = new SqlCommand(LikesSQL, conn);
            int ArtworkID = int.Parse(Request.QueryString["ArtworkID"]);
            cmdLikes.Parameters.AddWithValue("ArtworkID", ArtworkID);
            string userId = User.Identity.GetUserId();
            cmdLikes.Parameters.AddWithValue("UserID", userId);
            conn.Open();
            cmdLikes.ExecuteNonQuery();
            conn.Close();
            
            

        }
    }
}