<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddArtwork.aspx.cs" Inherits="UHFinal.AddArtwork" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <p class="lead" style="clear:both">Add Artwork. Please use the form below to add your artwork. The description should reflect some of the ideas you wish to express. </p>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT AspNetUsers.Id, AspNetUsers.UserName, UserAccount.UserPicture FROM UserAccount INNER JOIN AspNetUsers ON UserAccount.UserID = AspNetUsers.Id WHERE AspNetUsers.Id = @userID">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="" Name="userID" SessionField="UserID" />
            </SelectParameters>
    </asp:SqlDataSource>
    <div class="row">

                <asp:Textbox runat="server" DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
                <img src='<%# Eval("UserPicture") %>'  alt="Artist Picture" class="img-thumbnail" style="padding:20px"/>

    </div>
    <div class="row">
        <p>
            Artwork Name&nbsp;
            <asp:TextBox ID="txtArtName" runat="server"></asp:TextBox>
        </p>
        <p>
            Artwork Description&nbsp;
            <asp:TextBox ID="txtArtDesc" runat="server"></asp:TextBox>
        </p>
        <p>
            Artwork Picture&nbsp;
            <asp:TextBox ID="txtArtworkPicture" runat="server"></asp:TextBox>
            <asp:FileUpload ID="fupArtwork" runat="server" Height="34px" />
        </p>
        <p>
            CategoryID&nbsp;
            <asp:TextBox ID="txtCategoryID" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Submit" />&nbsp;
            <asp:Label ID="lblError" runat="server"></asp:Label>
        </p>
     </div>
</asp:Content>
