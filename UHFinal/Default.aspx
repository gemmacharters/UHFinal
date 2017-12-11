<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="UHFinal._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron" style="background-image:url(/images/malehead.gif)">
        <p>This website is for the City of Liverpool College UAL Character Art students. 
            Once registered as an artist you will be able to upload up to 10 pieces of artwork. 
            These can be liked, rated and commented on by other students and visitors to the site.This is a prototype version of the site. </p>
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
