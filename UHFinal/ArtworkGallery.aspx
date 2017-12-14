<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ArtworkGallery.aspx.cs" Inherits="UHFinal.ArtworkGallery" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <div>
       csddsdcd 
        <asp:SqlDataSource ID="SqlArtwork" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [ArtName], [ArtworkPicture] FROM [Artwork]"></asp:SqlDataSource>
        <div id="gallery" style="display:none;">

            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlArtwork">
                <ItemTemplate>
                    <asp:HyperLink runat="server" NavigateUrl='#' >
                    <img src='<%# Eval("ArtworkPicture") %>'  data-image='<%# Eval("ArtworkPicture") %>' data-description='<%# Eval("ArtName")%>' style="display:none"/>
                    </asp:HyperLink>

                </ItemTemplate>


            </asp:Repeater>

        <%--<asp:DataList ID="DataList2" runat="server" DataSourceID="SqlArtwork">
            <ItemTemplate>
                <img alt="" src='<%# Eval("ArtworkPicture") %>' data-image='<%# Eval("ArtworkPicture") %>' data-description='<%# Eval("ArtName")%>' style="display:none"/>
            </ItemTemplate>

        </asp:DataList>--%>
        </div>
    </div>
    <script type="text/javascript">

        jQuery(document).ready(function () {

            jQuery("#gallery").unitegallery({
                tiles_type: "nested"
            });

        });

	</script>
</asp:Content>
