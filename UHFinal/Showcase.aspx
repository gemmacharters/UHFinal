<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Showcase.aspx.cs" Inherits="UHFinal.Showcase" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style type = "text/css">            /* CSS for images inside item wrapper */            .kc-item img {                position:absolute;                pointer-events: none;   /* Make images non-selectable. */                width:100%;             /* Make images expand to wrapper size (used in 2d modes). */            }        </style>        <script type = "text/javascript">            // Create the carousel.            $(function() {                $('.kc-wrap').KillerCarousel({                    // Default natural width of carousel.                    width: 800,                    // Item spacing in 3d (has CSS3 3d) mode.                    spacing3d: 120,                    // Item spacing in 2d (no CSS3 3d) mode.                     spacing2d: 120,                    showShadow: true,                    showReflection: true,                    // Looping mode.                    infiniteLoop: true,                    // Scale at 75% of parent element.                    autoScale: 75                });            });        </script>
    <asp:SqlDataSource ID="SqlArtwork" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [ArtName], [ArtworkPicture] FROM [Artwork]"></asp:SqlDataSource>
        <div id="wrapper">
            <div class="kc-wrap">
            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlArtwork">
                <ItemTemplate>
                    <div class="kc-item">
                    <asp:HyperLink runat="server" NavigateUrl='#' >
                    <img src='<%# Eval("ArtworkPicture") %>' />
                    </asp:HyperLink>
                        </div>
                </ItemTemplate>
            </asp:Repeater>
            </div>
        </div>

</asp:Content>
