<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Import.aspx.cs" Inherits="St.Clair.Import" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/style.css" rel="stylesheet" type="text/css" />

    <link href="css/reset.css" rel="stylesheet" type="text/css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Login1" runat="server">


    <asp:FileUpload ID="FileUpload1" runat="server" TabIndex="4" Style="position:absolute; top: 130px; left: 110px; width: 301px;" />

 <%--   <asp:Label ID="Label2" runat="server" Text="File Name :" Style="position: absolute; top: 198px; left: 219px; width: 100px; height: 18px;"></asp:Label>

    <asp:DropDownList ID="ddlFileName" runat="server" CssClass="textbox" OnSelectedIndexChanged="ddlFileName_SelectedIndexChanged"
        AutoPostBack="True" Width="200px" TabIndex="1" Style="position: absolute; top: 191px; left: 351px;">
    </asp:DropDownList>--%>



    <asp:Button ID="Button1" runat="server" Text="Import"
        OnClick="BtnImport_Click" ToolTip="Import" Visible="True"
        OnClientClick="SetSource(this.id)" TabIndex="7"  Style="position:absolute; top: 123px; left: 363px;height: 29px; width: 234px; background-color: #fdc82f; border-radius: 20px; font-size: 21px"/>


    <asp:Button ID="Button2" runat="server" Text="Back"
        OnClick="Button2_Click" ToolTip="Back"       
        TabIndex="8"  Style="position:absolute; top: 123px; left: 1354px; height: 29px; width: 110px; background-color: #fdc82f; border-radius: 20px; font-size: 21px"/>


     <asp:Button ID="Button3" runat="server" Text="Save"
        OnClick="BtnSave_Click" ToolTip="Save"
         OnClientClick="SetSource(this.id)"
        TabIndex="8"  Style="position:absolute; top: 123px; left: 650px; height: 29px; width: 234px; background-color: #fdc82f; border-radius: 20px; font-size: 21px"/>

    <div>
         <asp:Panel ID="Panel1" runat="server"  Style="overflow-y: scroll;border-radius: 0px;margin-left: 32px;margin-top:2px;position:absolute;top: 239px;left: 390px;width: 38%;height: 105px;"
                    CssClass="">
                    <asp:GridView ID="GridView2" CssClass="table table-bordered table-hover table-responsive" AutoPostBack="True" runat="server" Style="width: 570px; height: 57px; margin-bottom: 40px;position:absolute; top: 7px; left: 5px; margin-left: 0px;" CellPadding="15" ForeColor="#333333" GridLines="None">
                        <%--Caption="Current Program Chart" CaptionAlign="Top"--%>

                        <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
                        <RowStyle Height="10px" />
                        <EditRowStyle BackColor="#7C6F57"></EditRowStyle>

                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White"></FooterStyle>

                        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White"></HeaderStyle>

                        <PagerStyle HorizontalAlign="Center" BackColor="#666666" ForeColor="White"></PagerStyle>

                        <RowStyle BackColor="#E3EAEB"></RowStyle>

                        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>

                        <SortedAscendingCellStyle BackColor="#F8FAFA"></SortedAscendingCellStyle>

                        <SortedAscendingHeaderStyle BackColor="#246B61"></SortedAscendingHeaderStyle>

                        <SortedDescendingCellStyle BackColor="#D4DFE1"></SortedDescendingCellStyle>

                        <SortedDescendingHeaderStyle BackColor="#15524A"></SortedDescendingHeaderStyle>
                      
                    </asp:GridView>
                </asp:Panel>
    </div>

    <asp:Button ID="Btn_Download" OnClick="Btn_Download_Click" runat="server" Text="Download Sample File" Style="position:absolute;height: 29px;width: 222px;background-color: #FDC52F;border-radius: 20px;font-size: 21px;top: 203px;left: 985px;top: 125px;" />
    <br />
        <br />
        <br />
        <br />
    <div>
        <asp:Panel ID="pnlSearchVendor" runat="server" Width="97%" ScrollBars="Vertical" Style="border-radius: 0px; margin-left: 30px;margin-top:2px;position:absolute; top: 383px; left: -10px; height: 246px;width:87%"
                    CssClass="">
                    <asp:GridView ID="GridView1" CssClass="table table-bordered table-hover table-responsive" AutoPostBack="True" runat="server" Style="height: 119px; overflow-y: auto; margin-bottom: 40px;position:absolute; top: 7px; left: 98px; margin-left: 0px;" CellPadding="15" ForeColor="#333333" GridLines="None">
                        <%--Caption="Current Program Chart" CaptionAlign="Top"--%>

                        <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
                        <RowStyle Height="10px" />
                        <EditRowStyle BackColor="#7C6F57"></EditRowStyle>

                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White"></FooterStyle>

                        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White"></HeaderStyle>

                        <PagerStyle HorizontalAlign="Center" BackColor="#666666" ForeColor="White"></PagerStyle>

                        <RowStyle BackColor="#E3EAEB"></RowStyle>

                        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>

                        <SortedAscendingCellStyle BackColor="#F8FAFA"></SortedAscendingCellStyle>

                        <SortedAscendingHeaderStyle BackColor="#246B61"></SortedAscendingHeaderStyle>

                        <SortedDescendingCellStyle BackColor="#D4DFE1"></SortedDescendingCellStyle>

                        <SortedDescendingHeaderStyle BackColor="#15524A"></SortedDescendingHeaderStyle>
                      
                    </asp:GridView>
                </asp:Panel>
    </div>
    <%--<center>
         <div id="login_container" style="border-radius: 25px; border-width: 7px; margin-top: -50px; border-color: #35B736; border-style: solid; /* border-width: thin; */height: 375px; /* border: thick; */background-color: rgb(230 221 221 / 0%); /* border-block-color: unset; */">
 <div align="center" style="text-align: center; height: 25px; font-weight: bold">
     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:UpdateProgress ID="UpdateProgress2" runat="server" AssociatedUpdatePanelID="updUpload111">
                <ProgressTemplate>
                    Processing.... &nbsp;
                    <img src="../images/ajax-loader-small.gif" alt='test' />
                </ProgressTemplate>
            </asp:UpdateProgress>
        </div>
        <asp:UpdatePanel ID="updUpload111" runat="server">
            <ContentTemplate>
              <table width="100%">
                <tr>
                           <td align="left"> <div class="heading" style="margin-top: -41px;color:#0d0d0c;">
                                <asp:Label ID="Label1"  runat="server" Text="Import Data" style="margin-left: 200px;"></asp:Label></div>
                            </td></tr>
              <tr><td>
                <div>
                    <asp:Panel ID="PnlMain" runat="server">
                        <table  border="0" align="left">
                          
                            <tr >
                               <td colspan="4" align="center">
                               <asp:Label ID="lblError" runat="server" Text="" ForeColor="Red"></asp:Label>
                               </td>
                            </tr>
                            <tr >
                               
                                <td  >
                                    <asp:Label ID="lblFile" runat="server" Text="File Name :" Style="position:absolute; top: 255px; left: 641px; width: 100px;"></asp:Label>
                                </td>
                                <td >
                                    <asp:DropDownList ID="ddlFileName" runat="server" CssClass="textbox" OnSelectedIndexChanged="ddlFileName_SelectedIndexChanged"
                                        AutoPostBack="True" Width="200px" TabIndex=1 style="position:absolute; top: 252px; left: 762px;">
                                    </asp:DropDownList>
                                </td>
                                
                                
                               
                            </tr>
                            <tr >
                             <td   colspan="4">
                             <asp:Panel GroupingText="Download Formats" CssClass="content" Height="50px" runat="server" Style="position:absolute">
                                    <span  class="btn" id="spnExlFile" runat="server">  <asp:Button ID="BtnExlFile" runat="server"  Text="Excel" 
                                       ToolTip="Download Excel Template" 
                                         OnClick="BtnExlFile_Click"  OnClientClick="SetSource(this.id)" TabIndex="2"/></span>
                                   <span class="btn" id="spnCSV" runat="server"><asp:Button ID="BtnCSVFile" runat="server"  Text="CSV" 
                                         ToolTip="Download CSV Template" 
                                         OnClick="BtnCSVFile_Click"  OnClientClick="SetSource(this.id)" TabIndex="3"  /></span>
                                 </asp:Panel></td>
                               
                            </tr>
                            <tr height="30px">
                               
                                <td  colspan="1">
                                    <asp:Label ID="lblImport" runat="server" Text="Import Excel :"></asp:Label>
                                </td>
                                <td colspan="3" align="left">
                                    <asp:FileUpload ID="FileUpload_Invoice" runat="server" Width="204px" TabIndex="4"/>
                                </td>

                            </tr>
                            <tr>
                             <td style="width: 35px"  >
                                   <span  class="btn" id="spnShowTab" runat="server"> <asp:Button ID="BtnShowTab" runat="server" Text="Sheets"
                                        OnClick="BtnShowTab_Click" Style="margin-left: 0px"  ToolTip="Show Sheet Tab"
                                        OnClientClick="SetSource(this.id)" TabIndex="5"/></span>
                                    <asp:HiddenField ID="hidSourceID" runat="server" />
                                </td>
                                <td style="width: 130px">
                                    <asp:Label ID="lblFileName" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr >
                                
                                <td  style="width: 100px">
                                    <asp:Label ID="lblSheetTab" runat="server" Text="Sheet Name :" Visible="false"></asp:Label>
                                </td>
                                <td align="left" >
                                    <asp:DropDownList ID="ddlSheetTabName" runat="server" CssClass="textbox"  Visible="false"
                                        AutoPostBack="True" OnSelectedIndexChanged="ddlSheetTabName_SelectedIndexChanged" TabIndex="6">
                                    </asp:DropDownList>
                                </td>
                                <td >
                                    <asp:UpdatePanel ID="upimport" runat="server">
                                        <ContentTemplate>

                                               <span class="btn" id="spnImport" runat="server">  <asp:Button ID="BtnImport" runat="server"  Text="Import" 
                                                OnClick="BtnImport_Click"  ToolTip="Import" Visible="True" 
                                                OnClientClick="SetSource(this.id)" TabIndex="7" /></span>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                                <td >
                                    <asp:UpdatePanel ID="UPSave" runat="server" >
                                        <ContentTemplate>
                                           <span class="btn" id="spnSave" runat="server"> <asp:Button ID="BtnSave" runat="server" text="Save" 
                                                OnClick="BtnSave_Click"  ToolTip="Save"
                                                Visible="False"  OnClientClick="SetSource(this.id)" 
                                                TabIndex="8" /></span>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="BtnSave" EventName="Click" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                            <tr>
                                <td  colspan="5">

                                </td>
                            </tr>
                            <tr >
                                
                                <td style="text-align: left; border: 0;" colspan="4" >
                                    <asp:Panel ID="pnlRecordCount" runat="server" Visible="false">
                                        <table border="1">
                                            <tr class="graytitle">
                                                <td class="greyColumn">
                                                    Total Records
                                                </td>
                                                <td class="greyColumn">
                                                    Records Inserted
                                                </td>
                                                <td class="greyColumn" id="tdduplicate" runat="server">
                                                    <asp:Label Text="Duplicate Records" runat="server" ID="lblDupRecHeader" />
                                                </td>
                                                <td class="greyColumn">
                                                    Not Found Records
                                                </td>
                                                <td class="greyColumn">
                                                    Blank Records
                                                </td>
                                                <td class="greyColumn">
                                                    Parents Not Exist
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="greyColumnval">
                                                    <asp:Label ID="lblTRecords" Text="0" runat="server"></asp:Label>
                                                </td>
                                                <td class="greyColumnval">
                                                    <asp:Label ID="lblRecIns" Text="0" runat="server"></asp:Label>
                                                </td>
                                                <td class="greyColumnval">
                                                    <asp:Label ID="lblDupRec" runat="server" Text="0"></asp:Label>
                                                </td>
                                                <td class="greyColumnval">
                                                    <asp:Label ID="lblNotFound" runat="server" Text="0"></asp:Label>
                                                </td>
                                                <td class="greyColumnval">
                                                    <asp:Label ID="lblBlank" runat="server" Text="0"></asp:Label>
                                                </td>
                                                <td class="greyColumnval">
                                                    <asp:Label ID="lblParentNotExist" runat="server" Text="0"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                </td>
                                <td>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </div>
                </td></tr>
                <tr><td>
                <div id="pnlGridChild" align="center">
                    <asp:Panel ID="pnlGrid" runat="server" Visible="false" Height="150px" ScrollBars="Auto" Width="600px">
                        <asp:GridView ID="grdExlimport" runat="server" AutoGenerateColumns="true" AllowAddingRecords="False"
                            AllowFiltering="True" EmbedFilterInSortExpression="True" ShowMultiPageGroupsInfo="False"
                            CallbackMode="false"  AllowPageSizeSelection="False" PageSize="10" CssClass="Grid"   >

                        </asp:GridView>
                    </asp:Panel>
                    <asp:Panel ID="pnlError" runat="server" Visible="False" Height="150px" ScrollBars="Auto" Width="600px">
                        <asp:GridView ID="grdError" runat="server" AutoGenerateColumns="false" AllowAddingRecords="False"
                            AllowFiltering="false" AllowPageSizeSelection="False" EmbedFilterInSortExpression="false"
                            ShowMultiPageGroupsInfo="False" CallbackMode="false" AllowPaging="false" CssClass="Grid" >

                        </asp:GridView>
                    </asp:Panel>
                </div>
                </td></tr>
                <tr><td>
                <div id="divDuplicate"  align="center">
                    <asp:Panel ID="pnlDuplicate" runat="server" Visible="false" Height="150px" ScrollBars="Auto" Width="600px">
                        <asp:GridView ID="grdDuplicate" runat="server" AutoGenerateColumns="true" AllowAddingRecords="False"
                            AllowFiltering="false" AllowPageSizeSelection="False" EmbedFilterInSortExpression="True"
                            ShowMultiPageGroupsInfo="False" CallbackMode="false" AllowPaging="false" CssClass="Grid" >
                         
                        </asp:GridView>
                    </asp:Panel>
                </div>
                </td></tr></table>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="BtnSave" />
                <asp:PostBackTrigger ControlID="BtnShowTab" />
                <asp:AsyncPostBackTrigger ControlID="BtnImport" />
                 <asp:PostBackTrigger ControlID="BtnCSVFile" />
            </Triggers>
        </asp:UpdatePanel>
             </div>
    </center>--%>
</asp:Content>
