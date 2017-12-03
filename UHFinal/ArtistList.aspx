<%@ Page Title="Artist List" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ArtistList.aspx.cs" Inherits="UHFinal.ArtistList" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <p style="clear:both">Please select an artist and view their portfolio </p>   
    </div>
     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:defaultConnection %>" SelectCommand="SELECT UserAccount.UserStatus, UserAccount.UserPicture, UserAccount.UserID,UserAccount.ArtistIntro, AspNetUsers.UserName FROM AspNetUsers INNER JOIN UserAccount ON AspNetUsers.Id = UserAccount.UserID WHERE UserAccount.UserStatus = 'AA';
"></asp:SqlDataSource>
     <div><asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BorderColor="White" BorderStyle="None" DataKeyNames="UserID" DataSourceID="SqlDataSource1" GridLines="None" HorizontalAlign="Left">
            <Columns>
                <asp:BoundField DataField="UserName" HeaderText="Artist Name" SortExpression="UserName">
                <HeaderStyle Font-Bold="True" Font-Size="Larger" />
                <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" Width="100px" />
                </asp:BoundField>


                <asp:ImageField DataImageUrlField="UserPicture">
                    <ControlStyle CssClass="img-thumbnail" />
                    <ItemStyle Height="100px" Width="100px" />
                </asp:ImageField>
                <asp:BoundField DataField="ArtistIntro" HeaderText="Artist Introduction">
                <HeaderStyle Font-Bold="True" Font-Size="Larger" />
                <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" Width="100px" />
                </asp:BoundField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
