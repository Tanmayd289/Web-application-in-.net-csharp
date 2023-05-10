<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LandingPage.aspx.cs" Inherits="St.Clair.LandingPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Login1" runat="server">


    <div id="login_container" style="border-radius: 25px; border-width: 7px; margin-top: -50px; border-color: #35B736; border-style: solid; /* border-width: thin; */height: 375px; /* border: thick; */background-color: rgb(230 221 221 / 0%); /* border-block-color: unset; */">
        
      
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        
        
        <asp:Button ID="Button1" runat="server" Text="Request a Program Chart Change" OnClick="Button1_Click" style="font-size: 21px;width: 370px;height: 44px;border-radius:25px;background-color: #fdc82f" />
        <br />
        <br />
        <br />
        <br />
        <br />
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" Text="Course Outline Change" OnClick="Button2_Click" style="font-size: 21px;width: 370px;height: 44px;border-radius:25px;background-color: #fdc82f"/>
        <br />
        <br />
        <br />
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button3" runat="server" Text="CAE Consultation" OnClick="Button3_Click" style="font-weight: 500;font-size: 21px;width: 370px;height: 44px;border-radius:25px;background-color: #fdc82f"/>
        <br />
        <br />
        <br />
        <br />
        <br />
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button4" runat="server" Text="CAE Teaching and Learning PD Request" OnClick="Button4_Click" style="font-weight: 600;font-size: 15px;width: 370px;height: 44px;border-radius:25px;background-color: #fdc82f"/>

    </div>
</asp:Content>


