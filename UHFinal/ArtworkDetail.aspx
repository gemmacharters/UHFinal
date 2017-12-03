<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ArtworkDetail.aspx.cs" Inherits="UHFinal.ArtworkDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron" style="background-color:black;color:white">
        <p style="float:left"><img alt="" src="logo.png" /></p>
        <h1 style="text-align:center">UAL Character Art</h1>
        <p class="lead" style="clear:both">Artwork Detail</p>
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
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ArtworkID" DataSourceID="SqlDataSource2">
            <Columns>
                <asp:ImageField DataImageUrlField="ArtworkPicture" HeaderText="Artwork">
                    <ControlStyle CssClass="img-responsive" />
                    <ItemStyle Height="400px" Width="400px" />
                </asp:ImageField>
                <asp:TemplateField HeaderText="Artwork Details">
                    <ItemTemplate>
                        <asp:Label Text="Artwork Title: " ID="label1" runat="server"/>
                        <asp:Label Text='<%# Bind("ArtName") %>' ID="label2" runat="server"/>
                    
                        <asp:Label Text="<br /> Description: " ID="label3" runat="server"/>
                        <asp:Label Text='<%# Bind("ArtDescription") %>' ID="label4" runat="server"/>
                    
                        <asp:Label Text="<br /> Likes Count: " ID="label5" runat="server"/>
                        <asp:Label Text='<%# Bind("LikesCount") %>' ID="label6" runat="server"/>
                   
                        <asp:Label Text="<br /> Category: " ID="label7" runat="server"/>
                        <asp:Label Text='<%# Bind("CategoryName") %>' ID="label8" runat="server"/>
                    
                        <asp:Label Text="<br /> Upload Date: " ID="label9" runat="server"/>
                        <asp:Label Text='<%# Bind("UploadDate") %>' ID="label10" runat="server"/>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
            <p>The following hashtags have been added for this artwork</p>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:defaultConnection %>" SelectCommand="SELECT Artwork.ArtName, Artwork.ArtDescription, Artwork.ArtworkPicture, Artwork.LikesCount, Category.CategoryName, Artwork.ArtworkID, Artwork.UploadDate FROM Artwork INNER JOIN Category ON Artwork.CategoryID = Category.CategoryID WHERE (Artwork.ArtworkID = @ArtworkID)">
            <SelectParameters>
                <asp:QueryStringParameter Name="ArtworkID" QueryStringField="ArtworkID" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:ListView ID="ListView1" runat="server" DataKeyNames="ArtworkID" DataSourceID="SqlDataSource3" GroupItemCount="5">
            <AlternatingItemTemplate>
                <td runat="server">
                    <asp:Label ID="HashtagLabel" runat="server" Text='<%# Eval("Hashtag") %>' />
                    <br /></td>
            </AlternatingItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                    <tr>
                        <td>No hashtags have been added yet</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <EmptyItemTemplate>
<td runat="server" />
            </EmptyItemTemplate>
            <GroupTemplate>
                <tr id="itemPlaceholderContainer" runat="server">
                    <td id="itemPlaceholder" runat="server"></td>
                </tr>
            </GroupTemplate>
            <ItemTemplate>
                <td runat="server" >
                    <asp:Label ID="HashtagLabel" runat="server" Text='<%# Eval("Hashtag") %>' />
                    <br /></td>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="groupPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr id="groupPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF"></td>
                    </tr>
                </table>
            </LayoutTemplate>
            
        </asp:ListView>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:defaultConnection %>" SelectCommand="SELECT Artwork.ArtworkID, Hashtag.Hashtag FROM Artwork INNER JOIN ARHashtag ON Artwork.ArtworkID = ARHashtag.ArtworkID INNER JOIN Hashtag ON ARHashtag.HID = Hashtag.HID WHERE (Artwork.ArtworkID = @ArtworkID)">
            <SelectParameters>
                <asp:QueryStringParameter Name="ArtworkID" QueryStringField="ArtworkID" />
            </SelectParameters>
        </asp:SqlDataSource>
        </p>
</asp:Content>
