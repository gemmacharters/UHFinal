﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ShowcaseNews.aspx.cs" Inherits="UHFinal.ShowcaseNews" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<style>
		/* Dimensions set via css in MovingBoxes version 2.2.2+ */
		#slider { width: 500px; }
		#slider li { width: 350px; }
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


    <asp:SqlDataSource ID="SqlArtwork" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [ArtName], [ArtworkPicture], [ArtDescription],[ArtworkID] FROM [Artwork]"></asp:SqlDataSource>
        <div id="wrapper">
            <ul id="slider">
            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlArtwork">
                <ItemTemplate>
                    <li>
                    <asp:HyperLink runat="server" NavigateUrl='<%# "ArtworkDetail.aspx?ArtworkID=" + Eval("ArtworkID") %>' >
                    <img src='<%# Eval("ArtworkPicture") %>' />
                    </asp:HyperLink>
                        <h2><%# Eval("ArtName") %></h2>
                        <p><%# Eval("ArtDescription") %></p>
                    </li>
                </ItemTemplate>
            </asp:Repeater>
            </ul>
        </div>

</asp:Content>
