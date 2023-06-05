<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Speciality.aspx.cs" Inherits="FindADoctor.Web_Forms.Speciality" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron jumbotron-fluid text-white" style="background: rgb(232 114 114 / 0.90)">
        <div class="container">
            <h1>
                <asp:Label ID="specialityNameLabel" runat="server" Text="Speciality Name"></asp:Label></h1>
            <p class="lead">
                <asp:Label ID="specialityDescriptionLabel" runat="server" Text="Speciality Description"></asp:Label>
            </p>
        </div>
    </div>

    <div class="album py-5 bg-light">
        <div class="container">
            <div class="d-flex justify-content-center">
                <asp:DataList ID="dataList" runat="server" DataKeyField="Id" DataSourceID="dsDoctor" RepeatColumns="3" RepeatDirection="Horizontal" OnItemCommand="dataList_ItemCommand">
                    <HeaderTemplate>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <div class="col">
                            <asp:LinkButton runat="server" Style="text-decoration: none" CommandName="doctorDetails">
                                <div class="card" style="width: 20rem; height: 470px">
                                    <asp:Image ID="doctorImage" runat="server" ImageUrl='<%# Eval("doctorImage") %>' />
                                    <div class="card-body">
                                        <h5 class="card-title text-dark">
                                            <asp:Label ID="doctorTitleLabel" runat="server" Text='Dr. ' />
                                            <asp:Label ID="doctorFullNameLabel" runat="server" Text='<%# Eval("doctorFullName") %>' />
                                        </h5>
                                        <p class="card-text text-body">
                                            <asp:Label ID="contactTitleLabel" runat="server" Text='Contact: ' />
                                            <asp:Label ID="doctorContactLabel" runat="server" Text='<%# Eval("doctorContact") %>' />
                                            <br />
                                            <asp:Label ID="locationTitleLabel" runat="server" Text='Location: ' />
                                            <asp:Label ID="doctorLocationLabel" runat="server" Text='<%# Eval("doctorLocation") %>' />
                                        </p>
                                    </div>
                                    <asp:Label ID="doctorIdLabel" runat="server" Text='<%# Eval("doctorId") %>' hidden="true" />
                                </div>

                            </asp:LinkButton>
                        </div>
                    </ItemTemplate>
                    <FooterTemplate>
                    </FooterTemplate>
                </asp:DataList>
            </div>
        </div>
    </div>

    <asp:SqlDataSource ID="dsDoctor" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [tblDoctor] WHERE ([specialityId] = @specialityId)">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="S1" Name="specialityId" SessionField="specialityId" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>
