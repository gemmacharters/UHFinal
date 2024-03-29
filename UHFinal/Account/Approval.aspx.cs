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
            SqlCommand UserSelect = new SqlCommand("SELECT AspNetUsers.Id, AspNetUsers.UserName, UserAccount.UserID, UserAccount.UserPicture, UserAccount.userStatus, UserAccount.ArtistIntro" +
                    " FROM AspNetUsers INNER JOIN UserAccount ON AspNetUsers.Id = UserAccount.UserID WHERE(UserAccount.userStatus = 'AP' OR UserAccount.userStatus = 'UP')", conn);
            
            using (SqlDataAdapter sda = new SqlDataAdapter())
            {
                sda.SelectCommand = UserSelect;
                conn.Open();
                
                
                {
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        if (dt.Rows.Count != 0)
                        {
                            gvUsers.DataSource = dt;
                            gvUsers.DataBind();
                        }
                        else
                        {
                            NoUsers.Visible = true;
                            Approve.Visible = false;
                        }
                    }
                }
                
            }
        }

        protected void Approve_Click(object sender, EventArgs e)
        {
            string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["defaultConnection"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand update = new SqlCommand("UPDATE userAccount SET userStatus=@UserStatus WHERE UserID=@userId", conn);
            SqlCommand update2 = new SqlCommand("UPDATE AspNetUserRoles SET RoleId=@UserStatus WHERE UserID=@userId", conn);
            //loop through the gridview to see if check box is selected
            //then update the status of the user

            foreach (GridViewRow row in gvUsers.Rows)
            {
                HiddenField hdUserID = (HiddenField)row.FindControl("UserID");
                String userID = hdUserID.Value.ToString();
                var chk = (CheckBox)row.FindControl("ApproveUser");
                var status = row.Cells[3].Text;
                

                if (chk != null && chk.Checked)
                {
                    update.Parameters.AddWithValue("@userId", userID);
                    update2.Parameters.AddWithValue("@userId", userID);
                    if (status == "AP") { status = "AA"; }
                    else { status = "UA"; }

                    update.Parameters.AddWithValue("@UserStatus", status);
                    update2.Parameters.AddWithValue("@UserStatus", status);
                    try
                    {
                        conn.Open();
                        object returnObj = update.ExecuteNonQuery();
                        object returnObj2 = update2.ExecuteNonQuery();
                        conn.Close();
                        Response.Redirect("Approval.aspx");
                    }
                    catch (Exception ex)
                    {
                        lblError.Text = "Error: " + ex.Message;
                        lblError.Visible = true;
                        conn.Close();
                    }
                    
                }
            }
        }
        protected void Delete_Click(object sender, EventArgs e)
        {
            string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["defaultConnection"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand delete = new SqlCommand("DELETE FROM userAccount  WHERE UserID=@userId", conn);
            SqlCommand delete2 = new SqlCommand("DELETE FROM AspNetUserRoles WHERE UserID=@userId", conn);
            SqlCommand delete3 = new SqlCommand("DELETE FROM AspNetUsers WHERE Id=@userId", conn);
            //loop through the gridview to see if check box is selected
            //then update the status of the user

            foreach (GridViewRow row in gvUsers.Rows)
            {
                HiddenField hdUserID = (HiddenField)row.FindControl("UserID");
                String userID = hdUserID.Value.ToString();
                var chk = (CheckBox)row.FindControl("ApproveUser");
                var status = row.Cells[3].Text;


                if (chk != null && chk.Checked)
                {
                    delete.Parameters.AddWithValue("@userId", userID);
                    delete2.Parameters.AddWithValue("@userId", userID);
                    delete3.Parameters.AddWithValue("@userId", userID);

                    try
                    {
                        conn.Open();
                        object returnObj = delete.ExecuteNonQuery();
                        object returnObj2 = delete2.ExecuteNonQuery();
                        object returnObj3 = delete3.ExecuteNonQuery();
                        conn.Close();
                        Response.Redirect("Approval.aspx");
                    }
                    catch (Exception ex)
                    {
                        lblError.Text = "Error: " + ex.Message;
                        lblError.Visible = true;
                        conn.Close();
                    }

                }
            }
        }
    }
}