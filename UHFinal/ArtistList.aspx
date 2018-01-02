<%@ Page Title="Artist List" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ArtistList.aspx.cs" Inherits="UHFinal.ArtistList" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
    .imgScale {
        width: 100px; /* You can set the dimensions to whatever you want */
        height: 100px;
        object-fit: cover;
        padding: 5px;
        border: 2px solid lightgray;
    }
    </style>
     <asp:SqlDataSource ID="SqlArtistList" runat="server" ConnectionString="<%$ ConnectionStrings:defaultConnection %>" SelectCommand="SELECT UserAccount.UserStatus, UserAccount.UserPicture, UserAccount.UserID,UserAccount.ArtistIntro, AspNetUsers.UserName FROM AspNetUsers INNER JOIN UserAccount ON AspNetUsers.Id = UserAccount.UserID;"></asp:SqlDataSource>
     
    
    <div style="padding:5px">
        <img src="images/list5.png" alt="banner" style="width:100%;height:auto;"/>
    </div>
    <div class="row" style="padding:10px" >
        <div class="col-md-8" >
            <div>
                 <asp:GridView ID="gvArtistList" runat="server" AutoGenerateColumns="False" DataKeyNames="UserID" DataSourceID="SqlArtistList" AllowSorting="True" AllowPaging="True" Width="100%" CellPadding="5">
                    <Columns>
                        <asp:TemplateField HeaderText="Artist Picture">
                            <ItemTemplate>
                                <div>
                                <asp:HyperLink  runat="server" NavigateUrl='<%# "ArtworkList.aspx?userId=" + Eval("UserID") %>' >
                                    <img  src='<%# Eval("UserPicture") %>'  alt="Artist Picture" class="imgScale"/>
                                </asp:HyperLink>
                                </div>
                            </ItemTemplate>

                    
                        </asp:TemplateField>
                        <asp:BoundField DataField="UserName" HeaderText="Artist Name" SortExpression="UserName">
                        </asp:BoundField>
                        <asp:BoundField DataField="ArtistIntro" HeaderText="Information" >


                        </asp:BoundField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
        <div class="col-md-4" style="padding-top:30px">
            <h2>Select an Artist</h2>
            <p>Click on the artist to view their portfolio. You can sort on Artist Name by clicking in the header of the table.</p>
        </div>
    </div>
  
</asp:Content>
