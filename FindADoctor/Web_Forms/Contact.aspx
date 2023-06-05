<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="FindADoctor.Contact" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron jumbotron-fluid text-white" style="background: rgb(172 140 94 / 0.90);">
        <div class="container">
            <h1>
                <asp:Label ID="contactUsLabel" runat="server" Text="Contact Us"></asp:Label></h1>
            <p class="lead">
                <asp:Label ID="contatcUsDescriptionLabel" runat="server" Text="Keep in touch."></asp:Label>
            </p>
        </div>
    </div>

    <div class="album py-5" style="padding-bottom: 0px; background: url(https://www.sunwaymedical.com/images/establish.jpg) no-repeat top center; background-size: cover;">
        <div class="container">
            <div class="row row-cols-4">
                <div class="col">
                    <div class="container">
                        <div class="d-flex justify-content-center">
                            <section class="jumbotron text-white" style="background: #ac8c5e">
                                <div class="container" style="height: 150px; width: 200px">
                                    <h1 class="jumbotron-heading"><strong>Address</strong></h1>
                                    <p>
                                        No. 5 Jalan Lagoon<br />
                                        Selatan, Bandar Sunway,<br />
                                        47500 Selangor,<br />
                                        Malaysia.<br />
                                    </p>
                                </div>
                            </section>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="container">
                        <div class="d-flex justify-content-center">
                            <section class="jumbotron text-white" style="background: #70cac9">
                                <div class="container" style="height: 150px; width: 200px">
                                    <h1 class="jumbotron-heading">
                                        <strong>Contact Number</strong>
                                        <br />
                                    </h1>
                                    <p>
                                        +603-7491 9191<br />
                                        +603-5566 9191<br />
                                    </p>
                                </div>
                            </section>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="container">
                        <div class="d-flex justify-content-center">
                            <section class="jumbotron text-white" style="background: #977bb6">
                                <div class="container" style="height: 150px; width: 200px">
                                    <h1 class="jumbotron-heading">
                                        <strong>Fax</strong>
                                        <br />
                                    </h1>
                                    <p>
                                        +603-7491 8181<br />
                                    </p>
                                </div>
                            </section>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="container">
                        <div class="d-flex justify-content-center">
                            <section class="jumbotron text-white" style="background: #e12454">
                                <div class="container" style="height: 150px; width: 200px">
                                    <h1 class="jumbotron-heading">
                                        <strong>Email</strong>
                                        <br />
                                    </h1>
                                    <p>
                                        smc@sunway.com.my<br />
                                    </p>
                                </div>
                            </section>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="d-flex justify-content-center">
                <section class="jumbotron text-white" style="background: #f50f0f">
                    <div class="container">
                        <h1 class="jumbotron-heading">
                            <strong>Operation Hours:</strong>
                            <br />
                        </h1>
                        <p>
                            Monday – Friday:
                            <br />
                            8.30am – 5.00pm
                            <br />
                            <br />
                            Saturday:
                            <br />
                            8.30am – 1.00pm
                            <br />
                        </p>
                    </div>
                </section>
            </div>
        </div>

        <div class="container">
            <div class="d-flex justify-content-center">
                <section class="jumbotron text-white" style="background: #d00309">
                    <div class="container">
                        <h1 class="jumbotron-heading">
                            <strong>Emergency Line (24 Hours)</strong>
                            <br />
                        </h1>
                        <p>
                            +603-55668888
                            <br />
                        </p>
                    </div>
                </section>
            </div>
        </div>
    </div>
</asp:Content>
