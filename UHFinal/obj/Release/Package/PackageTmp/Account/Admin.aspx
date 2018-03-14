<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="UHFinal.Account.Admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="form-horizontal">
        <h4>Update your account</h4>
        <hr />
        <div class="form-group">
            
            <asp:Label runat="server" AssociatedControlID="UserName" CssClass="col-md-2 control-label" ID="Label1" Visible="True">Your User Name (cannot be changed)</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="UserName" CssClass="form-control" Visible="True" Enabled="False" />
            </div>
        
            <asp:Image runat="server" ID="UserImage" class="img-thumbnail" style="height:200px; Width:auto" />
       </div> 
        
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="UserPicture" CssClass="col-md-2 control-label">Change your user picture</asp:Label>
            <div class="col-md-10">
                <asp:FileUpload runat="server" ID="UserPicture" CssClass="form-control" />
            </div>
        </div>
        
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ArtistIntro" CssClass="col-md-2 control-label" ID="lblInfo" Visible="True">Please enter information about yourself as an artist</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="ArtistIntro" CssClass="form-control" Visible="True" Height="121px" Width="402px" />
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button runat="server" Text="Update Profile" CssClass="btn btn-default" OnClick="UpdateUser_Click"/>
                <asp:Label ID="lblError" runat="server"></asp:Label>
            </div>
        </div>

    </div>

</asp:Content>