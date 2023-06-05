<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminAppointmentManagement.aspx.cs" Inherits="FindADoctor.Web_Forms.AdminAppointmentManagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron jumbotron-fluid text-white" style="background: url(https://www.sunmedvelocity.com.my/images/promo_bg.jpg) no-repeat top center; background-size: cover;">
        <div class="container">
            <h1>
                <asp:Label ID="appointmentManagementLabel" runat="server" Text="Appointment Management"></asp:Label></h1>
            <p class="lead">
                <asp:Label ID="appointmentManagementDescriptionLabel" runat="server" Text="Manage appointment here"></asp:Label>
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
                    <asp:Label runat="server" AssociatedControlID="appointmentDateTextBox"><b>Appointment Date</b></asp:Label><br />
                    <asp:TextBox runat="server" required="required" TextMode="Date" Enabled="True" name="AppointmentDateTextBox" ID="appointmentDateTextBox" class="form-control input-sm" placeholder="Appointment Date"></asp:TextBox>
                    <br />
                    <asp:Label ID="appointmentDateLabel" runat="server"><b>Every Appointment will be Scheduled at 9am</b></asp:Label><br />
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-4 col-md-offset-1">
                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="doctorDropDownList"><b>Doctor Id</b></asp:Label><br />
                    <asp:DropDownList runat="server" required="required" ID="doctorDropDownList" class="form-control input-sm" placeholder="Doctor Id" DataSourceID="dsDoctor" DataTextField="doctorId" DataValueField="doctorId"></asp:DropDownList>
                </div>
            </div>
            <div class="col-md-4 col-md-offset-1">
                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="memberDropDownList"><b>Member Id</b></asp:Label><br />
                    <asp:DropDownList runat="server" required="required" ID="memberDropDownList" class="form-control input-sm" placeholder="Member Id" DataSourceID="dsMember" DataTextField="memberId" DataValueField="memberId"></asp:DropDownList>
                </div>
            </div>

        </div>

        <div class="row">
            <div class="col-md-4 col-md-offset-1">
                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="appointmentStatusRadioButtonList"><b>Status</b></asp:Label><br />
                    <asp:RadioButtonList CssClass="form-group" ID="appointmentStatusRadioButtonList" runat="server" required="required">
                        <asp:ListItem Value="Active" Text="Active" Selected="True" />
                        <asp:ListItem Value="Done" Text="Done" />
                        <asp:ListItem Value="Canceled" Text="Canceled" />
                    </asp:RadioButtonList>

                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-10 col-md-offset-1">
                <div class="form-group">
                    <asp:Button Text="Add" ID="addButton" OnClick="addButton_Click" CssClass="btn btn-success btn-lg" Width="170px" runat="server" />
                    <asp:Button Text="Update" ID="updateButton" OnClick="updateButton_Click" CssClass="btn btn-info btn-lg" Width="170px" runat="server" />
                    <asp:Button Text="Clear" ID="clearButton" OnClick="clearButton_Click" CssClass="btn btn-light btn-lg" Width="170px" runat="server" UseSubmitBehavior="false" />
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
                            runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="dsAppointment">
                            <AlternatingRowStyle BackColor="White" />
                            <HeaderStyle BackColor="#6B696B" Font-Bold="true" Font-Size="Larger" ForeColor="White" />
                            <RowStyle BackColor="#f5f5f5" />
                            <SelectedRowStyle BackColor="#669999" Font-Bold="true" ForeColor="White" />
                            <Columns>
                                <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="true" InsertVisible="False" SortExpression="Id" />
                                <asp:BoundField DataField="appointmentId" HeaderText="Appointment Id" SortExpression="appointmentId" />
                                <asp:BoundField DataField="appointmentDate" HeaderText="Appointment Date" SortExpression="appointmentDate" />
                                <asp:BoundField DataField="doctorId" HeaderText="Doctor Id" SortExpression="doctorId" />
                                <asp:BoundField DataField="doctorFullname" HeaderText="Doctor" SortExpression="doctorFullname" />
                                <asp:BoundField DataField="memberId" HeaderText="Member Id" SortExpression="memberId" />
                                <asp:BoundField DataField="appointmentCreatedDate" HeaderText="Created Date" SortExpression="appointmentCreatedDate" />
                                <asp:BoundField DataField="appointmentFeedback" HeaderText="Feedback" SortExpression="appointmentFeedback" />
                                <asp:BoundField DataField="appointmentStatus" HeaderText="Status" SortExpression="appointmentStatus" />
                            </Columns>
                        </asp:GridView>

                        <asp:Label ID="idLabel" runat="server" Text="Label" hidden="true"></asp:Label>
                        <asp:Label ID="appointmentIdLabel" runat="server" Text="Label" hidden="true"></asp:Label>
                        <asp:Label ID="appointmentCreatedDateLabel" runat="server" Text="Label" hidden="true"></asp:Label>
                        <asp:Label ID="appointmentFeedbackLabel" runat="server" Text="Label" hidden="true"></asp:Label>
                        <asp:Label ID="doctorFullnameLabel" runat="server" Text="Label" hidden="true"></asp:Label>
                        <br />

                        <asp:SqlDataSource ID="dsAppointment" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [tblAppointment] WHERE [Id] = @Id" InsertCommand="INSERT INTO [tblAppointment] ([appointmentId], [appointmentDate], [doctorId], [memberId], [appointmentCreatedDate], [appointmentFeedback], [appointmentStatus], [doctorFullname]) VALUES (@appointmentId, @appointmentDate, @doctorId, @memberId, @appointmentCreatedDate, @appointmentFeedback, @appointmentStatus, @doctorFullname)" SelectCommand="SELECT * FROM [tblAppointment]" UpdateCommand="UPDATE [tblAppointment] SET [appointmentId] = @appointmentId, [appointmentDate] = @appointmentDate, [doctorId] = @doctorId, [memberId] = @memberId, [appointmentCreatedDate] = @appointmentCreatedDate, [appointmentFeedback] = @appointmentFeedback, [appointmentStatus] = @appointmentStatus, doctorFullname = @doctorFullname WHERE [Id] = @Id">
                            <DeleteParameters>
                                <asp:ControlParameter ControlID="idLabel" Name="Id" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:ControlParameter ControlID="appointmentIdLabel" Name="appointmentId" Type="String" />
                                <asp:ControlParameter ControlID="appointmentDateTextBox" Name="appointmentDate" Type="String" />
                                <asp:ControlParameter ControlID="doctorDropDownList" Name="doctorId" Type="String" />
                                <asp:ControlParameter ControlID="doctorFullnameLabel" Name="doctorFullname" Type="String" />
                                <asp:ControlParameter ControlID="memberDropDownList" Name="memberId" Type="String" />
                                <asp:ControlParameter ControlID="appointmentCreatedDateLabel" Name="appointmentCreatedDate" Type="String" />
                                <asp:ControlParameter ControlID="appointmentFeedbackLabel" Name="appointmentFeedback" Type="String" />
                                <asp:ControlParameter ControlID="appointmentStatusRadioButtonList" Name="appointmentStatus" Type="String" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:ControlParameter ControlID="idLabel" Name="Id" Type="Int32" />
                                <asp:ControlParameter ControlID="appointmentIdLabel" Name="appointmentId" Type="String" />
                                <asp:ControlParameter ControlID="appointmentDateTextBox" Name="appointmentDate" Type="String" />
                                <asp:ControlParameter ControlID="doctorDropDownList" Name="doctorId" Type="String" />
                                <asp:ControlParameter ControlID="doctorFullnameLabel" Name="doctorFullname" Type="String" />
                                <asp:ControlParameter ControlID="memberDropDownList" Name="memberId" Type="String" />
                                <asp:ControlParameter ControlID="appointmentCreatedDateLabel" Name="appointmentCreatedDate" Type="String" />
                                <asp:ControlParameter ControlID="appointmentFeedbackLabel" Name="appointmentFeedback" Type="String" />
                                <asp:ControlParameter ControlID="appointmentStatusRadioButtonList" Name="appointmentStatus" Type="String" />
                            </UpdateParameters>
                        </asp:SqlDataSource>

                        <br />
                        <br />
                        <asp:SqlDataSource ID="dsDoctor" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [tblDoctor]"></asp:SqlDataSource>
                        <br />
                        <asp:SqlDataSource ID="dsMember" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [tblMember]"></asp:SqlDataSource>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
