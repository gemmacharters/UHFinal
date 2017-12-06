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
            SqlCommand artworkInsert = new SqlCommand("insert into Artwork(ArtName, ArtDescription, ArtworkPicture, UserID, CategoryID, LikesCount, UploadDate) " +
                "values(@ArtName, @ArtDescription, @ArtworkPicture, @UserID, @CategoryID, 0, @UploadDate) SELECT SCOPE_IDENTITY()", conn);
            SqlCommand hashtagInsert = new SqlCommand("insert into ARHashtag (ArtworkID, HID) values(@ArtworkID, @HID", conn);
            artworkInsert.Parameters.AddWithValue("@ArtName", txtArtName.Text);
            artworkInsert.Parameters.AddWithValue("@ArtDescription", txtArtDesc.Text);
            artworkInsert.Parameters.AddWithValue("@ArtworkPicture", "Artwork/" + fupArtwork.FileName);
            artworkInsert.Parameters.AddWithValue("@CategoryID", lstCategory.SelectedValue);
            artworkInsert.Parameters.AddWithValue("@UploadDate", DateTime.Now);
            artworkInsert.Parameters.AddWithValue("@userID", userId);
            try
            {
                conn.Open();
                object returnObj = artworkInsert.ExecuteScalar();

                int newid = -1;
                if (returnObj != null)
                {
                    int.TryParse(returnObj.ToString(), out newid);
                    //add hashtags
                    hashtagInsert.Parameters.AddWithValue("@ArtworkID", newid);
                    int i = 0;
                    for (i = 0; i <= chkHashtag.Items.Count - 1; i++)
                    {
                        if (chkHashtag. = true)
                        {
                            inputvalue = CheckBoxList1.Items[I].Text;
                            qry = "INSERT INTO ItemsTable (itemnames) VALUES ('" + inputvalue + "')";
                            SqlCommand cmd = new SqlCommand(qry, conn);
                            cmd.ExecuteNonQuery();

                        }
                    }
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