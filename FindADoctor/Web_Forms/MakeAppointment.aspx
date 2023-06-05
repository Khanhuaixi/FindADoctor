<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MakeAppointment.aspx.cs" Inherits="FindADoctor.Web_Forms.MakeAppointment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron jumbotron-fluid text-white" style="background: rgb(225 36 84 / 0.90);">
        <div class="container">
            <h1>
                <asp:Label ID="appointmentLabel" runat="server" Text="Appointment"></asp:Label></h1>
            <p class="lead">
                <asp:Label ID="appointmentDescriptionLabel" runat="server" Text="You can make your appointment here"></asp:Label>
            </p>
        </div>
    </div>

    <div class="album py-5 bg-light" style="padding-bottom: 0px;">
        <div class="container">
            <div class="card-body">
                <h3 class="card-title text-dark" id="cardTitleHeader">
                    <asp:Label ID="doctorFullNameTitleLabel" runat="server" Text='Dr.' />
                    <asp:Label ID="doctorFullNameLabel" runat="server" Text='' />
                </h3>

                <div class="row">
                    <div class="col-md-4 col-md-offset-1">
                        <div class="form-group">
                            <asp:Label runat="server" AssociatedControlID="appointmentDateTextBox"><b>Appointment Date</b></asp:Label><br />
                            <asp:TextBox runat="server" required="required" TextMode="Date" Enabled="True" name="AppointmentDateTextBox" ID="appointmentDateTextBox" class="form-control input-sm" placeholder="Appointment Date"></asp:TextBox>
                            <br />
                            <asp:Label ID="Label1" runat="server"><b>Every Appointment will be Scheduled at 9am</b></asp:Label><br />
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-4 col-md-offset-1">
                        <asp:Button ID="submitButton" class="btn btn-primary btn-lg" runat="server" Text="Submit" OnClick="submitButton_Click" />
                    </div>
                </div>

            </div>
        </div>
    </div>


    <asp:Label ID="idLabel" runat="server" hidden="true"></asp:Label>
    <asp:Label ID="appointmentIdLabel" runat="server" hidden="true" />
    <asp:Label ID="doctorIdLabel" runat="server" hidden="true" />
    <asp:Label ID="memberIdLabel" runat="server" hidden="true" />
    <asp:Label ID="appointmentCreatedDateLabel" runat="server" Text="Label" hidden="true"></asp:Label>
    <asp:Label ID="appointmentFeedbackLabel" runat="server" Text="Label" hidden="true"></asp:Label>
    <asp:Label ID="appointmentStatusLabel" runat="server" Text="Label" hidden="true"></asp:Label>


    <asp:SqlDataSource ID="dsAppointment" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [tblAppointment] WHERE [Id] = @Id" InsertCommand="INSERT INTO [tblAppointment] ([appointmentId], [appointmentDate], [doctorId], [memberId], [appointmentCreatedDate], [appointmentFeedback], [appointmentStatus], [doctorFullname]) VALUES (@appointmentId, @appointmentDate, @doctorId, @memberId, @appointmentCreatedDate, @appointmentFeedback, @appointmentStatus, @doctorFullname)" SelectCommand="SELECT * FROM [tblAppointment]" UpdateCommand="UPDATE [tblAppointment] SET [appointmentId] = @appointmentId, [appointmentDate] = @appointmentDate, [doctorId] = @doctorId, [memberId] = @memberId, [appointmentCreatedDate] = @appointmentCreatedDate, [appointmentFeedback] = @appointmentFeedback, [appointmentStatus] = @appointmentStatus, [doctorFullname] = @doctorFullname WHERE [Id] = @Id">
        <DeleteParameters>
            <asp:ControlParameter ControlID="idLabel" Name="Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="appointmentIdLabel" Name="appointmentId" Type="String" />
            <asp:ControlParameter ControlID="appointmentDateTextBox" Name="appointmentDate" Type="String" />
            <asp:ControlParameter ControlID="doctorIdLabel" Name="doctorId" Type="String" />
            <asp:ControlParameter ControlID="doctorFullnameLabel" Name="doctorFullname" Type="String" />
            <asp:ControlParameter ControlID="memberIdLabel" Name="memberId" Type="String" />
            <asp:ControlParameter ControlID="appointmentCreatedDateLabel" Name="appointmentCreatedDate" Type="String" />
            <asp:ControlParameter ControlID="appointmentFeedbackLabel" Name="appointmentFeedback" Type="String" />
            <asp:ControlParameter ControlID="appointmentStatusLabel" Name="appointmentStatus" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="idLabel" Name="Id" Type="Int32" />
            <asp:ControlParameter ControlID="appointmentIdLabel" Name="appointmentId" Type="String" />
            <asp:ControlParameter ControlID="appointmentDateTextBox" Name="appointmentDate" Type="String" />
            <asp:ControlParameter ControlID="doctorIdLabel" Name="doctorId" Type="String" />
            <asp:ControlParameter ControlID="doctorFullnameLabel" Name="doctorFullname" Type="String" />
            <asp:ControlParameter ControlID="memberIdLabel" Name="memberId" Type="String" />
            <asp:ControlParameter ControlID="appointmentCreatedDateLabel" Name="appointmentCreatedDate" Type="String" />
            <asp:ControlParameter ControlID="appointmentFeedbackLabel" Name="appointmentFeedback" Type="String" />
            <asp:ControlParameter ControlID="appointmentStatusRadioButtonList" Name="appointmentStatus" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <div id="PopUpModal" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title"></h4>
                    <button type="button" class="close" data-dismiss="modal">
                        &times;</button>
                </div>
                <div class="modal-body">
                </div>
                <div class="modal-footer">
                    <asp:Button ID="closeButton" class="btn btn-primary" runat="server" Text="Close" OnClick="closeButton_Click" />
                </div>
            </div>
        </div>
    </div>

</asp:Content>
