<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminMemberManagement.aspx.cs" Inherits="FindADoctor.Web_Forms.AdminMemberManagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron jumbotron-fluid text-white" style="background: url(https://www.sunmedvelocity.com.my/images/promo_bg.jpg) no-repeat top center; background-size: cover;">
        <div class="container">
            <h1>
                <asp:Label ID="memberManagementLabel" runat="server" Text="Member Management"></asp:Label></h1>
            <p class="lead">
                <asp:Label ID="memberManagementDescriptionLabel" runat="server" Text="Manage member account here"></asp:Label>
            </p>
        </div>
    </div>

    <div class="card-body">
        <div style="position: absolute; right: 550px;">
            <div class="message_alert" id="alert" role="alert">
            </div>
        </div>

        <div class="row">
            <div class="col-md-4 col-md-offset-1">
                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="memberFirstNameTextBox"><b>First Name</b></asp:Label><br />
                    <asp:TextBox runat="server" required="required" Enabled="True" name="memberFirstNameTextBox" ID="memberFirstNameTextBox" class="form-control input-sm" placeholder="First Name"></asp:TextBox>

                </div>
            </div>
            <div class="col-md-4 col-md-offset-1">
                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="memberLastNameTextBox"><b>Last Name</b></asp:Label><br />
                    <asp:TextBox runat="server" required="required" Enabled="True" name="MemberLastNameTextBox" ID="memberLastNameTextBox" class="form-control input-sm" placeholder="Last Name"></asp:TextBox>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-4 col-md-offset-1">
                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="memberEmailTextBox"><b>Email</b></asp:Label><br />
                    <asp:TextBox runat="server" required="required" TextMode="Email" Enabled="True" name="MemberEmailTextBox" ID="memberEmailTextBox" class="form-control input-sm" placeholder="Email"></asp:TextBox>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-4 col-md-offset-1">
                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="memberGenderRadioButtonList"><b>Gender</b></asp:Label><br />
                    <asp:RadioButtonList CssClass="form-group" ID="memberGenderRadioButtonList" runat="server" required="required">
                        <asp:ListItem Value="Male" Text="Male" />
                        <asp:ListItem Value="Female" Text="Female" />
                    </asp:RadioButtonList>

                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-10 col-md-offset-1">
                <div class="form-group">
                    <asp:Button Text="Add" ID="addButton" OnClick="addButton_Click" CssClass="btn btn-success btn-lg" Width="170px" runat="server" />
                    <asp:Button Text="Update" ID="updateButton" OnClick="updateButton_Click" CssClass="btn btn-info btn-lg" Width="170px" runat="server" />
                    <asp:Button Text="Delete" ID="deleteButton" OnClick="deleteButton_Click" CssClass="btn btn-danger btn-lg" Width="170px" runat="server" />
                    <asp:Button Text="Clear" ID="clearButton" OnClick="clearButton_Click" CssClass="btn btn-light btn-lg" Width="170px" runat="server" UseSubmitBehavior="false"/>
                </div>
            </div>

        </div>

        <div class="row">
            <div class="col-md-12">
                <div class="form-group">
                    <div class="table-responsive">
                        <asp:GridView ID="gridView" Width="100%" AutoGenerateSelectButton="True"
                            OnSelectedIndexChanged="gridView_SelectedIndexChanged"
                            CssClass="table table-borderless table-sm table-hover"
                            RowStyle-CssClass=""
                            runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="dsMember">
                            <AlternatingRowStyle BackColor="White" />
                            <HeaderStyle BackColor="#6B696B" Font-Bold="true" Font-Size="Larger" ForeColor="White" />
                            <RowStyle BackColor="#f5f5f5" />
                            <SelectedRowStyle BackColor="#669999" Font-Bold="true" ForeColor="White" />
                            <Columns>
                                <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="true" InsertVisible="False" SortExpression="Id" />
                                <asp:BoundField DataField="memberId" HeaderText="Member Id" SortExpression="memberId" />
                                <asp:BoundField DataField="memberFirstName" HeaderText="First Name" SortExpression="memberFirstName" />
                                <asp:BoundField DataField="memberLastName" HeaderText="Last Name" SortExpression="memberLastName" />
                                <asp:BoundField DataField="memberEmail" HeaderText="Email" SortExpression="memberEmail" />
                                <asp:BoundField DataField="memberGender" HeaderText="Gender" SortExpression="memberGender" />
                                <asp:BoundField DataField="memberCreatedDate" HeaderText="Created Date" SortExpression="memberCreatedDate" />
                                <asp:BoundField DataField="memberPassword" HeaderText="Password" SortExpression="memberPassword" />
                            </Columns>
                        </asp:GridView>

                        <asp:Label ID="idLabel" runat="server" Text="Label" hidden="true"></asp:Label>
                        <asp:Label ID="memberIdLabel" runat="server" Text="Label" hidden="true"></asp:Label>
                        <asp:Label ID="memberCreatedDateLabel" runat="server" Text="Label" hidden="true"></asp:Label>
                        <asp:Label ID="memberPasswordLabel" runat="server" Text="Label" hidden="true"></asp:Label>

                        <br />
                        <asp:SqlDataSource ID="dsMember" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                            DeleteCommand="DELETE FROM [tblMember] WHERE [Id] = @Id" 
                            InsertCommand="INSERT INTO [tblMember] ([memberId], [memberFirstName], [memberLastName], [memberEmail], [memberGender], [memberCreatedDate], [memberPassword]) VALUES (@memberId, @memberFirstName, @memberLastName, @memberEmail, @memberGender, @memberCreatedDate, @memberPassword)" 
                            SelectCommand="SELECT * FROM [tblMember]" 
                            UpdateCommand="UPDATE [tblMember] SET [memberId] = @memberId, [memberFirstName] = @memberFirstName, [memberLastName] = @memberLastName, [memberEmail] = @memberEmail, [memberGender] = @memberGender, [memberCreatedDate] = @memberCreatedDate, [memberPassword] = @memberPassword WHERE [Id] = @Id">
                            <DeleteParameters>
                                <asp:ControlParameter ControlID="idLabel" Name="Id" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:ControlParameter ControlID="memberIdLabel" Name="memberId" Type="String" />
                                <asp:ControlParameter ControlID="memberFirstNameTextBox" Name="memberFirstName" Type="String" />
                                <asp:ControlParameter ControlID="memberLastNameTextBox" Name="memberLastName" Type="String" />
                                <asp:ControlParameter ControlID="memberEmailTextBox" Name="memberEmail" Type="String" />
                                <asp:ControlParameter ControlID="memberGenderRadioButtonList" Name="memberGender" Type="String" />
                                <asp:ControlParameter ControlID="memberCreatedDateLabel" DbType="DateTime2" Name="memberCreatedDate" />
                                <asp:ControlParameter ControlID="memberPasswordLabel" Name="memberPassword" Type="String" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:ControlParameter ControlID="idLabel" Name="Id" Type="Int32" />
                                <asp:ControlParameter ControlID="memberIdLabel" Name="memberId" Type="String" />
                                <asp:ControlParameter ControlID="memberFirstNameTextBox" Name="memberFirstName" Type="String" />
                                <asp:ControlParameter ControlID="memberLastNameTextBox" Name="memberLastName" Type="String" />
                                <asp:ControlParameter ControlID="memberEmailTextBox" Name="memberEmail" Type="String" />
                                <asp:ControlParameter ControlID="memberGenderRadioButtonList" Name="memberGender" Type="String" />
                                <asp:ControlParameter ControlID="memberCreatedDateLabel" DbType="DateTime2" Name="memberCreatedDate" />
                                <asp:ControlParameter ControlID="memberPasswordLabel" Name="memberPassword" Type="String" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
