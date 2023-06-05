<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Doctor.aspx.cs" Inherits="FindADoctor.Web_Forms.Doctor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron jumbotron-fluid" style="background: url(https://www.sunwaymedical.com/images/default_banner.jpg) no-repeat top center; background-size: cover;">
        <div class="container">
            <h1>
                <asp:Label ID="doctorFullNameTitleJumbotron" runat="server" Text='Dr.' />
                <asp:Label ID="doctorFullNameLabelJumbotron" runat="server" Text='Doctor Full Name' />
            </h1>
        </div>
    </div>
    
    <div class="card mb-3" style="margin: 50px 50px; background: url(https://www.sunwayhomehealthcare.com.my/images/homebackground.jpg) no-repeat top center; background-size: cover;">
        <div class="row no-gutters">
            <div class="col-md-4">
                <asp:Image ID="doctorImage" runat="server" ImageUrl='...' />
            </div>
            <div class="col-md-8">
                <div class="card-body">
                    <h3 class="card-title text-dark" id="cardTitleHeader">
                        <asp:Label ID="doctorTitleLabel" runat="server" Text='Dr. ' />
                        <asp:Label ID="doctorFullNameLabel" runat="server" Text='' />
                    </h3>
                    <div class="card-text text-body font-weight-normal">
                        <p>
                            <asp:Label ID="genderTitleLabel" runat="server" Text="Gender: " />
                            <asp:Label ID="doctorGenderLabel" runat="server" Text='' />
                        </p>
                        <p>
                            <asp:Label ID="languagesTitleLabel" runat="server" Text="Languages: " />
                            <asp:Label ID="doctorLanguageLabel" runat="server" Text='' />
                        </p>
                        <p>
                            <asp:Label ID="qualificationsTitleLabel" runat="server" Text='Qualifications: ' />
                            <asp:Label ID="doctorQualificationsLabel" runat="server" Text='' />
                        </p>
                        <p>
                            <asp:Label ID="locationTitleLabel" runat="server" Text='Location: ' />
                            <asp:Label ID="doctorLocationLabel" runat="server" Text='' />
                        </p>
                        <p>
                            <asp:Label ID="contactTitleLabel" runat="server" Text='Contact: ' />
                            <asp:Label ID="doctorContactLabel" runat="server" Text='' />
                        </p>
                        <asp:Button ID="makeAppointmentButton" class="btn btn-primary btn-lg" Style="margin: 10px" runat="server" Text="Make Appointment" OnClick="makeAppointmentButton_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>

    <asp:SqlDataSource ID="dsDoctor" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [tblDoctor] WHERE ([doctorId] = @doctorId)">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="C1" Name="doctorId" SessionField="doctorId" Type="String" />
        </SelectParameters>
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
                    <button id="closeButton" type="button" class="btn btn-danger" data-dismiss="modal">
                        Close</button>
                </div>
            </div>
        </div>
    </div>

</asp:Content>