<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="FindADoctor.Web_Forms.Login1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron jumbotron-fluid text-white" style="background: rgb(172 140 94 / 0.90);">
        <div class="container">
            <h1>
                <asp:Label ID="loginLabel" runat="server" Text="Login"></asp:Label></h1>
            <p class="lead">
                <asp:Label ID="loginDescriptionLabel" runat="server" Text="Welcome back"></asp:Label>
            </p>
        </div>
    </div>

    <div class="album py-5 bg-light" style="padding-bottom: 0px;">
        <div class="container">
            <div class="card-body">
                <div class="row">
                    <div class="col-md-4 col-md-offset-1">
                        <div class="form-group">
                            <asp:Label runat="server" AssociatedControlID="memberEmailTextBox"><b>Email</b></asp:Label><br />
                            <asp:TextBox runat="server" required="required" Enabled="True" name="memberEmailTextBox" ID="memberEmailTextBox" class="form-control input-sm" placeholder="Email"></asp:TextBox>

                        </div>
                    </div>
                    <div class="col-md-4 col-md-offset-1">
                        <div class="form-group">
                            <asp:Label runat="server" AssociatedControlID="memberPasswordTextBox"><b>Password</b></asp:Label><br />
                            <asp:TextBox runat="server" type="password" required="required" Enabled="True" name="MemberPasswordTextBox" ID="memberPasswordTextBox" class="form-control input-sm" placeholder="Last Name"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-4 col-md-offset-1">
                        <asp:Button ID="loginButton" class="btn btn-primary btn-lg" runat="server" Text="Login" OnClick="loginButton_Click" />
                    </div>
                </div>

            </div>
        </div>
    </div>


    <div id="PopUpModal" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title"></h4>
                    <button type="button" class="close" data-dismiss="modal">
                        &times;</button>
                </div>
                <div class="modal-body">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">
                        Close</button>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
