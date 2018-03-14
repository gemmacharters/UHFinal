<%@ Page Title="Thread List" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ThreadList.aspx.cs" Inherits="UHFinal.ThreadList" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
    .imgScale {
        width: 100px; /* You can set the dimensions to whatever you want */
        height: 100px;
        object-fit: cover;
    }
    </style>
    <div style="padding:5px">
        <img src="images/list5.png" alt="banner" style="width:100%;height:auto;"/>
    </div>
    <div class="row" style="padding:10px" >
        <div class="col-md-4" >
            <h2>Character Art Forum</h2>
            <p>
                Select a thread to view posts.  Each artwork posted has a new thread, you can also start your own thread. You can view the artwork by clicking on the picture.
            <asp:Label ID="lblAccess" runat="server" Text="" ForeColor="Red" Font-Bold="True"></asp:Label>
            
            </p>
        </div>
        <div class="col-md-8" style="padding-top:30px">
    
        <asp:GridView ID="gvThreads" runat="server" AutoGenerateColumns="False" AllowSorting="True" AllowPaging="True" Width="100%" ValidateRequestMode="Inherit" CellPadding="5">
        <Columns>
            <asp:TemplateField >
                <ItemTemplate>
                    <asp:HyperLink runat="server" NavigateUrl='<%# "PostList.aspx?ThreadID=" + Eval("Id") %>' Text="View Posts">
                    </asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Artwork">
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
        </div>
</asp:Content>
