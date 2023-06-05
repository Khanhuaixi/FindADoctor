<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="FindADoctor.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link href="Style_Sheets/StyleSheet1.css" rel="stylesheet" />

    <div class="jumbotron jumbotron-fluid text-white" style="background: rgb(172 140 94 / 0.90)">
        <div class="container">
            <h1>
                <asp:Label ID="aboutUsLabel" runat="server" Text="About Us"></asp:Label></h1>
            <p class="lead">
                <asp:Label ID="aboutUsDescriptionLabel" runat="server" Text="We are a doctor appointment platform for Sunway Medical Centre Sunway City."></asp:Label>
            </p>
        </div>
    </div>

    <div style="padding-bottom: 0px; background: url(https://sunwaymedicalsingapore.com.sg/wp-content/themes/oom_default/dist/images/home/contact_bg.jpg) no-repeat top center; background-size: cover;">
        <div class="album py-5">
            <div class="container">
                <div class="d-flex justify-content-center">
                    <section class="jumbotron text-center" style="background: rgb(232 114 114 / 0.95)">
                        <div class="container">
                            <h1 class="jumbotron-heading">I Care, I am Reliable, I Make a Difference</h1>
                            <div style="text-align: justify; text-justify: inter-word;">
                                Established in November 1999, Sunway Medical Centre is an Australian Council on Healthcare Standards (ACHS) accredited private hospital located in Malaysia’s first fully integrated green township of Sunway City. The hospital currently offers comprehensive tertiary healthcare services, with 616 licensed beds, 180 consultation suites, 13 operating theatres and two multi-storey car parks with a total of 1,470 parking bays.To better cater to the international market, given the growing medical tourism industry, Sunway Medical Centre has embarked on an extensive expansion plan, next to the existing hospital building. Tower C has completed its first phase in October of 2016 with the opening of the new Cancer & Radiosurgery Centre and Nuclear Medicine Centre, which will also house other Centres of Excellence such as Digestive Health Centre and Dialysis Centre. The second phase, with a 10-level tower, housing single room wards and consultation suites, has also completed and started its operations mid-2017. This sets Sunway Medical Centre as one of the leading private medical centres in the region. 
                            Sunway Medical Centre offers a comprehensive range of medical services, which include facilities and advanced medical technologies for outpatient and inpatient speciality care, health and wellness programmes and 24-hour emergency services. These are coupled with a strong support system comprising of 2,800 dedicated personnel including medical consultants, professional allied health staff as well as trained and dedicated nursing staff. 
                            Sunway Medical Centre is affiliated with the Jeffrey Cheah School of Medicine & Health Sciences, Monash University Malaysia, University of Cambridge, Royal Papworth Hospital and Harvard Medical School to further meet the demands of clinical care, education and research.                       
                            </div>
                        </div>
                    </section>
                </div>
            </div>
        </div>

        <div class="album py-5">
            <div class="container">
                <div class="d-flex justify-content-center">
                    <section class="jumbotron text-center" style="background: rgb(217 101 102 / 0.95)">
                        <div class="container">
                            <h1 class="jumbotron-heading">MISSION AND VISION</h1>
                            <div style="text-align: justify; text-justify: inter-word;">
                                Our mission is to make a difference in people's lives through excellent patient care, with a vision to become the global leader in value-based integrated healthcare.                   
                            </div>
                        </div>
                    </section>
                </div>
            </div>
        </div>

        <div class="album py-5">
            <div class="container">
                <div class="d-flex justify-content-center">
                    <section class="jumbotron text-center rounded-sm" style="background: rgb(232 114 114 / 0.95)">
                        <div class="container">
                            <h1 class="jumbotron-heading">
                                <asp:Label ID="valueLabel" runat="server" Text="VALUES"></asp:Label>
                            </h1>
                            <p class="lead">
                                <asp:Label ID="peopleLabel" runat="server" Text="People"></asp:Label>
                            </p>
                            <div style="text-align: justify; text-justify: inter-word;">
                                <asp:Label ID="peopleDescriptionLabel" runat="server" Text="Treat those we serve and each other with compassion, dignity, integrity and respect."></asp:Label>
                            </div>
                            <p class="lead">
                                <asp:Label ID="excellenceLabel" runat="server" Text="Excellence"></asp:Label>
                            </p>
                            <p>
                                <asp:Label ID="excellenceDescriptionLabel" runat="server" Text="Strive for the finest clinical, service and operational outcomes."></asp:Label>
                            </p>
                            <p class="lead">
                                <asp:Label ID="resultValueLabel" runat="server" Text="Results"></asp:Label>
                            </p>
                            <p>
                                <asp:Label ID="resultDescriptionLabel" runat="server" Text="Exceed expectations of those we serve and those we set for ourselves."></asp:Label>
                            </p>
                        </div>
                    </section>
                </div>
            </div>
        </div>
    </div>

    <img alt="" src="https://sunwaymedicalsingapore.com.sg/wp-content/uploads/2022/05/Group7.jpg" />

</asp:Content>
