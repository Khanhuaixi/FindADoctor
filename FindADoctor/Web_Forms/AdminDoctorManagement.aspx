<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminDoctorManagement.aspx.cs" Inherits="FindADoctor.Web_Forms.AdminDoctorManagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron jumbotron-fluid text-white" style="background: url(https://www.sunmedvelocity.com.my/images/promo_bg.jpg) no-repeat top center; background-size: cover;">
        <div class="container">
            <h1>
                <asp:Label ID="doctorManagementLabel" runat="server" Text="Doctor Management"></asp:Label></h1>
            <p class="lead">
                <asp:Label ID="doctorManagementDescriptionLabel" runat="server" Text="Manage doctor here"></asp:Label>
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
                    <asp:Label runat="server" AssociatedControlID="doctorFullNameTextBox"><b>Full Name</b></asp:Label><br />
                    <asp:TextBox runat="server" required="required" Enabled="True" name="DoctorFullNameTextBox" ID="doctorFullNameTextBox" class="form-control input-sm" placeholder="Full Name"></asp:TextBox>

                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-4 col-md-offset-1">
                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="doctorGenderRadioButtonList"><b>Gender</b></asp:Label><br />
                    <asp:RadioButtonList CssClass="form-group" ID="doctorGenderRadioButtonList" runat="server" required="required">
                        <asp:ListItem Value="Male" Text="Male" />
                        <asp:ListItem Value="Female" Text="Female" />
                    </asp:RadioButtonList>

                </div>
            </div>
            <div class="col-md-4 col-md-offset-1">
                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="specialityRadioButtonList"><b>Speciality</b></asp:Label><br />
                    <asp:RadioButtonList CssClass="form-group" ID="specialityRadioButtonList" runat="server" required="required" DataSourceID="dsSpeciality" DataTextField="specialityName" DataValueField="specialityId">
                    </asp:RadioButtonList>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-4 col-md-offset-1">
                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="doctorLanguagesTextBox"><b>Languages</b></asp:Label><br />
                    <asp:TextBox runat="server" required="required" Enabled="True" name="DoctorLanguagesTextBox" ID="doctorLanguagesTextBox" class="form-control input-sm" placeholder="Languages"></asp:TextBox>
                </div>
            </div>
            <div class="col-md-4 col-md-offset-1">
                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="doctorQualificationsTextBox"><b>Qualifications</b></asp:Label><br />
                    <asp:TextBox runat="server" required="required" Enabled="True" name="DoctorQualificationsTextBox" ID="doctorQualificationsTextBox" class="form-control input-sm" placeholder="Qualifications"></asp:TextBox>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-4 col-md-offset-1">
                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="doctorLocationTextBox"><b>Location</b></asp:Label><br />
                    <asp:TextBox runat="server" required="required" Enabled="True" name="DoctorLocationTextBox" ID="doctorLocationTextBox" class="form-control input-sm" placeholder="Location"></asp:TextBox>
                </div>
            </div>
            <div class="col-md-4 col-md-offset-1">
                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="doctorContactTextBox"><b>Contact</b></asp:Label><br />
                    <asp:TextBox runat="server" required="required" Enabled="True" name="DoctorContactTextBox" ID="doctorContactTextBox" class="form-control input-sm" placeholder="Contact"></asp:TextBox>
                </div>
            </div>

        </div>

        <div class="row">
            <div class="col-md-4 col-md-offset-1">
                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="doctorImageFileUpload"><b>Doctor Image</b></asp:Label><br />
                    <asp:FileUpload ID="doctorImageFileUpload" runat="server" /><br />
                    <asp:Label ID="doctorImageFileNameLabel" runat="server" Text="Please Upload An Image"></asp:Label>
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
                            CssClass="table table-borderless table-sm table-responsive table-hover"
                            RowStyle-CssClass=""
                            runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="dsDoctor">
                            <AlternatingRowStyle BackColor="White" />
                            <HeaderStyle BackColor="#6B696B" Font-Bold="true" Font-Size="Larger" ForeColor="White" />
                            <RowStyle BackColor="#f5f5f5" />
                            <SelectedRowStyle BackColor="#669999" Font-Bold="true" ForeColor="White" />
                            <Columns>
                                <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="true" InsertVisible="False" SortExpression="Id" />
                                <asp:BoundField DataField="doctorId" HeaderText="Doctor Id" SortExpression="doctorId" />
                                <asp:BoundField DataField="doctorFullName" HeaderText="Full Name" SortExpression="doctorFullName" />
                                <asp:BoundField DataField="doctorGender" HeaderText="Gender" SortExpression="doctorGender" />
                                <asp:BoundField DataField="specialityId" HeaderText="Speciality Id" SortExpression="specialityId" />
                                <asp:BoundField DataField="doctorLanguages" HeaderText="Languages" SortExpression="doctorLanguages" />
                                <asp:BoundField DataField="doctorQualifications" HeaderText="Qualifications" SortExpression="doctorQualifications" />
                                <asp:BoundField DataField="doctorLocation" HeaderText="Location" SortExpression="doctorLocation" />
                                <asp:BoundField DataField="doctorContact" HeaderText="Contact" SortExpression="doctorContact" />
                                <asp:BoundField DataField="doctorImage" HeaderText="Doctor Image Path" SortExpression="doctorImage" />
                                <asp:ImageField DataImageUrlField="doctorImage" HeaderText="Doctor Image">
                                    <ControlStyle Width="200px" />
                                </asp:ImageField>
                            </Columns>
                        </asp:GridView>

                        <asp:Label ID="idLabel" runat="server" Text="Label" hidden="true"></asp:Label>
                        <asp:Label ID="doctorIdLabel" runat="server" Text="Label" hidden="true"></asp:Label>

                        <br />
                        <asp:SqlDataSource ID="dsDoctor" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [tblDoctor] WHERE [Id] = @Id" InsertCommand="INSERT INTO [tblDoctor] ([doctorId], [doctorFullName], [doctorGender], [specialityId], [doctorLanguages], [doctorQualifications], [doctorLocation], [doctorContact], [doctorImage]) VALUES (@doctorId, @doctorFullName, @doctorGender, @specialityId,  @doctorLanguages, @doctorQualifications, @doctorLocation, @doctorContact, @doctorImage)" SelectCommand="SELECT * FROM [tblDoctor]" UpdateCommand="UPDATE [tblDoctor] SET [doctorId] = @doctorId, [doctorFullName] = @doctorFullName, [doctorGender] = @doctorGender, [specialityId] = @specialityId, [doctorLanguages] = @doctorLanguages, [doctorQualifications] = @doctorQualifications, [doctorLocation] = @doctorLocation, [doctorContact] = @doctorContact, [doctorImage] = @doctorImage WHERE [Id] = @Id">
                            <DeleteParameters>
                                <asp:ControlParameter ControlID="idLabel" Name="Id" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:ControlParameter ControlID="doctorIdLabel" Name="doctorId" Type="String" />
                                <asp:ControlParameter ControlID="doctorFullNameTextBox" Name="doctorFullName" Type="String" />
                                <asp:ControlParameter ControlID="doctorGenderRadioButtonList" Name="doctorGender" Type="String" />
                                <asp:ControlParameter ControlID="specialityRadioButtonList" Name="specialityId" Type="String" />
                                <asp:ControlParameter ControlID="doctorLanguagesTextBox" Name="doctorLanguages" Type="String" />
                                <asp:ControlParameter ControlID="doctorQualificationsTextBox" Name="doctorQualifications" Type="String" />
                                <asp:ControlParameter ControlID="doctorLocationTextBox" Name="doctorLocation" Type="String" />
                                <asp:ControlParameter ControlID="doctorContactTextBox" Name="doctorContact" Type="String" />
                                <asp:ControlParameter ControlID="doctorImageFileNameLabel" Name="doctorImage" Type="String" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:ControlParameter ControlID="idLabel" Name="Id" Type="Int32" />
                                <asp:ControlParameter ControlID="doctorIdLabel" Name="doctorId" Type="String" />
                                <asp:ControlParameter ControlID="doctorFullNameTextBox" Name="doctorFullName" Type="String" />
                                <asp:ControlParameter ControlID="doctorGenderRadioButtonList" Name="doctorGender" Type="String" />
                                <asp:ControlParameter ControlID="specialityRadioButtonList" Name="specialityId" Type="String" />
                                <asp:ControlParameter ControlID="doctorLanguagesTextBox" Name="doctorLanguages" Type="String" />
                                <asp:ControlParameter ControlID="doctorQualificationsTextBox" Name="doctorQualifications" Type="String" />
                                <asp:ControlParameter ControlID="doctorLocationTextBox" Name="doctorLocation" Type="String" />
                                <asp:ControlParameter ControlID="doctorContactTextBox" Name="doctorContact" Type="String" />
                                <asp:ControlParameter ControlID="doctorImageFileNameLabel" Name="doctorImage" Type="String" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                        <br />
                        <asp:SqlDataSource ID="dsSpeciality" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [tblSpeciality]"></asp:SqlDataSource>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
