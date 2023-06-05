 <%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="FindADoctor.Web_Forms.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron jumbotron-fluid text-white" style="background: rgb(172 140 94 / 0.90);">
        <div class="container">
            <h1>
                <asp:Label ID="registerLabel" runat="server" Text="Register"></asp:Label></h1>
            <p class="lead">
                <asp:Label ID="registerDescriptionLabel" runat="server" Text="Welcome! Register your account here. Please provide your information"></asp:Label>
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
                            <asp:Label runat="server" AssociatedControlID="emailTextBox"><b>Email</b></asp:Label><br />
                            <asp:TextBox runat="server" required="required" Enabled="True" name="emailTextBox" ID="emailTextBox" class="form-control input-sm" placeholder="Email"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-4 col-md-offset-1">
                        <div class="form-group">
                            <asp:Label runat="server" AssociatedControlID="passwordTextBox"><b>Password</b></asp:Label><br />
                            <asp:TextBox runat="server" type="password" required="required" Enabled="True" name="passwordTextBox" ID="passwordTextBox" class="form-control input-sm" placeholder="Password"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-md-4 col-md-offset-1">
                        <div class="form-group">
                            <asp:Label runat="server" AssociatedControlID="confirmPasswordTextBox"><b>Confirm Password</b></asp:Label><br />
                            <asp:TextBox runat="server" type="password" required="required" Enabled="True" name="confirmPasswordTextBox" ID="confirmPasswordTextBox" class="form-control input-sm" placeholder="Confirm Password"></asp:TextBox>
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

                <asp:Label ID="memberIdLabel" runat="server" Text="Label" hidden="true"></asp:Label>
                <asp:Label ID="memberCreatedDateLabel" runat="server" Text="Label" hidden="true"></asp:Label>

                <div class="row">
                    <div class="col-md-4 col-md-offset-1">
                        <asp:Button ID="registerButton" class="btn btn-primary btn-lg" runat="server" Text="Register" OnClick="registerButton_Click" />
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

    <asp:SqlDataSource ID="dsMember" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        DeleteCommand="DELETE FROM [tblMember] WHERE [Id] = @Id"
        InsertCommand="INSERT INTO [tblMember] ([memberId], [memberFirstName], [memberLastName], [memberEmail], [memberGender], [memberCreatedDate], [memberPassword]) VALUES (@memberId, @memberFirstName, @memberLastName, @memberEmail, @memberGender, @memberCreatedDate, @memberPassword)"
        SelectCommand="SELECT * FROM [tblMember]"
        UpdateCommand="UPDATE [tblMember] SET [memberId] = @memberId, [memberFirstName] = @memberFirstName, [memberLastName] = @memberLastName, [memberEmail] = @memberEmail, [memberGender] = @memberGender, [memberCreatedDate] = @memberCreatedDate, [memberPassword] = @memberPassword WHERE [Id] = @Id">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="memberIdLabel" Name="memberId" Type="String" />
            <asp:ControlParameter ControlID="firstNameTextBox" Name="memberFirstName" Type="String" />
            <asp:ControlParameter ControlID="lastNameTextBox" Name="memberLastName" Type="String" />
            <asp:ControlParameter ControlID="emailTextBox" Name="memberEmail" Type="String" />
            <asp:ControlParameter ControlID="genderDropDownList" Name="memberGender" Type="String" />
            <asp:ControlParameter ControlID="memberCreatedDateLabel" Name="memberCreatedDate" Type="String" />
            <asp:ControlParameter ControlID="passwordTextBox" Name="memberPassword" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="memberId" Type="String" />
            <asp:Parameter Name="memberFirstName" Type="String" />
            <asp:Parameter Name="memberLastName" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="gender" Type="String" />
            <asp:Parameter Name="createdDate" DbType="DateTime2" />
            <asp:Parameter Name="password" Type="String" />
            <asp:Parameter Name="Id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>
