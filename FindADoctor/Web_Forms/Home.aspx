<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="FindADoctor.Web_Forms.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <section class="jumbotron jumbotron-fluid text-center text-white" style="background: rgb(225 36 84 / 0.90)">
            <div class="container">
                <h1 class="jumbotron-heading">
                    <asp:Label ID="homeLabel" runat="server" Text="Find A Doctor"></asp:Label>
                </h1>
                <p class="lead">
                    <asp:Label ID="sloganLabel" runat="server" Text="I Care, I am Reliable, I Make a Difference"></asp:Label>
                </p>
                <p>
                    <% if (Session["memberId"] == null && Session["adminId"] == null)
                        {%>
                    <a href="~/Web_Forms/Register" runat="server" class="btn btn-primary btn-lg my-2">Register Now!</a>
                    <%}%>
                    <a href="~/Web_Forms/About" runat="server" class="btn btn-secondary btn-lg my-2">Find Out More!</a>
                </p>
            </div>
        </section>


        <div class="album py-5 bg-light">
            <div class="container">
                <div class="d-flex justify-content-center">
                    <asp:DataList ID="dataList" runat="server" DataKeyField="Id" DataSourceID="dsSpeciality" RepeatColumns="3" RepeatDirection="Horizontal" OnItemCommand="dataList_ItemCommand">
                        <HeaderTemplate>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <div class="col">
                                <asp:LinkButton runat="server" Style="text-decoration: none" CommandName="specialityDetails">
                                    <div class="card bg-dark text-white box-shadow" style="max-width: 340px;">
                                        <asp:Image ID="SpecialityImage" runat="server" ImageUrl='<%# Eval("specialityImage") %>' Height="170px" />
                                        <div class="d-flex justify-content-center">
                                            <h5 class="card-title" style="padding: 5px 5px 0px 5px">
                                                <asp:Label ID="specialityNameLabel" runat="server" Text='<%# Eval("specialityName") %>' />
                                            </h5>
                                        </div>
                                        <asp:Label ID="specialityIdLabel" runat="server" Text='<%# Eval("specialityId") %>' Style="display: none" />
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

        <asp:Image ID="backgroundImage" class="img-fluid" runat="server" ImageUrl="../Image/backgroundImage.jpg" AlternateText="Background Image" />


    </div>
    <asp:SqlDataSource ID="dsSpeciality" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [tblSpeciality]"></asp:SqlDataSource>

</asp:Content>
