<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PostList.aspx.cs" Inherits="UHFinal.PostList" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <p>Postings are listed here. If you want to add a post please clcik the link below.
        </p>
    </div>
    <asp:SqlDataSource ID="SqlThread" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
        SelectCommand="SELECT Thread.Id, Thread.Title, Thread.ThreadComment, AspNetUsers.UserName, Thread.ArtworkID,  
                Thread.UserID, Artwork.ArtworkPicture FROM Thread INNER JOIN AspNetUsers ON Thread.UserID = AspNetUsers.Id  
                LEFT OUTER JOIN Artwork ON Thread.ArtworkID = Artwork.ArtworkID AND AspNetUsers.Id = Artwork.UserID WHERE Thread.Id = @ThreadID">
        <SelectParameters>
            <asp:QueryStringParameter Name="ThreadID" QueryStringField="ThreadID" />
        </SelectParameters>
        </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlPosts" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
        SelectCommand="SELECT Post.Id, Post.ThreadID, Post.PostUserID, Post.PostComment, Post.PostAdded, AspNetUsers.UserName FROM Post INNER JOIN AspNetUsers ON Post.PostUserID = AspNetUsers.Id  
                 WHERE Post.ThreadId = @ThreadID">
        <SelectParameters>
            <asp:QueryStringParameter Name="ThreadID" QueryStringField="ThreadID" />
        </SelectParameters>
        </asp:SqlDataSource>
    <div>
        <div class="well well-sm">
        <asp:FormView ID="fvThread" runat="server" DataSourceID="SqlThread">
            <ItemTemplate>
                <p>Title: <%# Eval("Title") %>                
                <img src='<%# Eval("ArtworkPicture") %>'  alt="Artwork Picture" class="img-thumbnail" style="width:100px;height:auto;"/>
                <p>Thread Comment: <%# Eval("ThreadComment") %></p>
                <p>Thread Started By: <%# Eval("UserName") %></p>
                </p>                    
            </ItemTemplate>
        </asp:FormView>
        </div>
        <div>
        <asp:GridView ID="gvPosts" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlPosts" AllowSorting="True" AllowPaging="True">
            <Columns>
                
                <asp:BoundField DataField="PostComment" HeaderText="Post Comment" SortExpression="PostComment">
                <ItemStyle Width="200px" />
                </asp:BoundField>
                <asp:BoundField DataField="PostAdded" HeaderText="Post Added On" SortExpression="PostAdded" > </asp:BoundField>
                <asp:BoundField DataField="UserName" HeaderText="Post Added By" SortExpression="userName" >
                </asp:BoundField>

            </Columns>
        </asp:GridView>
            </div>





    </div>
</asp:Content>
