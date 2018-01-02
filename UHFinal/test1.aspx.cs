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
    public partial class test1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnsave_Click(object sender, EventArgs e)
        {
            string ArtworkFolder = Server.MapPath("~/Artwork/");
            
            if (Fup1.HasFile)
            {
                try
                {
                    Fup1.PostedFile.SaveAs(ArtworkFolder + Fup1.FileName);
                }
                catch (Exception ex)
                {
                    lblError.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
                    return;
                }
                string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["defaultConnection"].ConnectionString;
                SqlConnection conn = new SqlConnection(connStr);
                SqlCommand artworkInsert = new SqlCommand("insert into test(picture) values(@pic) SELECT SCOPE_IDENTITY()", conn);
                artworkInsert.Parameters.AddWithValue("@Pic", "Artwork/" + Fup1.FileName);
                try
                {
                    conn.Open();
                    object returnObj = artworkInsert.ExecuteScalar();
                    int newid = -1;
                    if (returnObj != null)
                    {
                        int.TryParse(returnObj.ToString(), out newid);
                    }
                    lblError.Text = "Artwork Added " + newid;
                    SqlCommand testView = new SqlCommand("select picture from test where Id = @newId", conn);
                    testView.Parameters.AddWithValue("@newId", newid);
                    object returnsel = testView.ExecuteNonQuery();
                    conn.Close();
                }
                catch (Exception ex)
                {
                    lblError.Text = "Error: " + ex.Message;
                    conn.Close();
                }
            }
        }
    }
} 