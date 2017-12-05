using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using Microsoft.AspNet.Identity;

namespace UHFinal
{
    public partial class AddArtwork : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string fileUp = fupArtwork.FileName;
            string ArtworkFolder = Server.MapPath("/Artwork");
            string userId = Session["UserID"].ToString();
            if (fupArtwork.HasFile)
            {
                try
                {
                    fupArtwork.SaveAs(ArtworkFolder + "/" + fileUp);

                }
                catch (Exception ex)
                {
                    lblError.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
                }
            }


            string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["defaultConnection"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand insert = new SqlCommand("insert into Artwork(ArtName, ArtDescription, ArtworkPicture, UserID, CategoryID, LikesCount, UploadDate) " +
                "values(@ArtName, @ArtDescription, @ArtworkPicture, @UserID, @CategoryID, 0, @UploadDate) SELECT SCOPE_IDENTITY()", conn);
            insert.Parameters.AddWithValue("@ArtName", txtArtName.Text);
            insert.Parameters.AddWithValue("@ArtDescription", txtArtDesc.Text);
            insert.Parameters.AddWithValue("@ArtworkPicture", "Artwork/" + fupArtwork.FileName);
            insert.Parameters.AddWithValue("@CategoryID", int.Parse(txtCategoryID.Text));
            insert.Parameters.AddWithValue("@UploadDate", DateTime.Now);
            insert.Parameters.AddWithValue("@userID", userId);
            try
            {
                conn.Open();
                object returnObj = insert.ExecuteScalar();

                int newid = -1;
                if (returnObj != null)
                {
                    int.TryParse(returnObj.ToString(), out newid);
                }
                lblError.Text = "Artwork Added " + newid;
                Response.Redirect("~/ArtworkDetail.aspx?ArtworkID=" + newid);

            }
            catch (Exception ex)
            {
                lblError.Text = "Error: " + ex.Message;

                conn.Close();
            }
        }
    }
}