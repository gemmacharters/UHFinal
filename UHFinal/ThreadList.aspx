<%@ Page Title="Thread List" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ThreadList.aspx.cs" Inherits="UHFinal.ThreadList" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <p style="clear:both">Select a thread to view the posts. </p>
        
        <asp:SqlDataSource ID="SqlThreads" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
            SelectCommand="SELECT Thread.Id, Thread.Title, Thread.ThreadComment, AspNetUsers.UserName, Thread.ArtworkID, Thread.UserID, Artwork.ArtworkPicture FROM Thread INNER JOIN AspNetUsers ON Thread.UserID = AspNetUsers.Id LEFT OUTER JOIN Artwork ON Thread.ArtworkID = Artwork.ArtworkID AND AspNetUsers.Id = Artwork.UserID"></asp:SqlDataSource>
            <asp:GridView ID="gvThreads" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlThreads" AllowSorting="True" AllowPaging="True">
            <Columns>
                <asp:TemplateField HeaderText="Threads">
                    <ItemTemplate>
                    <asp:HyperLink runat="server" NavigateUrl='<%# "PostList.aspx?ThreadID=" + Eval("Id") %>' Target="_blank" Text="View Posts">
                    </asp:HyperLink>
                </ItemTemplate>
                    <ControlStyle Width="200px"></ControlStyle>
                </asp:TemplateField>
                <asp:BoundField DataField="Title" HeaderText="Title of Thread" SortExpression="Title">
                <ItemStyle Width="200px" />
                </asp:BoundField>
                <asp:BoundField DataField="ThreadComment" HeaderText="Comment" SortExpression="ThreadComment" >
                </asp:BoundField>
                <asp:BoundField DataField="UserName" HeaderText="Created By" SortExpression="UserName" >
                </asp:BoundField>
                
            </Columns>
        </asp:GridView>

        <img src='<%# Eval("ArtworkPicture") %>'  alt="Artwork Picture" class="img-thumbnail"/>
    </div>

</asp:Content>
