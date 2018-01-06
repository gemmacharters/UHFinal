<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="UHFinal._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server" >
    
<style>
		/* Dimensions set via css in MovingBoxes version 2.2.2+ */
		#slider { width: 500px; }
		#slider li { width: 350px; }

    .imgScale {
        width: 80px; /* You can set the dimensions to whatever you want */
        height: 80px;
        object-fit: cover;
        padding: 5px;
        border: 2px solid lightgray;
    }

	</style>

	<script>
	$(function(){

		$('#slider').movingBoxes({
			/* width and panelWidth options deprecated, but still work to keep the plugin backwards compatible
			width: 500,
			panelWidth: 0.5,
			*/
			startPanel   : 1,      // start with this panel
			wrap         : true,  // if true, the panel will infinitely loop
			buildNav     : false,   // if true, navigation links will be added
			navFormatter : function(){ return "&#9679;"; } // function which returns the navigation text for each panel
		});

	});
	</script>


    <asp:SqlDataSource ID="SqlArtwork" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT Artwork.ArtName, Artwork.ArtworkPicture, Artwork.ArtDescription, Artwork.ArtworkID, LikesCount.CountOf FROM Artwork LEFT OUTER JOIN LikesCount ON Artwork.ArtworkID = LikesCount.ArtworkID ORDER BY LikesCount.CountOf DESC"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlRecent" runat="server" ConnectionString="<%$ ConnectionStrings:defaultConnection %>" 
            SelectCommand="SELECT TOP 5 ArtworkID, ArtName, ArtworkPicture, UploadDate FROM Artwork ORDER BY UploadDate DESC">
        
    </asp:SqlDataSource>
    <div style="padding:5px">
        <img src="images/list5.png" alt="banner" style="width:100%;height:auto;"/>
    </div>
    <div class="row" style="padding:10px" >
        <div class="col-md-4" >
            <h2>Welcome To You</h2>
            <p>
                This website is for the City of Liverpool College UAL Character Art students. 
            Once registered as an artist you will be able to upload up to 10 pieces of artwork. 
            These can be liked, rated and commented on by other students and visitors to the site.This is a prototype version of the site.
            </p>
            <h3>Recently added:</h3>
            <asp:GridView ID="gvrecent" runat="server" AutoGenerateColumns="False" DataKeyNames="ArtworkID" DataSourceID="SqlRecent" AllowSorting="True" AllowPaging="True" Width="100%">
                <Columns>
                    <asp:TemplateField HeaderText="Artwork">
                        <ItemTemplate>
                        <asp:HyperLink runat="server" NavigateUrl='<%# "ArtworkDetail.aspx?ArtworkID=" + Eval("ArtworkID") %>' >
                        <img src='<%# Eval("ArtworkPicture") %>'  alt="Artwork Picture" class="imgScale"/>
                        </asp:HyperLink>
                    </ItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:BoundField DataField="ArtName" HeaderText="Title of Artwork" SortExpression="ArtName">
                    </asp:BoundField>
                    <asp:BoundField DataField="UploadDate" HeaderText="Date/Time uploaded">
                    </asp:BoundField>
                    
                </Columns>
            </asp:GridView>--
        </div>
        <div class="col-md-8" style="text-align:center">
            <h2>Top 10 most popular</h2>
            <div id="wrapper">
            <ul id="slider">
            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlArtwork">
                <ItemTemplate>
                    <li>
                    <asp:HyperLink runat="server" NavigateUrl='<%# "ArtworkDetail.aspx?ArtworkID=" + Eval("ArtworkID") %>' >
                    <img src='<%# Eval("ArtworkPicture") %>' />
                    </asp:HyperLink>
                        <h3><%# Eval("ArtName") %></h3>
                        <p><%# Eval("ArtDescription") %> </p>
                        <p>Likes: <%# Eval("CountOf") %></p>
                    </li>
                </ItemTemplate>
            </asp:Repeater>
            </ul>
        </div>
        </div>
    </div>

</asp:Content>
