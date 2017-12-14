<%@ Page Title="Thread List" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ThreadList.aspx.cs" Inherits="UHFinal.ThreadList" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
    .imgScale {
        width: 100px; /* You can set the dimensions to whatever you want */
        height: 100px;
        object-fit: cover;
    }
    </style>
    <div class="jumbotron">
        <p>Select a thread to view the posts. If the thread is attached to Artwork then click on the picture to see details of the artwork. Click on the View Posts link to see all posts for the thread. If you want to add a new thread click on the New Thread button.
        </p>
    </div> 
    <div>
        <asp:GridView ID="gvThreads" runat="server" AutoGenerateColumns="False" AllowSorting="True" AllowPaging="True">
        <Columns>
            <asp:TemplateField HeaderText="Threads">
                <ItemTemplate>
                    <asp:HyperLink runat="server" NavigateUrl='<%# "PostList.aspx?ThreadID=" + Eval("Id") %>' Text="View Posts">
                    </asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:HyperLink runat="server" NavigateUrl='<%# "ArtworkDetail.aspx?ArtworkID=" + Eval("ArtworkID") %>'>
                    <img src='<%# Eval("ArtworkPicture") %>'  alt="Artwork Picture" class="imgScale" />
                    </asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Title" HeaderText="Title of Thread" SortExpression="Title" >
            </asp:BoundField>
            <asp:BoundField DataField="ThreadComment" HeaderText="Comment" SortExpression="ThreadComment" >
            </asp:BoundField>
            <asp:BoundField DataField="UserName" HeaderText="Created By" SortExpression="UserName" >
            </asp:BoundField>      
        </Columns>
        </asp:GridView>        
    </div>
</asp:Content>
