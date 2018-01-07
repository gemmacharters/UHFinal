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
    
    <div style="padding:5px">
        <img src="images/list5.png" alt="banner" style="width:100%;height:auto;"/>
    </div>

    <div class="row" style="padding:10px" >
        <div class="col-md-4" >
            <h2>Manage Portfolio</h2>
            <p>To edit or delete existing artwork please use the grid to the right. You can only change the name and description. 
                If you want to add new artwork then click below.  You may only have 10 pieces of artwork, so delete artwork that you no longer
                want to display.  When deleting artwork all comments will be deleted as well.
            </p>
            <asp:Label ID="lblCount" runat="server" Text=""></asp:Label>
            <asp:Button ID="btnAdd" runat="server" Text="Add Artwork" Visible="False" OnClick="btnAdd_Click"/>
            <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
        </div>
        <div class="col-md-8" >
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" DataKeyNames="ArtworkID" OnPageIndexChanging="GridView1_PageIndexChanging" 
                OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" 
                OnRowUpdating="GridView1_RowUpdating" Width="100%" CellPadding="10" CellSpacing="5">  
                    <Columns>
                        <asp:BoundField DataField="ArtworkID" HeaderText="Artwork ID" Visible="False" />
                        <asp:BoundField DataField="ArtName" HeaderText="Artwork Name" />  
                        <asp:BoundField DataField="ArtDescription" HeaderText="Description" />  
                        <asp:BoundField DataField="ArtworkPicture" HeaderText="Picture File" />  
                        <asp:BoundField DataField="CategoryName" HeaderText="Category" />  
                        <asp:CommandField ShowEditButton="true" />  
                        <asp:CommandField ShowDeleteButton="true" /> </Columns>  
                </asp:GridView> 

        </div>
    </div>

</asp:Content>
