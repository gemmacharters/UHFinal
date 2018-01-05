using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using UHFinal.Models;
using System.Data.SqlClient;

namespace UHFinal.Account
{
    public partial class Register : Page
    {
        protected void CreateUser_Click(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var signInManager = Context.GetOwinContext().Get<ApplicationSignInManager>();
            var user = new ApplicationUser() { UserName = UserName.Text, Email = Email.Text };
            IdentityResult result = manager.Create(user, Password.Text);
            if (result.Succeeded)
            {
                Session["UserId"] = user.Id.ToString();
                //Insert a UserAccount record to save the additional details.
                //Also sets the userStatus. AP or UP, Artist Pending or User Pending
                string fileUp = UserPicture.FileName;
                string UserFolder = Server.MapPath(path: "~/UserPics/");
                if (UserPicture.HasFile)
                {
                    try
                    {
                        UserPicture.PostedFile.SaveAs(UserFolder + UserPicture.FileName);

                    }
                    catch (Exception ex)
                    {
                        lblError.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
                        return;
                    }
                }
                // There are two main types of user, the artists and the general users. They are assigned pending roles
                //The administrator then approves them
                String ArtistUser = "";
                if (userStatus.Checked == true)
                {
                    ArtistUser = "AP";
                }
                else
                {
                    ArtistUser = "UP";
                }
                
                string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["defaultConnection"].ConnectionString;
                SqlConnection conn = new SqlConnection(connStr);
                SqlCommand insert = new SqlCommand("insert into userAccount(UserID, userStatus, UserPicture, ArtistIntro) " +
                    "values(@userId, @userStatus, @UserPicture, @UserIntro)", conn);
                
                SqlCommand insert2 = new SqlCommand("insert into AspNetUserRoles(UserId, RoleId) values(@userId, @userStatus)", conn);
                insert.Parameters.AddWithValue("@userId", user.Id);
                insert.Parameters.AddWithValue("@userStatus", ArtistUser);
                insert2.Parameters.AddWithValue("@userId", user.Id);
                insert2.Parameters.AddWithValue("@userStatus", ArtistUser);
                insert.Parameters.AddWithValue("@UserPicture", "UserPics/" + UserPicture.FileName);
                insert.Parameters.AddWithValue("@UserIntro", ArtistIntro.Text);

                try
                {
                    conn.Open();
                    object returnObj = insert.ExecuteNonQuery();
                    object returnObj2 = insert2.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    lblError.Text = "Error: " + ex.Message;
                    return;
                }
                conn.Close();



                signInManager.SignIn(user, isPersistent: false, rememberBrowser: false);
                IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);

                }

            else 
            {
                ErrorMessage.Text = result.Errors.FirstOrDefault();
            }
            
        }
    }
}