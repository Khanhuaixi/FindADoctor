<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageProfile.aspx.cs" Inherits="FindADoctor.Web_Forms.ManageProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron jumbotron-fluid" style="background: url(https://www.sunwaymedical.com/images/uploads/page/SUN_sunmed-pulse-1.jpg) no-repeat top center; background-size: cover;">
        <div class="container">
            <h1>
                <asp:Label ID="manageProfileLabel" runat="server" Text='Manage Profile' />
            </h1>
            <p class="lead">
                <asp:Label ID="manageProfileDescriptionLabel" runat="server" Text='You can edit your profile here' />
            </p>
        </div>
    </div>

    <div class="album py-5 bg-light" style="padding-bottom: 0px;">
        <div class="container">
            <div class="card-body">
                <div class="row">
                    <div class="col-md-4 col-md-offset-1">
                        <div class="form-group">
                            <asp:Label runat="server" AssociatedControlID="firstNameTextBox"><b>First Name</b></asp:Label><br />
                            <asp:TextBox runat="server" required="required" Enabled="True" name="firstNameTextBox" ID="firstNameTextBox" class="form-control input-sm" placeholder="First Name"></asp:TextBox>

                        </div>
                    </div>
                    <div class="col-md-4 col-md-offset-1">
                        <div class="form-group">
                            <asp:Label runat="server" AssociatedControlID="lastNameTextBox"><b>Last Name</b></asp:Label><br />
                            <asp:TextBox runat="server" required="required" Enabled="True" name="lastNameTextBox" ID="lastNameTextBox" class="form-control input-sm" placeholder="Last Name"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-4 col-md-offset-1">
                        <div class="form-group">
                            <asp:Label runat="server" AssociatedControlID="genderDropDownList"><b>Gender</b></asp:Label><br />
                            <asp:DropDownList ID="genderDropDownList" class="form-control input-sm" runat="server">
                                <asp:ListItem Selected="True" Value="Male">Male</asp:ListItem>
                                <asp:ListItem Value="Female">Female</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-4 col-md-offset-1">
                        <div class="form-group">
                            <asp:Button ID="changePasswordButton" class="btn btn-secondary btn-lg" runat="server" Text="Change Password" OnClick="changePasswordButton_Click" />
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
