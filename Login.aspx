<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="St.Clair.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<%--    <link href="/css/Login.css" rel="stylesheet" type="text/css" />
    <link href="/css/style.css" rel="stylesheet" type="text/css" />--%>
    <link href="css/style.css" rel="stylesheet" />
    <link href="css/Login.css" rel="stylesheet" />
   <%-- <link href="css/common.css" rel="stylesheet" type="text/css" />--%>
</asp:Content>
<asp:Content ContentPlaceHolderID="Login1" runat="server">
    <div id="login_container">
        <h2 style="border-bottom: white 1px solid; height: 81px">
            <img style="padding-top: 4px" height="77" src="images/Clairlogo.svg"
                width="239" alt="" /></h2>
       <%-- <form name="loginForm" runat="server">
        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
        </asp:ToolkitScriptManager>--%>
       <%-- <p>
            <img src="/images/spacer.gif" alt="" /><strong>&nbsp;</strong></p>--%>
        <p>
            <label>
                User Name:</label>
            <%-- <asp:TextBox runat="server" ID="txtUserName" class="input_login"/>--%>
            <asp:TextBox runat="server" ID="txtUserName" CssClass="input_login" TabIndex=1 Style="text-align:center;"></asp:TextBox>
        </p>
        <p>
            <label>
                Password:</label>
            <%-- <asp:TextBox runat="server" ID="txtPassword" class="input_login" TextMode="Password"/>--%>
            <asp:TextBox runat="server" ID="txtPassword" CssClass="input_login" TextMode="Password" TabIndex="2" Style="text-align:center;"></asp:TextBox>
            <asp:Label ID="lblErrorMsg" runat="server" ForeColor="Red" CssClass="label"></asp:Label>
        </p>
        <p>
            <label>
                &nbsp;</label>
            <%--<span class="btn"><input name="" type="Submit" value="Login" onclick="loginButtonClicked();"/></span> --%>

        </p>
            <span class="btn" style="height: 0px;">
               <%-- <p>--%>
                <asp:HiddenField ID="hdnforgot" runat="server" />
                 <asp:HiddenField ID="hdnstatus" runat="server" />
                
            <asp:Button runat="server" ID="BtnLogin" Text="Login" OnClick="BtnLogin_Click" TabIndex="3" />
                <span>
                     <asp:CheckBox ID="chkRemember" runat="server" TabIndex="5" />&nbsp;
            <asp:Label ID="lblremindeme" runat="server" Text="Keep me logged in" Style="color:#fdc82f"></asp:Label>
                </span>
<%--                <br />
 <br />
 <br />--%>
                &nbsp;
                &nbsp;
                &nbsp;

            <span>

                <asp:LinkButton ID="lnkbtnForgotPassword" runat="server" TabIndex="4" OnClick="lnkbtnForgotPassword_Click">
                <u style="color:#fdc82f"">Forgot Password ?.</u>
                </asp:LinkButton></span>
           <%-- <asp:CheckBox ID="chkRemember" runat="server" TabIndex="5" />&nbsp;
            <asp:Label ID="lblremindeme" runat="server" Text="Keep me logged in" Style="color:#fdc82f"></asp:Label>--%>

       <%-- </p>--%>
                </span>
        <table>
            <tr>
                <td colspan="3" class="seperator">
                    <div class="panel panel-info" id="pnlmpeForgotPassword" style="display: none;">
                        <div class="heading">
                            Forgot Password</div>
                        <div class="panel-body">
                            <div dir="ltr" style="position: relative; width: 400px; height: 180px;">
                                <asp:Panel ID="pnlforgot" runat="server" DefaultButton="btnSentPassword">
                                    <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td align="right">
                                                <asp:ImageButton ID="imgbtnclose" runat="server" ImageUrl="~/img/Close_32.png" Height="25px"
                                                    TabIndex="3" Width="25px" ToolTip="Close" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left" width="100%">
                                                <asp:Panel ID="panel2" runat="server" CssClass="" ScrollBars="Auto" Width="360px"
                                                    Height="180px">
                                                    <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                                        <tr>
                                                            <td colspan="2" class="seperator">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left" colspan="2">
                                                                <asp:Label ID="Label3" runat="server" Font-Bold="true" Text="Your password will be sent to your Email ID."
                                                                    CssClass="label"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2" class="seperator">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2" class="seperator">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="seperator" width="30%">
                                                                <asp:Label ID="Label2" runat="server" Text="Enter User Name" CssClass="label"></asp:Label>
                                                            </td>
                                                            <td width="50%" align="left">
                                                                <asp:TextBox ID="txtForgotUserName" runat="server" CssClass="textbox" Width="200px"
                                                                    TabIndex="1" MaxLength="25"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                            </td>
                                                            <td align="left" class="seperator">
                                                                <asp:RequiredFieldValidator ID="rfvFUserName" runat="server" ControlToValidate="txtForgotUserName"
                                                                    Display="None" ErrorMessage="User Name is Required" ValidationGroup="forgot"
                                                                    ForeColor="Red"></asp:RequiredFieldValidator>
                                                       <%--         <asp:ValidatorCalloutExtender ID="vceFUsername" TargetControlID="rfvFUserName" runat="server"
                                                                    WarningIconImageUrl="~/img/Warning.png">
                                                                </asp:ValidatorCalloutExtender>--%>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2" class="seperator">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center" colspan="2">
                                                                <span class="btn">
                                                                    <asp:Button ID="btnSentPassword" runat="server" Text="Send" ValidationGroup="forgot"
                                                                        TabIndex="2" OnClick="btnSentPassword_Click" Width="80px" /></span>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2" class="seperator">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2" class="seperator" align="center">
                                                                <asp:Label ID="Label1" runat="server" ForeColor="Red" CssClass="label"></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </asp:Panel>
                                            </td>
                                        </tr>
                                    </table>
                                   <%-- <asp:ModalPopupExtender ID="MPEForgotPwd" runat="server" TargetControlID="hdnforgot"
                                        PopupControlID="pnlmpeForgotPassword" BackgroundCssClass="modalBackground" Enabled="True"
                                        CancelControlID="imgbtnclose">
                                    </asp:ModalPopupExtender>--%>
                                </asp:Panel>
                            </div>
                        </div>
                    </div>
                </td>
            </tr>
        </table>

    </div>
    </span>
</asp:Content>

