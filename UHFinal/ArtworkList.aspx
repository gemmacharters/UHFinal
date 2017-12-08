<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ArtworkList.aspx.cs" Inherits="UHFinal.ArtworkList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron" style="background-color:black;color:white">
        <p style="float:left"><img alt="" src="logo.png" /></p>
        <h1 style="text-align:center">UAL Character Art</h1>
        <p class="lead" style="clear:both">Artwork List</p>
    </div>
    <asp:SqlDataSource ID="SqluserAccount" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
        SelectCommand="SELECT AspNetUsers.Id, AspNetUsers.UserName, UserAccount.UserPicture, UserAccount.ArtistIntro FROM AspNetUsers INNER JOIN UserAccount ON AspNetUsers.Id = UserAccount.UserID WHERE (AspNetUsers.Id = @userID)">
        <SelectParameters>
            <asp:QueryStringParameter Name="userID" QueryStringField="UserID" />
        </SelectParameters>
        </asp:SqlDataSource>
        <div class="well well-sm">
                
                <asp:FormView ID="fvUser" runat="server" DataSourceID="SqluserAccount">
                    <ItemTemplate>
                        <div>Artist: <%# Eval("userName") %>
                        
                        <img src='<%# Eval("UserPicture") %>'  alt="Artist Picture" class="img-thumbnail" style="width:100px;height:auto;"/>
                        <p>Artist Bio: <%# Eval("ArtistIntro") %></p>

                        </div>
                        
                    </ItemTemplate>
                </asp:FormView>
    </div>
    
        <asp:SqlDataSource ID="SqlArtwork" runat="server" ConnectionString="<%$ ConnectionStrings:defaultConnection %>" 
            SelectCommand="SELECT Artwork.ArtworkID, Artwork.ArtName, Artwork.ArtworkPicture, Category.CategoryName, Artwork.UserID FROM Artwork INNER JOIN Category ON Artwork.CategoryID = Category.CategoryID WHERE Artwork.UserID = @UserID">
            <SelectParameters>
                <asp:QueryStringParameter Name="UserID" QueryStringField="UserID" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="gvArtwork" runat="server" AutoGenerateColumns="False" DataKeyNames="ArtworkID" DataSourceID="SqlArtwork" AllowSorting="True" AllowPaging="True">
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
        
        
   
</asp:Content>
