<%@ Page Title="Artist List" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ArtistList.aspx.cs" Inherits="UHFinal.ArtistList" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <p>Please select an artist and view their portfolio </p>   
    </div>
     <asp:SqlDataSource ID="SqlArtistList" runat="server" ConnectionString="<%$ ConnectionStrings:defaultConnection %>" SelectCommand="SELECT UserAccount.UserStatus, UserAccount.UserPicture, UserAccount.UserID,UserAccount.ArtistIntro, AspNetUsers.UserName FROM AspNetUsers INNER JOIN UserAccount ON AspNetUsers.Id = UserAccount.UserID;"></asp:SqlDataSource>
     <div>
         <asp:GridView ID="gvArtistList" runat="server" AutoGenerateColumns="False" DataKeyNames="UserID" DataSourceID="SqlArtistList" AllowSorting="True" AllowPaging="True">
            <Columns>
                <asp:TemplateField HeaderText="Artist Picture">
                    <ItemTemplate>
                        <asp:HyperLink runat="server" NavigateUrl='<%# "ArtworkList.aspx?userId=" + Eval("UserID") %>' >
                            <img src='<%# Eval("UserPicture") %>'  alt="Artist Picture" class="img-thumbnail"/>
                        </asp:HyperLink>
                    </ItemTemplate>
                    
                    <ControlStyle Width="200px"></ControlStyle>
                    
                </asp:TemplateField>
                <asp:BoundField DataField="UserName" HeaderText="Artist Name" SortExpression="UserName">
                <ItemStyle Width="200px" />
                </asp:BoundField>
                <asp:BoundField DataField="ArtistIntro" HeaderText="Information">

                <HeaderStyle HorizontalAlign="Center" />
                </asp:BoundField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
