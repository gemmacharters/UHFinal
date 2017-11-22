﻿<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="UHFinal._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron" style="background-color:black;color:white">
        <p style="float:left"><img alt="" src="logo.png" /></p>
        <h1 style="text-align:center">UAL Character Art</h1>
        <p class="lead" style="clear:both">Welcome to the City of Liverpool College Character Art Showcase website. This course is accredited by
            UAL, the University of Arts London Awarding Body. </p>
        
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>Artist List</h2>
            <p>
                The talented Character Art students of the City Of Liverpool College would like to welcome you to our showcase website. Please browse the artists showcased here and view their work.
            </p>
            <p>
                <a class="btn btn-default" href="ArtistList.aspx">View Artists &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Forum</h2>
            <p>
                As a registered user you can add a thread to our forum, or comment and post on existing threads.
            </p>
            <p>
                <a class="btn btn-default" href="ThreadList.aspx">View Threads &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Search for artwork</h2>
            <p>
                The search facility allows you to look  for work you are interested in, by entering keywords and hashtags
            </p>
            <p>
                <a class="btn btn-default" href="ArtworkSearch.aspx">Search Here &raquo;</a>
            </p>
        </div>
    </div>

</asp:Content>
