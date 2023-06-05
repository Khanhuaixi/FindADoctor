<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageAppointment.aspx.cs" Inherits="FindADoctor.Web_Forms.ManageAppointment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron jumbotron-fluid" style="background: url(https://www.sunwaymedical.com/images/uploads/page/SUN_about-us-1.jpg) no-repeat top center; background-size: cover;">
        <div class="container">
            <h1>
                <asp:Label ID="appointmentManagementLabel" runat="server" Text='Appointment' />
            </h1>
            <p class="lead">
                <asp:Label ID="appointmentManagementDescriptionLabel" runat="server" Text='Manage appointment here' />
            </p>
        </div>
    </div>


    <div class="card-body">
        <div class="row">
            <div class="col-md-12">
                <div class="form-group">
                    <div class="table-responsive">
                        <asp:GridView ID="gridView" Width="100%"
                            CssClass="table table-borderless table-sm table-hover"
                            RowStyle-CssClass=""
                            runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="dsAppointment" >
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
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Button ID="cancelAppointmentButton" class="btn btn-danger" runat="server" Text="Cancel Appointment" OnClick="cancelAppointmentButton_Click" UseSubmitBehavior="false" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Button ID="feedbackButton" class="btn btn-secondary" runat="server" Text="Feedback" OnClick="feedbackButton_Click" UseSubmitBehavior="false" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>

                        <asp:Label ID="idLabel" runat="server" Text="Label" hidden="true"></asp:Label>
                        <asp:Label ID="appointmentIdLabel" runat="server" Text="Label" hidden="true"></asp:Label>
                        <asp:Label ID="appointmentDateLabel" runat="server" Text="Label" hidden="true"></asp:Label>
                        <asp:Label ID="doctorIdLabel" runat="server" Text="Label" hidden="true"></asp:Label>
                        <asp:Label ID="memberIdLabel" runat="server" Text="Label" hidden="true"></asp:Label>
                        <asp:Label ID="appointmentCreatedDateLabel" runat="server" Text="Label" hidden="true"></asp:Label>
                        <asp:Label ID="appointmentFeedbackLabel" runat="server" Text="Label" hidden="true"></asp:Label>
                        <asp:Label ID="appointmentStatusLabel" runat="server" Text="Label" hidden="true"></asp:Label>
                        <asp:Label ID="doctorFullnameLabel" runat="server" Text="Label" hidden="true"></asp:Label>
                        <br />

                        <br />
                    </div>
                </div>
            </div>
        </div>
    </div>

    <asp:SqlDataSource ID="dsAppointment" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [tblAppointment] WHERE [Id] = @Id" InsertCommand="INSERT INTO [tblAppointment] ([appointmentDate], [doctorId], [memberId], [appointmentCreatedDate], [appointmentFeedback], [appointmentStatus], [doctorFullname]) VALUES ( @appointmentDate, @doctorId, @memberId, @appointmentCreatedDate, @appointmentFeedback, @appointmentStatus, @doctorFullname)" SelectCommand="SELECT * FROM [tblAppointment]  WHERE ([memberId] = @memberId)" UpdateCommand="UPDATE [tblAppointment] SET [appointmentId] = @appointmentId, [appointmentDate] = @appointmentDate, [appointmentCreatedDate] = @appointmentCreatedDate, [appointmentFeedback] = @appointmentFeedback, [appointmentStatus] = @appointmentStatus, [doctorFullname] = @doctorFullname WHERE [appointmentId] = @appointmentId">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="M1" Name="memberId" SessionField="memberId" Type="String" />
        </SelectParameters>
        <DeleteParameters>
            <asp:ControlParameter ControlID="idLabel" Name="Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="idLabel" Name="Id" Type="Int32" />
            <asp:ControlParameter ControlID="appointmentIdLabel" Name="appointmentId" Type="String" />
            <asp:ControlParameter ControlID="appointmentDateLabel" Name="appointmentDate" Type="String" />
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
            <asp:ControlParameter ControlID="appointmentDateLabel" Name="appointmentDate" Type="String" />
            <asp:ControlParameter ControlID="doctorIdLabel" Name="doctorId" Type="String" />
            <asp:ControlParameter ControlID="doctorFullnameLabel" Name="doctorFullname" Type="String" />
            <asp:ControlParameter ControlID="memberIdLabel" Name="memberId" Type="String" />
            <asp:ControlParameter ControlID="appointmentCreatedDateLabel" Name="appointmentCreatedDate" Type="String" />
            <asp:ControlParameter ControlID="appointmentFeedbackLabel" Name="appointmentFeedback" Type="String" />
            <asp:ControlParameter ControlID="appointmentStatusLabel" Name="appointmentStatus" Type="String" />
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
                    <asp:Button ID="confirmButton" class="btn btn-primary" runat="server" Text="Confirm" OnClick="confirmButton_Click" UseSubmitBehavior="false" />
                    <button id="closeButton" type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <div id="MyFeedbackPopUpModal" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title"></h4>
                    <button type="button" class="close" data-dismiss="modal">
                        &times;</button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-10 col-md-offset-1">
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="feedbackTextBox"><b>Feedback</b></asp:Label><br />
                                <%--<input runat="server" type="text" class="form-control" id="feedbackInput" aria-describedby="feedbackInputDescription" placeholder="Enter Your Feedback Here" />--%>
                                <asp:TextBox ID="feedbackTextBox" class="form-control" TextMode="MultiLine" Columns="50" Rows="5" placeholder="Enter Your Feedback Here" required="required" Enabled="True" runat="server" /><br />
                                <small id="feedbackInputDescription" class="form-text text-muted">We appreciate your valuable feedback.</small>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="submitButton" class="btn btn-primary" runat="server" Text="Submit" OnClick="submitButton_Click" UseSubmitBehavior="false" />
                    <button id="cancelButton" type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
                </div>
            </div>
        </div>
    </div>

    <div id="MyErrorPopUpModal" class="modal fade" role="dialog">
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
                    <button id="errorModalCloseButton" type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>


</asp:Content>
