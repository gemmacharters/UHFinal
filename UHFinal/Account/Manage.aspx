<%@ Page Title="Manage Account" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Manage.aspx.cs" Inherits="UHFinal.Account.Manage" %>

<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>

    <div>
        <asp:PlaceHolder runat="server" ID="successMessage" Visible="false" ViewStateMode="Disabled">
            <p class="text-success"><%: SuccessMessage %></p>
        </asp:PlaceHolder>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="form-horizontal">
                <h4>Change your account settings</h4>
                <hr />
                <dl class="dl-horizontal">
                    <dt>Password:</dt>
                    <dd>
                        <asp:HyperLink NavigateUrl="/Account/ManagePassword" Text="[Change]" Visible="false" ID="ChangePassword" runat="server" />

                    </dd>
                    
                    <dt>Edit Profile:</dt>
                    <dd>
                        <asp:HyperLink NavigateUrl="/Account/Admin" Text="[Change]" Visible="false" ID="admin" runat="server" />
                    </dd>

                    <dd>
                        <asp:HyperLink NavigateUrl="/Account/Approval" Text="Administrator Only [Approve Users]" Visible="false" ID="approve" runat="server" />
                    </dd>
                </dl>
            </div>
        </div>
    </div>

</asp:Content>
