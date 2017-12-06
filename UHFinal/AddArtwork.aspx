<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddArtwork.aspx.cs" Inherits="UHFinal.AddArtwork" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <p class="lead" style="clear:both">Add Artwork. Please use the form below to add your artwork. The description should reflect some of the ideas you wish to express. </p>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT AspNetUsers.Id, AspNetUsers.UserName, UserAccount.UserPicture FROM UserAccount INNER JOIN AspNetUsers ON UserAccount.UserID = AspNetUsers.Id WHERE AspNetUsers.Id = @userID">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="afcad2c2-8807-4801-aa25-0c22d216b6ae" Name="userID" QueryStringField="x" />
            </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [CategoryID], [CategoryName] FROM [Category]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [HID], [Hashtag] FROM [Hashtag]"></asp:SqlDataSource>
    <div class="well well-lg">
                
                <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource1">
                    <ItemTemplate>
                        <p>Artist: <%# Eval("userName") %>
                        <img src='<%# Eval("UserPicture") %>'  alt="Artist Picture" class="img-thumbnail" style="padding:20px;width:50%;"/></p>
                    </ItemTemplate>
                </asp:FormView>
    </div>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-8">
                <div class="row">
                    <div class="col-md-3">Artwork Name</div>
                    <div class="col-md-9"><asp:TextBox ID="txtArtName" runat="server"></asp:TextBox></div>
                    </div>
                <div class="row">
                    <div class="col-md-3">Artwork Description</div>
                    <div class="col-md-9"><asp:TextBox ID="txtArtDesc" runat="server" Height="122px" TextMode="MultiLine" Width="223px"></asp:TextBox></div>
                </div>
                <div class="row">
                    <div class="col-md-3">Artwork Picture</div>
                    <div class="col-md-9"><asp:TextBox ID="txtArtworkPicture" runat="server"></asp:TextBox>
                                        <asp:FileUpload ID="fupArtwork" runat="server" Height="34px" /></div>
                </div>
                <div class="row">
                    <div class="col-md-3">Category</div>
                    <div class="col-md-9">
                        <asp:RadioButtonList ID="lstCategory" runat="server" DataSourceID="SqlDataSource2" DataTextField="CategoryName" DataValueField="CategoryID" RepeatDirection="Horizontal" BorderStyle="Inset" CellPadding="10" RepeatColumns="5">
                        </asp:RadioButtonList>
                        
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3">Hashtags</div>
                    <div class="col-md-9">
                        <asp:CheckBoxList ID="chkHashtag" runat="server" DataSourceID="SqlDataSource3" DataTextField="Hashtag" DataValueField="HID" BorderStyle="Groove" RepeatColumns="5" RepeatDirection="Horizontal">
                        </asp:CheckBoxList>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3">
                        
                    </div>
                    <div class="col-md-9"><asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Submit" />&nbsp;
                                            <asp:Label ID="lblError" runat="server"></asp:Label></div>
                </div>
            </div>
            <div class="col-md-4">
                <asp:Image ID="Image1" runat="server" />
            </div>
        </div>    
    </div>
</asp:Content>
