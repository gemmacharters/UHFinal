<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ArtworkList.aspx.cs" Inherits="UHFinal.ArtworkList" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
    .imgScale {
        width: 100px; /* You can set the dimensions to whatever you want */
        height: 100px;
        object-fit: cover;
        padding: 5px;
        border: 2px solid lightgray;
    }
    </style>
    <asp:SqlDataSource ID="SqluserAccount" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
        SelectCommand="SELECT AspNetUsers.Id, AspNetUsers.UserName, UserAccount.UserPicture, UserAccount.ArtistIntro 
                    FROM AspNetUsers INNER JOIN UserAccount ON AspNetUsers.Id = UserAccount.UserID WHERE (AspNetUsers.Id = @userID)">
        <SelectParameters>
            <asp:QueryStringParameter Name="userID" QueryStringField="UserID" />
        </SelectParameters>
        </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlArtwork" runat="server" ConnectionString="<%$ ConnectionStrings:defaultConnection %>" 
            SelectCommand="SELECT Artwork.ArtworkID, Artwork.ArtName, Artwork.ArtworkPicture, Category.CategoryName, Artwork.UserID FROM Artwork INNER JOIN Category ON Artwork.CategoryID = Category.CategoryID WHERE Artwork.UserID = @UserID">
        <SelectParameters>
            <asp:QueryStringParameter Name="UserID" QueryStringField="UserID" />
        </SelectParameters>
    </asp:SqlDataSource>
    <div style="padding:5px">
        <img src="images/list5.png" alt="banner" style="width:100%;height:auto;"/>
    </div>
    <div class="row" style="padding:10px" >
        <div class="col-md-4" >
            <h2>Artwork List</h2>
            <p>This page showcases the artwork of the artist below.  Click on the image to view details, like and post comments.</p>
            <div class="well well-sm">
                <asp:FormView ID="fvUser" runat="server" DataSourceID="SqluserAccount" Width="100%">
                    <ItemTemplate>
                        <p>Artist: <%# Eval("userName") %>                
                        <img src='<%# Eval("UserPicture") %>'  alt="Artist Picture" class="imgScale"/>
                        <p>Artist Bio: <%# Eval("ArtistIntro") %></p>
                        </p>                    
                    </ItemTemplate>
                </asp:FormView>
            </div>
        </div>
    <%--List of artwork for the artist--%>
        <div class="col-md-8" style="padding-top:30px">
            <asp:GridView ID="gvArtwork" runat="server" AutoGenerateColumns="False" DataKeyNames="ArtworkID" DataSourceID="SqlArtwork" AllowSorting="True" AllowPaging="True" Width="100%">
                <Columns>
                    <asp:TemplateField HeaderText="Artwork">
                        <ItemTemplate>
                        <asp:HyperLink runat="server" NavigateUrl='<%# "ArtworkDetail.aspx?ArtworkID=" + Eval("ArtworkID") %>' >
                        <img src='<%# Eval("ArtworkPicture") %>'  alt="Artwork Picture" class="imgScale"/>
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
        </div>
    </div>
        
   
</asp:Content>
