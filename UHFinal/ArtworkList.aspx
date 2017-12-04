<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ArtworkList.aspx.cs" Inherits="UHFinal.ArtworkList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron" style="background-color:black;color:white">
        <p style="float:left"><img alt="" src="logo.png" /></p>
        <h1 style="text-align:center">UAL Character Art</h1>
        <p class="lead" style="clear:both">Artwork List</p>
    </div>
    <p><asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:defaultConnection %>" 
        SelectCommand="SELECT UserAccount.UserStatus, UserAccount.UserPicture, UserAccount.UserID, UserAccount.ArtistIntro, AspNetUsers.UserName FROM AspNetUsers INNER JOIN UserAccount ON AspNetUsers.Id = UserAccount.UserID; WHERE AspNetUsers.Id = @UserID">
            <SelectParameters>
                <asp:QueryStringParameter Name="UserID" QueryStringField="UserID" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BorderColor="White" BorderStyle="None" DataKeyNames="UserID" DataSourceID="SqlDataSource1" GridLines="None" HorizontalAlign="Left">
            <Columns>
                <asp:BoundField DataField="UserName" HeaderText="Artist Name" SortExpression="UserName">
                <HeaderStyle Font-Bold="True" Font-Size="Larger" />
                <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" Width="100px" />
                </asp:BoundField>
                <asp:ImageField DataImageUrlField="UserPicture">
                    <ControlStyle CssClass="img-thumbnail" />
                    <ItemStyle Height="100px" Width="100px" />
                </asp:ImageField>
            </Columns>
        </asp:GridView>
   
    <p>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:defaultConnection %>" 
            SelectCommand="SELECT Artwork.ArtworkID, Artwork.ArtName, Artwork.ArtworkPicture, Category.CategoryName, Artwork.UserID FROM Artwork INNER JOIN Category ON Artwork.CategoryID = Category.CategoryID WHERE Artwork.UserID = @UserID">
            <SelectParameters>
                <asp:QueryStringParameter Name="UserID" QueryStringField="UserID" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ArtworkID" DataSourceID="SqlDataSource2" AllowSorting="True" AllowPaging="True">
            <Columns>
                <asp:TemplateField HeaderText="Artwork">
                    <ItemTemplate>
                    <asp:HyperLink runat="server" NavigateUrl='<%# "ArtworkDetail.aspx?ArtworkID=" + Eval("ArtworkID") %>' Target="_blank">
                    <img src='<%# Eval("ArtworkPicture") %>'  alt="Artwork Picture" class="img-thumbnail"/>
                    </asp:HyperLink>
                </ItemTemplate>
                    
                    <ControlStyle Width="200px"></ControlStyle>
                    
                </asp:TemplateField>
                <asp:BoundField DataField="ArtName" HeaderText="Title of Artwork" SortExpression="ArtName">
                <ItemStyle Width="200px" />
                </asp:BoundField>
                <asp:BoundField DataField="CategoryName" HeaderText="Category" SortExpression="CategoryName" >

                <HeaderStyle HorizontalAlign="Center" />
                </asp:BoundField>

            </Columns>
        </asp:GridView>
        
        
    </p>
   
</asp:Content>
