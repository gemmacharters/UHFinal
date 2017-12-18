<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ArtworkDetail.aspx.cs" Inherits="UHFinal.ArtworkDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <p">Artwork Details are shown below, with hashtags and comments. Click on the artwork to like and post comments</p>
    </div>
    <%--Data sources--%>
    
    <asp:SqlDataSource ID="SqlArtwork" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
        SelectCommand="SELECT ArtworkDetail.ArtName, ArtworkDetail.ArtDescription, ArtworkDetail.ArtworkPicture, ArtworkDetail.CategoryName, 
        ArtworkDetail.ArtworkID, ArtworkDetail.UploadDate, ArtworkDetail.UserName, ArtworkDetail.UserPicture, LikesCount.CountOf FROM ArtworkDetail 
        LEFT OUTER JOIN LikesCount ON ArtworkDetail.ArtworkID = LikesCount.ArtworkID 
        WHERE (ArtworkDetail.ArtworkID = @ArtworkID)">
            <SelectParameters>
                <asp:QueryStringParameter Name="ArtworkID" QueryStringField="ArtworkID" />
            </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlHashtags" runat="server" ConnectionString="<%$ ConnectionStrings:defaultConnection %>" 
        SelectCommand="SELECT Artwork.ArtworkID, Hashtag.Hashtag FROM Artwork INNER JOIN ARHashtag ON Artwork.ArtworkID = ARHashtag.ArtworkID INNER JOIN Hashtag ON ARHashtag.HID = Hashtag.HID WHERE (Artwork.ArtworkID = @ArtworkID)">
            <SelectParameters>
                <asp:QueryStringParameter Name="ArtworkID" QueryStringField="ArtworkID" />
            </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlArtworkThread" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT Thread.Title, Thread.ThreadComment, Thread.ArtworkID, Post.PostComment FROM Thread INNER JOIN Post ON Thread.Id = Post.ThreadID WHERE (Thread.ArtworkID = @ArtworkID)">
        <SelectParameters>
            <asp:QueryStringParameter Name="ArtworkID" QueryStringField="ArtworkID" />
        </SelectParameters>
    </asp:SqlDataSource>

    
    <%--Artwork List--%>
    <div class="container-fluid">
    
    <p><asp:CheckBox ID="chkLike" runat="server" AutoPostBack="true" Text="<span class='glyphicon glyphicon-thumbs-up' aria-hidden='true'></span>" OnCheckedChanged="chkLike_CheckedChanged"/></p>
    
        
        <asp:FormView ID="fvArtwork" runat="server" DataSourceID="SqlArtwork" Width="800px">
        <ItemTemplate>
                <div class="row">
                    <div class="col-md-8">
                        <img src='<%# Eval("ArtworkPicture") %>'  alt="Artwork Picture" class="img-thumbnail" style="max-width:400px;height:auto;"/></p>
                    </div>
                    <div class="col-md-4">
                        <div class="row">
                            <div class="col-md-12">
                                <p>Artist: <%# Eval("userName") %>
                                <img src='<%# Eval("UserPicture") %>'  alt="Artist Picture" class="img-thumbnail" style="width:100px;height:auto;"/></p>
                            </div>
                            <div class="col-md-12">
                                
                                <p>Artwork Title:  <%# Eval("ArtName") %></p>
                                <p>Description:  <%# Eval("ArtDescription") %></p>
                                <p>Category:  <%# Eval("CategoryName") %></p>
                                <p>Upload Date:  <%# Eval("UploadDate") %></p>
                                <p>Likes:  <%# Eval("CountOf") %></p>
                                
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <p>The following hashtags have been added for this artwork
                        <asp:DataList ID="dlHashtags" runat="server" DataSourceID="SqlHashtags" RepeatColumns="5" RepeatDirection="Horizontal" ShowFooter="False" ShowHeader="False">
                            <ItemTemplate>
                                <asp:Label Text='<%# Eval("Hashtag") %>' ID="Label11" runat="server" ></asp:Label>
                            </ItemTemplate>
                        </asp:DataList>
                        </p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <p>Posts on this artwork
                        <asp:GridView ID="gvPosts" runat="server" AutoGenerateColumns="False" DataSourceID="SqlArtworkThread" AllowSorting="True" AllowPaging="True">
                        <Columns>
                            <asp:TemplateField HeaderText="Artwork Postings">
                            <ItemTemplate>
                                <asp:Label Text='<%# Eval("PostComment") %>' ID="Label12" runat="server" ShowFooter="False" ShowHeader="False" ></asp:Label>
                            </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        </asp:GridView>
                        </p>
                    </div>
                </div>
        </ItemTemplate>
    </asp:FormView>
    </div>
</asp:Content>

