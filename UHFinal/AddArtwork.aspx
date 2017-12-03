<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddArtwork.aspx.cs" Inherits="UHFinal.AddArtwork" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron" style="background-color:black;color:white">
        <p style="float:left"><img alt="" src="logo.png" /></p>
        <h1 style="text-align:center">UAL Character Art</h1>
        <p class="lead" style="clear:both">Add Artwork.</p>
            
    </div>
    <p>&nbsp;<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:defaultConnection %>" SelectCommand="SELECT [UserID], [UserName], [UserPicture] FROM [User] WHERE ([UserID] = @UserID)">
            <SelectParameters>
                <asp:Parameter DefaultValue="1" Name="UserID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BorderColor="White" BorderStyle="None" DataKeyNames="UserID" DataSourceID="SqlDataSource1" GridLines="None" HorizontalAlign="Left">
            <Columns>
                <asp:BoundField DataField="UserName" HeaderText="Artist Name" SortExpression="UserName">
                <HeaderStyle Font-Bold="True" Font-Size="Larger" />
                <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" Width="100px" />
                </asp:BoundField>
                <asp:ImageField DataImageUrlField="UserPicture">
                    <ControlStyle CssClass="img-thumbnail" />
                    <ItemStyle Height="100px" Width="100px" />
                </asp:ImageField>
            </Columns>
        </asp:GridView>
        </p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
        <p>



            Artwork Name&nbsp;
            <asp:TextBox ID="txtArtName" runat="server"></asp:TextBox>
        </p>
        <p>



            Artwork Description&nbsp;
            <asp:TextBox ID="txtArtDesc" runat="server"></asp:TextBox>
        </p>
        <p>



            Artwork Picture&nbsp;
            <asp:TextBox ID="txtArtworkPicture" runat="server"></asp:TextBox>
            <asp:FileUpload ID="fupArtwork" runat="server" Height="34px" />
        </p>
        <p>



            CategoryID&nbsp;
            <asp:TextBox ID="txtCategoryID" runat="server"></asp:TextBox>
        </p>
        <p>



            <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Submit" />&nbsp;
            <asp:Label ID="lblError" runat="server"></asp:Label>
        </p>
</asp:Content>
