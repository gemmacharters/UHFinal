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

namespace UHFinal
{
    public partial class Portfolio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string userId = User.Identity.GetUserId();
                string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["defaultConnection"].ConnectionString;
                SqlConnection conn = new SqlConnection(connStr);
                SqlCommand countArt = new SqlCommand("SELECT count(ArtworkID) as ArtworkCount FROM Artwork WHERE UserID = @UserID", conn);
                countArt.Parameters.AddWithValue("UserID", userId);
                try
                {
                    conn.Open();
                    SqlDataReader dr = countArt.ExecuteReader();
                    dr.Read();
                    int CountofArtwork = Convert.ToInt16(dr["ArtworkCount"]);
                    lblCount.Text = "You have " + CountofArtwork + "Pieces of artwork uploaded";
                    if (CountofArtwork == 10)
                    {
                        lblCount.Text = lblCount.Text + ", You cannot add any more unless you delete an existing record from the list on the right.";

                    }
                    else btnAdd.Visible = true;
                }
                catch (Exception ex)
                {
                    lblError.Text = "Error: " + ex.Message;
                }
                conn.Close();

                gvbind();
            }
        }

        protected void gvbind()
        {
            string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["defaultConnection"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand("SELECT Artwork.ArtworkID, Artwork.ArtName, Artwork.ArtDescription, Artwork.ArtworkPicture, Category.CategoryName, Artwork.UserID FROM Artwork INNER JOIN Category ON Artwork.CategoryID = Category.CategoryID WHERE Artwork.UserID = @UserID", conn);
            string userId = User.Identity.GetUserId();
            cmd.Parameters.AddWithValue("UserID", userId);
            conn.Open();

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            conn.Close();
            if (ds.Tables[0].Rows.Count > 0)
            {
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }
            else
            {
                ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
                GridView1.DataSource = ds;
                GridView1.DataBind();
                int columncount = GridView1.Rows[0].Cells.Count;
                GridView1.Rows[0].Cells.Clear();
                GridView1.Rows[0].Cells.Add(new TableCell());
                GridView1.Rows[0].Cells[0].ColumnSpan = columncount;
                GridView1.Rows[0].Cells[0].Text = "No Records Found";
            }
        }
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["defaultConnection"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
            Label lbldeleteid = (Label)row.FindControl("lblID");
            conn.Open();
            SqlCommand delArtwork = new SqlCommand("delete FROM Artwork where ArtworkID='" + Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString()) + "'", conn);
            delArtwork.ExecuteNonQuery();
            
            conn.Close();
            gvbind();
        }
        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["defaultConnection"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            GridView1.EditIndex = e.NewEditIndex;
            gvbind();
        }
        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["defaultConnection"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            int Artworkid = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
            GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
            Label lblID = (Label)row.FindControl("lblID");
              
            TextBox txtArtName = (TextBox)row.Cells[1].Controls[0];
            TextBox txtArtDescription = (TextBox)row.Cells[2].Controls[0];
            TextBox textc = (TextBox)row.Cells[2].Controls[0];
             
            GridView1.EditIndex = -1;
            conn.Open();
              
            SqlCommand cmd = new SqlCommand("update Artwork set ArtName='" + txtArtName.Text + "',ArtDescription='" + txtArtDescription.Text + "' where ArtworkID='" + Artworkid + "'", conn);
            cmd.ExecuteNonQuery();
            conn.Close();
            gvbind();
              
        }
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            gvbind();
        }
        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            gvbind();
        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddArtwork.aspx");
        }
    }
}