<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="test1.aspx.cs" Inherits="UHFinal.test1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:FileUpload ID="Fup1" runat="server" />
    <asp:Button ID="btnsave" runat="server" Text="Save" OnClick="btnsave_Click" />
    <asp:Label ID="lblError" runat="server" Text="error"></asp:Label>
    <asp:Label ID="Label1" runat="server" Text="Label1"></asp:Label>
    <asp:Label ID="Label2" runat="server" Text="Label2"></asp:Label>
    <asp:Label ID="Label3" runat="server" Text="Label3"></asp:Label>
    <asp:Image ID="pic" runat="server" src='<%# Eval("picture") %>'/>
</asp:Content>
