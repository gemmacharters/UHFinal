<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Approval.aspx.cs" Inherits="UHFinal.Account.Approval" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
    .imgScale {
        width: 50px; /* You can set the dimensions to whatever you want */
        height: 50px;
        object-fit: cover;
    }
    </style>
    <div>
        <h3>Approve Users: Select the pending users you want to approve.</h3>
        <asp:Label ID="NoUsers" runat="server" Text="There are no users to be approved" Visible="false"></asp:Label>
        <asp:GridView ID="gvUsers" runat="server" AutoGenerateColumns="False" AllowSorting="True" AllowPaging="True">
        <Columns>
            
            <asp:TemplateField HeaderText="Select User">
                <ItemTemplate>
                    <asp:CheckBox ID="ApproveUser" runat="server" />
                    <asp:HiddenField ID="UserID" runat="server" Value='<%# Eval("UserID") %>'></asp:HiddenField>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Picture">
                <ItemTemplate>
                    <img src='/<%# Eval("UserPicture") %>'  alt="User Picture" class="imgScale" />
                    
            
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="UserName" HeaderText="User Name" SortExpression="UserName" >
            </asp:BoundField>
            <asp:BoundField DataField="UserStatus" HeaderText="Status" >
            </asp:BoundField>
            <asp:BoundField DataField="ArtistIntro" HeaderText="Artist Bio" ItemStyle-Width="400px">
            </asp:BoundField>
            
        </Columns>
        </asp:GridView>
        <asp:Button ID="Approve" runat="server" OnClick="Approve_Click" Text="Approve Selected Users" />
    </div>
    <asp:Label ID="lblError" runat="server" Text="Error" Visible="false"></asp:Label>
</asp:Content>
