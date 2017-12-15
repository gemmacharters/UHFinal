<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ArtworkGallery.aspx.cs" Inherits="UHFinal.ArtworkGallery" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    
        <asp:SqlDataSource ID="SqlArtwork" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [ArtName], [ArtworkPicture] FROM [Artwork]"></asp:SqlDataSource>
        <div class="grid">

            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlArtwork">
                <ItemTemplate>
                    <asp:HyperLink runat="server" NavigateUrl='#' >
                    <img src='<%# Eval("ArtworkPicture") %>' />
                    </asp:HyperLink>
                </ItemTemplate>
            </asp:Repeater>
        </div>

    <script type="text/javascript">
        window.onload = function () {
            var options =
                {
                    srcNode: 'img',             // grid items (class, node)
                    margin: '20px',             // margin in pixel, default: 0px
                    width: '250px',             // grid item width in pixel, default: 220px
                    max_width: '',              // dynamic gird item width if specified, (pixel)
                    resizable: true,            // re-layout if window resize
                    transition: 'all 0.5s ease' // support transition for CSS3, default: all 0.5s ease
                }
            document.querySelector('.grid').gridify(options);
        }
</script>
</asp:Content>
