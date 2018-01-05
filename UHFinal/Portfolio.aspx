<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Portfolio.aspx.cs" Inherits="UHFinal.Portfolio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
    .imgScale {
        width: 100px; /* You can set the dimensions to whatever you want */
        height: 100px;
        object-fit: cover;
        padding: 5px;
        border: 2px solid lightgray;
    }
    </style>
    <asp:SqlDataSource ID="SqlArtwork" runat="server" ConnectionString="<%$ ConnectionStrings:defaultConnection %>" 
            SelectCommand="SELECT Artwork.ArtworkID, Artwork.ArtName, Artwork.ArtDescription, Artwork.ArtworkPicture, Category.CategoryName, Artwork.UserID FROM Artwork INNER JOIN Category ON Artwork.CategoryID = Category.CategoryID WHERE Artwork.UserID = @UserID">
        <SelectParameters>
            <asp:QueryStringParameter Name="UserID" QueryStringField="UserID" />
        </SelectParameters>
    </asp:SqlDataSource>
    <div style="padding:5px">
        <img src="images/list5.png" alt="banner" style="width:100%;height:auto;"/>
    </div>

    <div class="row" style="padding:10px" >
        <div class="col-md-4" >

        </div>
        <div class="col-md-8" >
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" DataKeyNames="ArtworkID" OnPageIndexChanging="GridView1_PageIndexChanging" 
                OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" 
                OnRowUpdating="GridView1_RowUpdating">  
                    <Columns>
                        <asp:BoundField DataField="ArtworkID" HeaderText="Artwork ID" Visible="False" />
                        <asp:BoundField DataField="ArtName" HeaderText="Artwork Name" />  
                        <asp:BoundField DataField="ArtDescription" HeaderText="Description" />  
                        <asp:BoundField DataField="ArtworkPicture" HeaderText="Picture Name" />  
                        <asp:BoundField DataField="CategoryName" HeaderText="Category" />  
                        <asp:CommandField ShowEditButton="true" />  
                        <asp:CommandField ShowDeleteButton="true" /> </Columns>  
                </asp:GridView> 

        </div>
    </div>

</asp:Content>
