<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminSpecialityManagement.aspx.cs" Inherits="FindADoctor.Web_Forms.AdminSpecialityManagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron jumbotron-fluid text-white" style="background: url(https://www.sunmedvelocity.com.my/images/promo_bg.jpg) no-repeat top center; background-size: cover;">
        <div class="container">
            <h1>
                <asp:Label ID="specialityManagementLabel" runat="server" Text="Speciality Management"></asp:Label></h1>
            <p class="lead">
                <asp:Label ID="specialityManagementDescriptionLabel" runat="server" Text="Manage speciality here"></asp:Label>
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
                    <asp:Label runat="server" AssociatedControlID="specialityNameTextBox"><b>Speciality Name</b></asp:Label><br />
                    <asp:TextBox runat="server" required="required" Enabled="True" name="Speciality" ID="specialityNameTextBox" class="form-control input-sm" placeholder="Speciality Name"></asp:TextBox>

                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-4 col-md-offset-1">
                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="specialityDescriptionTextBox"><b>Description</b></asp:Label><br />
                    <asp:TextBox runat="server" required="required" Enabled="True" name="SpecialityDescriptionTextBox" ID="specialityDescriptionTextBox" class="form-control input-sm" placeholder="Speciality Description"></asp:TextBox>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-4 col-md-offset-1">
                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="specialityImageFileUpload"><b>Speciality Image</b></asp:Label><br />
                    <asp:FileUpload ID="specialityImageFileUpload" runat="server" /><br />
                    <asp:Label ID="specialityImageFileNameLabel" runat="server" Text="Please Upload An Image"></asp:Label>
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
                            runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="dsSpeciality">
                            <AlternatingRowStyle BackColor="White" />
                            <HeaderStyle BackColor="#6B696B" Font-Bold="true" Font-Size="Larger" ForeColor="White" />
                            <RowStyle BackColor="#f5f5f5" />
                            <SelectedRowStyle BackColor="#669999" Font-Bold="true" ForeColor="White" />
                            <Columns>
                                <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="true" InsertVisible="False" SortExpression="Id" />
                                <asp:BoundField DataField="specialityId" HeaderText="Speciality Id" SortExpression="specialityId" />
                                <asp:BoundField DataField="specialityName" HeaderText="Speciality Name" SortExpression="specialityName" />
                                <asp:BoundField DataField="specialityDescription" HeaderText="Speciality Description" SortExpression="specialityDescription" />
                                <asp:BoundField DataField="specialityImage" HeaderText="Speciality Image Path" SortExpression="specialityImage" />
                                <asp:ImageField DataImageUrlField="specialityImage" HeaderText="Speciality Image">
                                    <ControlStyle Width="340px" />
                                </asp:ImageField>
                            </Columns>
                        </asp:GridView>

                        <asp:Label ID="idLabel" runat="server" Text="Label" hidden="true"></asp:Label>
                        <asp:Label ID="specialityIdLabel" runat="server" Text="Label" hidden="true"></asp:Label>

                        <br />
                        <asp:SqlDataSource ID="dsSpeciality" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [tblSpeciality] WHERE [Id] = @Id" InsertCommand="INSERT INTO [tblSpeciality] ([specialityId], [specialityName], [specialityDescription], [specialityImage]) VALUES (@specialityId, @specialityName, @specialityDescription, @specialityImage)" SelectCommand="SELECT * FROM [tblSpeciality]" UpdateCommand="UPDATE [tblSpeciality] SET [specialityId] = @specialityId, [specialityName] = @specialityName, [specialityDescription] = @specialityDescription, [specialityImage] = @specialityImage WHERE [Id] = @Id">
                            <DeleteParameters>
                                <asp:ControlParameter ControlID="idLabel" Name="Id" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:ControlParameter ControlID="specialityIdLabel" Name="specialityId" Type="String" />
                                <asp:ControlParameter ControlID="specialityNameTextBox" Name="specialityName" Type="String" />
                                <asp:ControlParameter ControlID="specialityDescriptionTextBox" Name="specialityDescription" Type="String" />
                                <asp:ControlParameter ControlID="specialityImageFileNameLabel" Name="specialityImage" Type="String" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:ControlParameter ControlID="idLabel" Name="Id" Type="Int32" />
                                <asp:ControlParameter ControlID="specialityIdLabel" Name="specialityId" Type="String" />
                                <asp:ControlParameter ControlID="specialityNameTextBox" Name="specialityName" Type="String" />
                                <asp:ControlParameter ControlID="specialityDescriptionTextBox" Name="specialityDescription" Type="String" />
                                <asp:ControlParameter ControlID="specialityImageFileNameLabel" Name="specialityImage" Type="String" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </div>
                </div>
            </div>
        </div>


    </div>

</asp:Content>
