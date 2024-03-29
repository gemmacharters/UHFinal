﻿using System;
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
    public partial class ThreadList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!this.IsPostBack)
            {
                if (User.IsInRole("AA") || User.IsInRole("UA"))
                {
                    this.BindGrid();
                }
                else
                {
                    gvThreads.Visible = false;
                    lblAccess.Text = "You need to be an approved Artist or User before viewing threads. Check with the administrator";

                }
            }
        }

        protected void BindGrid()
        {
            //Selecting threads to display, using a left join so that a row is returned for all threads but
            //if the thread is linked to an artwork, the picture is also returned.
            string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["defaultConnection"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand ThreadSelect = new SqlCommand("SELECT Thread.Id, Thread.Title, Thread.ThreadComment, AspNetUsers.UserName, Thread.ArtworkID, " + 
                "Thread.UserID, Artwork.ArtworkPicture FROM Thread INNER JOIN AspNetUsers ON Thread.UserID = AspNetUsers.Id " + 
                "LEFT OUTER JOIN Artwork ON Thread.ArtworkID = Artwork.ArtworkID AND AspNetUsers.Id = Artwork.UserID", conn);

            using (SqlDataAdapter sda = new SqlDataAdapter())
            {
                sda.SelectCommand = ThreadSelect;
                conn.Open();
                object returnObj = ThreadSelect.ExecuteNonQuery();
                using (DataTable dt = new DataTable())
                {
                    sda.Fill(dt);
                    gvThreads.DataSource = dt;
                    gvThreads.DataBind();
                }
                conn.Close();
            } 
        }
    }
}