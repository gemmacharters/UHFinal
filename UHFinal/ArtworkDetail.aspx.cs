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
            if (!User.Identity.IsAuthenticated)
            {
                //if no logon then cannot like artwork
                chkLike.Visible = false;
            }
            else
            {
                //if logged on compare logon ID with Artist User ID
                //Artist cannot like their own artwork

                string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["defaultConnection"].ConnectionString;
                SqlConnection conn = new SqlConnection(connStr);
                SqlCommand UserSelect = new SqlCommand("SELECT UserID FROM Artwork WHERE ArtworkID=@ArtworkID", conn);
                SqlCommand LikeSelect = new SqlCommand("SELECT Id FROM Likes WHERE ArtworkID=@ArtworkID AND UserID=@LikeUserID", conn);
                string userId = User.Identity.GetUserId();
                int ArtworkID = int.Parse(Request.QueryString["ArtworkID"]);
                UserSelect.Parameters.AddWithValue("ArtworkID", ArtworkID);
                LikeSelect.Parameters.AddWithValue("LikeUserID", userId);
                conn.Open();
                SqlDataReader drUS = UserSelect.ExecuteReader();
                string ArtistUserID = drUS["UserID"].ToString();

                //if the logged on user is the artist
                if (userId == ArtistUserID)
                {
                    chkLike.Visible = false;
                }
                else
                {
                    //if the logged on user has already liked the artwork
                    SqlDataReader drLS = LikeSelect.ExecuteReader();
                    if (drLS.HasRows) {
                        chkLike.Checked = true;
                    }

                }
                conn.Close();
            }  
        }

        protected void chkLike_CheckedChanged(object sender, EventArgs e)
        {
            //if checked is on then add row to table Likes
            //If not checked then delete row from Likes
        }
    }
}