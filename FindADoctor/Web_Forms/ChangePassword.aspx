<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="FindADoctor.Web_Forms.ChangePassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron jumbotron-fluid" style="background: url(https://www.sunwaymedical.com/images/uploads/page/SUN_sunmed-pulse-1.jpg) no-repeat top center; background-size: cover;">
        <div class="container">
            <h1>
                <asp:Label ID="changePasswordTitleLabel" runat="server" Text='Change Password' />
            </h1>
        </div>
    </div>

    <div class="album py-5 bg-light" style="padding-bottom: 0px;">
        <div class="container">
            <div class="card-body">
                <div class="row">
                    <div class="col-md-4 col-md-offset-1">
                        <div class="form-group">
                            <asp:Label runat="server" AssociatedControlID="oldPasswordTextBox"><b>Current Password</b></asp:Label><br />
                            <asp:TextBox runat="server" TextMode="Password" required="required" Enabled="True" name="oldPasswordTextBox" ID="oldPasswordTextBox" class="form-control input-sm" placeholder="Current Password"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-4 col-md-offset-1">
                        <div class="form-group">
                            <asp:Label runat="server" AssociatedControlID="newPasswordTextBox"><b>New Password</b></asp:Label><br />
                            <asp:TextBox runat="server" TextMode="Password" required="required" Enabled="True" name="newPasswordTextBox" ID="newPasswordTextBox" class="form-control input-sm" placeholder="New Password"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-4 col-md-offset-1">
                        <div class="form-group">
                            <asp:Label runat="server" AssociatedControlID="confirmNewPasswordTextBox"><b>Confirm Password</b></asp:Label><br />
                            <asp:TextBox runat="server" TextMode="Password" required="required" Enabled="True" name="confirmNewPasswordTextBox" ID="confirmNewPasswordTextBox" class="form-control input-sm" placeholder="Confirm Password"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-4 col-md-offset-1">
                        <div class="form-group">
                            <asp:Button ID="saveButton" class="btn btn-primary btn-lg" runat="server" Text="Save" OnClick="saveButton_Click" />
                        </div>
                    </div>
                </div>

                <asp:Label ID="memberIdLabel" runat="server" Text="Label" hidden="true"></asp:Label>
                <asp:Label ID="memberCreatedDateLabel" runat="server" Text="Label" hidden="true"></asp:Label>

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
                    <button type="button" class="btn btn-primary" data-dismiss="modal">
                        Close</button>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
