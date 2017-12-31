<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Approval.aspx.cs" Inherits="UHFinal.Account.Approval" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
    .imgScale {
        width: 100px; /* You can set the dimensions to whatever you want */
        height: 100px;
        object-fit: cover;
    }
    </style>
    <div>
        <asp:GridView ID="gvUsers" runat="server" AutoGenerateColumns="False" AllowSorting="True" AllowPaging="True">
        <Columns>
            <asp:TemplateField HeaderText="New Users">
                <ItemTemplate>
                    <asp:CheckBox ID="ApproveUser" runat="server" />
                    
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <img src='<%# Eval("UserPicture") %>'  alt="User Picture" class="imgScale" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="UserName" HeaderText="User Name" SortExpression="UserName" >
            </asp:BoundField>
            <asp:BoundField DataField="UserStatus" HeaderText="Status" >
            </asp:BoundField>
            <asp:BoundField DataField="ArtistIntro" HeaderText="Artist Bio" >
            </asp:BoundField>      
        </Columns>
        </asp:GridView>
        <asp:Button ID="Approve" runat="server" OnClick="Approve_Click" Text="Approve Selected Users" />
    </div>
    <asp:Label ID="lblError" runat="server" Text="Error"></asp:Label>
</asp:Content>
