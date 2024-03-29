﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddArtwork.aspx.cs" Inherits="UHFinal.AddArtwork" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <style>
        .itemPadding {
            padding:5px;
        }

    </style>
    <div style="padding:5px">
        <img src="images/list5.png" alt="banner" style="width:100%;height:auto;"/>
    </div>
    <asp:SqlDataSource ID="SqluserAccount" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT AspNetUsers.Id, AspNetUsers.UserName, UserAccount.UserPicture FROM UserAccount INNER JOIN AspNetUsers ON UserAccount.UserID = AspNetUsers.Id WHERE AspNetUsers.Id = @userID">
            <SelectParameters>
                <asp:SessionParameter Name="userID" SessionField="userID" />
            </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlCategory" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [CategoryID], [CategoryName] FROM [Category]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlHashtag" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [HID], [Hashtag] FROM [Hashtag]"></asp:SqlDataSource>
     <div class="row" style="padding:10px" >
        <div class="col-md-4" >
            <h2>Add your Artwork</h2>
            <p>
                Upload your artwork, the name will appear on a showcase and the description should be concise. The category reflects how you would like this work to be sorted professionally. Hashtags are more informal and you can add your own hashtag to reflect more precisely the work within its niche.
            </p></div>
        <div class="col-md-8" style="padding:10px;border-style:solid;border-width:5px;border-radius:15px;border-color:lightgray">
            <%--<div class="well well-sm">
                
                <asp:FormView ID="fvUser" runat="server" DataSourceID="SqluserAccount">
                    <ItemTemplate>
                        <p>Artist: <%# Eval("userName") %>
                        
                        <img src='<%# Eval("UserPicture") %>'  alt="Artist Picture" class="img-thumbnail" style="width:100px;height:auto;"/></p>
                        
                    </ItemTemplate>
                </asp:FormView>
            </div>--%>
    
            <div class="row">
                <div class="col-md-6">
                    <div class="row itemPadding">
                        <div class="col-md-4">Artwork Name</div>
                        <div class="col-md-8"><asp:TextBox ID="txtArtName" runat="server"></asp:TextBox></div>
                    </div>
                    <div class="row itemPadding">
                        <div class="col-md-4">Artwork Description</div>
                        <div class="col-md-8"><asp:TextBox ID="txtArtDesc" runat="server" Height="122px" TextMode="MultiLine" Width="223px"></asp:TextBox></div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="row itemPadding">
                        <div class="col-md-4">Artwork Picture</div>
                        <div class="col-md-8"><asp:TextBox ID="txtArtworkPicture" runat="server"></asp:TextBox>
                                            <asp:FileUpload ID="fupArtwork" runat="server" Height="34px"></asp:FileUpload>

                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="row itemPadding">
                        <div class="col-md-2">Category</div>
                        <div class="col-md-10">
                            <asp:RadioButtonList ID="lstCategory" runat="server" DataSourceID="SqlCategory" DataTextField="CategoryName" DataValueField="CategoryID" RepeatDirection="Horizontal" BorderStyle="Inset" CellPadding="10" RepeatColumns="5" Width="100%">
                            </asp:RadioButtonList></div>
                    </div>
                    <div class="row itemPadding">
                        <div class="col-md-2">Hashtags</div>
                        <div class="col-md-10">
                            <asp:CheckBoxList ID="chkHashtag" runat="server" DataSourceID="SqlHashtag" DataTextField="Hashtag" DataValueField="HID" BorderStyle="Inset" RepeatColumns="5" RepeatDirection="Horizontal" CellPadding="10" Width="100%">
                            </asp:CheckBoxList>
                        <div class="row itemPadding">
                            <div class="col-md-2">Add new hashtag, only one and no more than 20 characters</div>
                            <div class="col-md-10"><asp:TextBox ID="txtAddHashtag" runat="server" MaxLength="20"></asp:TextBox>

                        </div>
                        </div>
                            </div>
                    </div>
                <div class="row">
                <div class="col-md-12">
                    <div class="row itemPadding">
                        <div class="col-md-2">Click to submit</div>
                        <div class="col-md-10"><asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Submit" />&nbsp;
                        <asp:Label ID="lblError" runat="server"></asp:Label></div>
                    </div>
                </div>
             </div>
                    </div>
                </div>
            </div>
    <%--<script>
        $(document).ready(function () {
            $('input').each(function () {
                var self = $(this),
                    label = self.next(),
                    label_text = label.text();

                label.remove();
                self.iCheck({
                    checkboxClass: 'icheckbox_line',
                    radioClass: 'iradio_line',
                    insert: '<div class="icheck_line-icon"></div>' + label_text
                });
            });
        });--%>
<%--</script>--%>
</asp:Content>

