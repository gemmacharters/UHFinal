<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ArtworkDetail.aspx.cs" Inherits="UHFinal.ArtworkDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

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

    <%--Page Content--%>
    <div style="padding:5px">
        <img src="images/list5.png" alt="banner" style="width:100%;height:auto;"/>
    </div>
    <div class="row" style="padding:10px" >
        <div class="col-md-4" style="padding-top:30px" >
            <h2>Artwork Detail</h2>
            <p>The details of the artwork is shown here, if you are an approved user or artist you can view the posts for the artwork, add posts and like the artwork.</p>
        <asp:Label ID="lblError" runat="server" Text="" ></asp:Label>
        </div>
        <div class="col-md-8" >
                <div class="row">
                    <div class="col-md-6" style="padding:20px">
                            <asp:FormView ID="FormView2" runat="server" DataSourceID="SqlArtwork" Width="100%">
                                <ItemTemplate>
                                    <img src='<%# Eval("ArtworkPicture") %>'  alt="Artwork Picture" class="img-thumbnail" /></p>
                                </ItemTemplate>
                            </asp:FormView>
                    </div>
                    <div class="col-md-6" style="padding-top:30px">
                        <div class="col-md-12">
                            <asp:FormView ID="FormView3" runat="server" DataSourceID="SqlArtwork" Width="100%" CellPadding="5">
                                <ItemTemplate>
                                    <p><strong>Artist: </strong><%# Eval("userName") %>
                                    <img src='<%# Eval("UserPicture") %>'  alt="Artist Picture" class="img-thumbnail" style="width:100px;height:auto;"/></p>
                                </ItemTemplate>
                            </asp:FormView>
                        </div>
                        <div class="col-md-12">
                            <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlArtwork" Width="100%">
                                <ItemTemplate>
                            <p><strong>Artwork Title: </strong> <%# Eval("ArtName") %></p>
                            <p><strong>Description: </strong> <%# Eval("ArtDescription") %></p>
                            <p><strong>Category: </strong> <%# Eval("CategoryName") %></p>
                            <p><strong>Upload Date:  </strong><%# Eval("UploadDate") %></p>
                            <p><strong>Likes: </strong> <%# Eval("CountOf") %></p>
                            </ItemTemplate>
                            </asp:FormView>
                            <asp:CheckBox ID="chkLike" runat="server" AutoPostBack="true" Enabled="true" Text="<span class='glyphicon glyphicon-thumbs-up' aria-hidden='true'></span>" OnCheckedChanged="chkLike_CheckedChanged" ForeColor="Blue" Font-Size="X-Large" />
                            <asp:Label ID="lblLike" runat="server" Text="" Font-Bold="False" ForeColor="Blue"></asp:Label>
                        </div>
                        <div class="col-md-12">
                            <p><strong>The following hashtags have been added for this artwork</strong></p>
                            <asp:DataList ID="dlHashtags" runat="server" DataSourceID="SqlHashtags" RepeatColumns="5" RepeatDirection="Horizontal" ShowFooter="False" ShowHeader="False" Width="100%">
                                <ItemTemplate>
                                    <asp:Label Text='<%# Eval("Hashtag") %>' ID="Label11" runat="server" ></asp:Label>
                                </ItemTemplate>
                            </asp:DataList>
                        </div>
                        <div class="col-md-12">
                            <p><strong>Posts on this artwork</strong></p>
                            <asp:LoginView ID="lv1" runat="server">
                                <AnonymousTemplate>You need to be logged in to view posts</AnonymousTemplate>
                                <LoggedInTemplate>
                                    <asp:GridView ID="gvPosts" runat="server" AutoGenerateColumns="False" DataSourceID="SqlArtworkThread" AllowSorting="True" AllowPaging="True" Width="100%">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Artwork Postings">
                                            <ItemTemplate>
                                                <asp:Label Text='<%# Eval("PostComment") %>' ID="Label12" runat="server" ShowFooter="False" ShowHeader="False" ></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                        </asp:GridView>
                                </LoggedInTemplate>
                            </asp:LoginView>
                        </div>
                    </div>
                </div>
    </div>
    </div>
</asp:Content>

