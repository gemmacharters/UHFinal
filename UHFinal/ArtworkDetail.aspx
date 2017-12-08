<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ArtworkDetail.aspx.cs" Inherits="UHFinal.ArtworkDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <p">Artwork Details are shown below, with hashtags and comments.</p>
    </div>
    <%--Data sources--%>
    <asp:SqlDataSource ID="SqluserAccount" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
        SelectCommand="SELECT Artwork.ArtworkID, AspNetUsers.UserName, UserAccount.UserPicture, UserAccount.ArtistIntro FROM Artwork INNER JOIN AspNetUsers ON Artwork.UserID = AspNetUsers.Id INNER JOIN UserAccount ON AspNetUsers.Id = UserAccount.UserID WHERE Artwork.ArtworkID = @ArtworkID">
            <SelectParameters>
                <asp:QueryStringParameter Name="ArtworkID" QueryStringField="ArtworkID" />
            </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlArtwork" runat="server" ConnectionString="<%$ ConnectionStrings:defaultConnection %>" 
        SelectCommand="SELECT Artwork.ArtName, Artwork.ArtDescription, Artwork.ArtworkPicture, Artwork.LikesCount, Category.CategoryName, Artwork.ArtworkID, Artwork.UploadDate FROM Artwork INNER JOIN Category ON Artwork.CategoryID = Category.CategoryID WHERE (Artwork.ArtworkID = @ArtworkID)">
            <SelectParameters>
                <asp:QueryStringParameter Name="ArtworkID" QueryStringField="ArtworkID" />
            </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlHashtags" runat="server" ConnectionString="<%$ ConnectionStrings:defaultConnection %>" 
        SelectCommand="SELECT Artwork.ArtworkID, Hashtag.Hashtag FROM Artwork INNER JOIN ARHashtag ON Artwork.ArtworkID = ARHashtag.ArtworkID INNER JOIN Hashtag ON ARHashtag.HID = Hashtag.HID WHERE (Artwork.ArtworkID = @ArtworkID)">
            <SelectParameters>
                <asp:QueryStringParameter Name="ArtworkID" QueryStringField="ArtworkID" />
            </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlArtworkThread" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT Thread.Title, Thread.ThreadComment, Thread.ArtworkID, Post.PostComment FROM Thread INNER JOIN Post ON Thread.Id = Post.ThreadID WHERE (Thread.ArtworkID = @ArtworkID)">
        <SelectParameters>
            <asp:QueryStringParameter Name="ArtworkID" QueryStringField="ArtworkID" />
        </SelectParameters>
    </asp:SqlDataSource>

    <%--User information--%>
    <div class="well well-sm">
        <asp:FormView ID="fvUser" runat="server" DataSourceID="SqluserAccount">
            <ItemTemplate>
                <p>Artist: <%# Eval("userName") %>
                <img src='<%# Eval("UserPicture") %>'  alt="Artist Picture" class="img-thumbnail" style="width:100px;height:auto;"/></p>
            </ItemTemplate>
        </asp:FormView>
    </div>
    <%--Artwork List--%>
    <div>
        <asp:GridView ID="gvArtwork" runat="server" AutoGenerateColumns="False" DataKeyNames="ArtworkID" DataSourceID="SqlArtwork">
            <Columns>
                <asp:ImageField DataImageUrlField="ArtworkPicture" HeaderText="Artwork">
                    <ControlStyle CssClass="img-responsive" />
                    <ItemStyle Height="400px" Width="400px" />
                </asp:ImageField>
                <asp:TemplateField HeaderText="Artwork Details">
                    <ItemTemplate>
                        <asp:Label Text="Artwork Title: " ID="label1" runat="server"/>
                        <asp:Label Text='<%# Bind("ArtName") %>' ID="label2" runat="server"/>

                        <asp:Label Text="<br /> Description: " ID="label3" runat="server"/>
                        <asp:Label Text='<%# Bind("ArtDescription") %>' ID="label4" runat="server"/>
                    
                        <asp:Label Text="<br /> Likes Count: " ID="label5" runat="server"/>
                        <asp:Label Text='<%# Bind("LikesCount") %>' ID="label6" runat="server"/>
                   
                        <asp:Label Text="<br /> Category: " ID="label7" runat="server"/>
                        <asp:Label Text='<%# Bind("CategoryName") %>' ID="label8" runat="server"/>
                    
                        <asp:Label Text="<br /> Upload Date: " ID="label9" runat="server"/>
                        <asp:Label Text='<%# Bind("UploadDate") %>' ID="label10" runat="server"/>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <p>The following hashtags have been added for this artwork
            <asp:DataList ID="dlHashtags" runat="server" DataSourceID="SqlHashtags" RepeatColumns="5" RepeatDirection="Horizontal" ShowFooter="False" ShowHeader="False">
                <ItemTemplate>
                    <asp:Label Text='<%# Bind("Hashtag") %>' ID="Label11" runat="server" ></asp:Label>
                </ItemTemplate>
            </asp:DataList>
        </p>
        <p>Posts on this artwork

            <asp:ListView ID="lvPosts" runat="server" DataSourceID="SqlArtworkThread">
                <ItemTemplate>
                    <asp:Label Text='<%# Bind("PostComment") %>' ID="Label12" runat="server" ></asp:Label>
                </ItemTemplate>
            </asp:ListView>

        </p>
    </div>
</asp:Content>
