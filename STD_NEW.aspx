<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="STD_NEW.aspx.cs" Inherits="St.Clair.STD_NEW" MaintainScrollPositionOnPostback="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>St.Clair</title>

    <%-- <script src="sweetalert2.min.js"></script>
   <link rel="stylesheet" href="sweetalert2.min.css"/>--%>

    <link rel="shortcut icon" type="image/x-icon" href="~/img/favicon.ico" />
    <link href="css/Login.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
    <link href="css/common.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>

    <script type='text/javascript'>
        
        function Numbersonly(event) {
            event = (event) ? event : window.event;
            var charCode = (event.which) ? event.which : event.keyCode;
            if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                return false;
            }
            return true;
        }
    </script>
    <script type="text/javascript">    
        debugger;
        function WaterMarkFocus(txt, text) {
            if (txt.value == text) {
                txt.value = "";                
                txt.style.color = "Red";
            }
        }

        function WaterMarkBlur(txt, text) {
            if (txt.value == "") {
                txt.value = text;
                txt.style.color = "Red";
            }
        }      
    </script> 

    <%-- <script type="text/javascript">
        function CheckBrowser(e) {

            debugger;

            function clickX(e) {  //e needs to be in the arguments as long as the event is attached properly, this will work.
                $(this).parent().attr({ class: "inactiveTab" });
                $(".inactiveTab").show();

                e = e || window.event;
             
                
            }


            function showKeycode(e) {
                alert(e.keyCode);
            }
            document.onkeydown = showKeycode;
            //var seats = $("#TextBox2").val();
            
            //var error = null;
            //var keycode;

            //$(window).load(function (e) {
            //    if (e.keyCode == 116) {
            //        e.preventDefault();
            //        return false;
            //    }
            //});

            //$(window).load(function (e) {
            //if (e.keycode == 116 || (window.event.ctrlKey && e.keycode == 82)) {
            //    keycode = window.event.keyCode;
            //    alert(e.keycode);

            //}
            //});
            //if (seats != "") {
            //    window.location = "LandingPage.aspx";
            //    /*error = "Number is required";*/
           
            //}

           
        }
    </script>--%>
    <%--<script type="text/javascript">

        function message() {
            alert("You cant check more than 1 checkbox ")
        }
        document.querySelectorAll(".cgroup").forEach((chbx) => {
            chbx.addEventListener("change", (e) => {
                if (!e.target.checked) return;
                var checkedbox = Array.from(document.querySelectorAll(".cgroup")).find(chbx => chbx != e.target && chbx.checked)
                if (checkedbox) {
                    e.target.checked = false
                    message()
                }
            })
        })

    </script>--%>

</head>

<body>
    <form id="form1" runat="server" autocomplete="off">
        <!--Header starts here-->
        <%--  <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" EnablePartialRendering="true" CombineScripts="false" >
    </asp:ToolkitScriptManager>--%>
        <div id="header">
            <div class="toplinkarea">
                <h1 class="logo"></h1>
            </div>
            <asp:Button ID="Btn_Logout" OnClick="Btn_Logout_Click" runat="server" Text="Logout" Style="position: absolute; margin-top: 40px; float: right; font-size: 21px; width: 149px; height: 30px; border-radius: 25px; background-color: #fdc82f; top: 1px; left: 1282px;" />
        </div>



        <!--Header ends here-->
        <%-- <div id="holder" style="height: 230px;" >--%>
        <div class="center" style="margin-bottom: 4px; margin-top: 4px; width: 1470px; height: 900px; border: 5px solid #36b37d; margin-left: 25px; border-radius: 25px;">
            <div style="margin-top: 7px; width: 883px; height: 249px; margin-left: 40px; border: 5px solid #36b37d; border-radius: 25px;">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label1" runat="server" Text="Program Name :" Style="color: #fdc82f; font-size: 15px; resize: vertical;"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:DropDownList ID="DropDownList1" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged2" AutoPostBack="true" runat="server" Style="text-align: center; border-radius: 20px; resize: vertical; margin-bottom: 0px; margin-top: 11px; margin-left: 140px;" Height="23px" Width="198px"></asp:DropDownList>
                <%-- <asp:TextBox ID="TextBox1" runat="server" Style="border-radius: 20px;resize: vertical; margin-bottom: 0px; margin-top: 11px; margin-left: 140px;" Height="23px" Width="198px"></asp:TextBox>--%>
                <br />
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <asp:Label ID="Label2" runat="server" Text="Requested Changes in effect on:" Style="color: #fdc82f; font-size: 15px; resize: vertical;"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                <asp:TextBox ID="TextBox2" runat="server" type="date" Style="text-align: center; border-radius: 20px; margin-bottom: 0px; margin-top: 4px; margin-left: 33px;" Height="30px" Width="198px" AutoPostBack="false"></asp:TextBox>
                <%--<asp:TextBox ID="TextBox2" runat="server" type="date" Style="text-align: center; border-radius: 20px; resize: vertical; margin-bottom: 0px; margin-top: 4px; margin-left: 33px;" Height="23px" Width="198px" AutoPostBack="true"></asp:TextBox>--%>
                <%--<div>
                    <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
                </div>--%>


                <br />
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <asp:Label ID="Label3" runat="server" Text="Number of general education course:" Style="color: #fdc82f; font-size: 15px; resize: vertical;"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox3" runat="server" ForeColor="Red" Text="Numeric Only." Style="text-align: center; border-radius: 20px; resize: vertical; margin-bottom: 0px; margin-top: 4px; margin-left: 6px;" Height="23px" Width="198px" EnableViewState="False" AutoPostBack="true"  OnTextChanged="TextBox3_TextChanged"  onkeypress="return Numbersonly(event)" onfocus="WaterMarkFocus(this,'Numeric Only.')" onblur="WaterMarkBlur(this,'Numeric Only.')"  ></asp:TextBox>



                <br />
                <br />
                <br />
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label4" runat="server" Text="Program Code:" Style="color: #fdc82f; font-size: 15px; resize: vertical;"></asp:Label>
                <asp:TextBox ID="TextBox4" runat="server" Style="text-align: center; border-radius: 20px; resize: vertical; margin-bottom: 0px; margin-top: 4px; margin-left: 11px;" Height="23px" Width="198px" EnableViewState="False" AutoPostBack="true"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;     
                <asp:Label ID="Label5" runat="server" Text="MTCU Code:" Style="color: #fdc82f; font-size: 15px; resize: vertical;"></asp:Label>
                <asp:TextBox ID="TextBox5" runat="server" Style="text-align: center; border-radius: 20px; resize: vertical; margin-bottom: 0px; margin-top: 4px; margin-left: 11px;" Height="23px" Width="198px" EnableViewState="False" AutoPostBack="true"></asp:TextBox>



                <div style="margin-top: -233px; width: 473px; height: 249px; margin-left: 900px; border: 5px solid #36b37d; border-radius: 25px;">
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label6" runat="server" Text="Current Cohort Affected(Circle one):" Style="color: #fdc82f; font-size: 15px; resize: vertical; position: absolute;"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  
                    <asp:CheckBox ID="CheckBox1" Text="Yes" runat="server" AutoPostBack="true" EnableViewState="True" OnCheckedChanged="CheckBox1_CheckedChanged" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:CheckBox ID="CheckBox2" Text="No" runat="server" EnableViewState="True" AutoPostBack="true" OnCheckedChanged="CheckBox2_CheckedChanged" />


                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label7" runat="server" Style="color: #fdc82f; font-size: 15px;" Text="Alternative Deliveries Exist(Circle one):"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:CheckBox ID="CheckBox3" Text="Yes" runat="server" EnableViewState="true" OnCheckedChanged="CheckBox3_CheckedChanged" AutoPostBack="true" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:CheckBox ID="CheckBox4" Text="No" runat="server" EnableViewState="True" OnCheckedChanged="CheckBox4_CheckedChanged" AutoPostBack="true" />

                    <br />
                    <br />

                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   
                    <asp:Label ID="Label9" runat="server" Text="Semester(Enter number of semesters):" Style="color: #fdc82f; font-size: 15px;"></asp:Label><asp:TextBox ID="TextBox6" runat="server" ForeColor="Red" Text="Numeric Only." Style="text-align: center; border-radius: 20px; margin-left: 16px" EnableViewState="False" AutoPostBack="true" OnClientClick="return false;" onkeypress="return Numbersonly(event)" OnTextChanged="TextBox6_TextChanged" onfocus="WaterMarkFocus(this,'Numeric Only.')" onblur="WaterMarkBlur(this,'Numeric Only.')"></asp:TextBox>
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label10" runat="server" Text="Years(Enter number of years):" Style="color: #fdc82f; font-size: 15px;"></asp:Label><asp:TextBox ID="TextBox7" runat="server" ForeColor="Red" Text="Numeric Only." Style="text-align: center; border-radius: 20px; margin-left: 74px" EnableViewState="False" AutoPostBack="true" OnClientClick="return false;" onkeypress="return Numbersonly(event)" OnTextChanged="TextBox7_TextChanged" onfocus="WaterMarkFocus(this,'Numeric Only.')" onblur="WaterMarkBlur(this,'Numeric Only.')"></asp:TextBox>
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:Label ID="Label8" runat="server" Text="Location Program Offered(Circle all that apply):" Style="color: #fdc82f; font-size: 15px;"></asp:Label>
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:CheckBox ID="CheckBox5" AutoPostBack="true" Text="Windsor" runat="server" EnableViewState="True" OnCheckedChanged="CheckBox5_CheckedChanged" />
                    <asp:CheckBox ID="CheckBox6" AutoPostBack="true" Text="Chatham" runat="server" EnableViewState="True" OnCheckedChanged="CheckBox6_CheckedChanged" />
                    <asp:CheckBox ID="CheckBox7" AutoPostBack="true" Text="Acumen" runat="server" EnableViewState="True" OnCheckedChanged="CheckBox7_CheckedChanged" />

                </div>

            </div>

            <br />
            <hr style="margin-right: 29px; margin-left: 29px; border-color: #fdc82f; border-width: 10px;" />
            <%--    <asp:GridView ID="GridView1" runat="server"></asp:GridView>
    <asp:GridView ID="GridView2" runat="server"></asp:GridView>--%>

            <div class="Container">
                <%--  <br />
                <asp:Label ID="Label11" runat="server" Text="Label"></asp:Label>
                <br />  --%>
                <asp:Label ID="Label11" runat="server" Text="Current Program Chart" Style="font-variant: petite-caps; margin-left: 29px; color: darkolivegreen; font-size: 16px;"></asp:Label>
                <asp:Panel ID="pnlSearchVendor" runat="server" Height="328px" Width="97%" ScrollBars="Vertical" Style="border-radius: 0px; margin-left: 30px;"
                    CssClass="">
                    <asp:GridView ID="GridView1" CssClass="table table-bordered table-hover table-responsive" AutoPostBack="True" runat="server" Style="width: 150px; height: 5px; overflow-y: auto" CellPadding="15" ForeColor="#333333" GridLines="None">
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
                        <%--    <Columns>
                        <asp:BoundField DataField="course_ID" HeaderText="course_ID" InsertVisible="false" ReadOnly="true" SortExpression="course_ID" />
                        <asp:BoundField DataField="Course_Code" HeaderText="Course_Code" InsertVisible="false" ReadOnly="true" SortExpression="Course_Code" />
                        <asp:BoundField DataField="Course_Title" HeaderText="Course_Title" InsertVisible="false" ReadOnly="true" SortExpression="Course_Title" />
                        <asp:BoundField DataField="Contact_Hours_Per_Week" HeaderText="Contact_Hours_Per_Week" InsertVisible="false" ReadOnly="true" SortExpression="Contact_Hours_Per_Week" />
                        <asp:BoundField DataField="Lecture/Lab_Ratio" HeaderText="Lecture/Lab_Ratio" InsertVisible="false" ReadOnly="true" SortExpression="Lecture/Lab_Ratio" />
                        <asp:BoundField DataField="Course_Credit" HeaderText="Course_Credit" InsertVisible="false" ReadOnly="true" SortExpression="Course_Credit" />
                        <asp:BoundField DataField="Total_Term_Hours" HeaderText="Total_Term_Hours" InsertVisible="false" ReadOnly="true" SortExpression="Total_Term_Hours" />
                        <asp:BoundField DataField="Semester_Length_In_Weeks" HeaderText="Semester_Length_In_Weeks" InsertVisible="false" ReadOnly="true" SortExpression="Semester_Length_In_Weeks" />
                        <asp:BoundField DataField="Co_requisities" HeaderText="Co_requisities" InsertVisible="false" ReadOnly="true" SortExpression="Co_requisities" />
                        <asp:BoundField DataField="Pre_requisities" HeaderText="Pre_requisities" InsertVisible="false" ReadOnly="true" SortExpression="Pre_requisities" />
                        <asp:BoundField DataField="Delivery_method" HeaderText="Delivery_method" InsertVisible="false" ReadOnly="true" SortExpression="Delivery_method" />


                    </Columns>--%>
                    </asp:GridView>
                </asp:Panel>

            </div>

            <br />

            <asp:Button ID="Btn_Save" runat="server" Text="Submit" Style="position: absolute; top: 971px; left: 1383px; font-size: 14px; width: 106px; height: 30px; border-radius: 25px; background-color: #fdc82f;" OnClick="Btn_Save_Click" />

            <asp:Button ID="ButtonAdd" runat="server" Text="Add New Changes" OnClick="ButtonAdd_Click" Style="float: right; margin-right: 160px; font-size: 14px; width: 140px; height: 30px; border-radius: 25px; background-color: #fdc82f;" />
            &nbsp;
            &nbsp;
            &nbsp;
            &nbsp;
            <asp:Button ID="Btn_delete" runat="server" Text="Delete" OnClick="Btn_delete_Click" Style="float: right; margin-right: 1px; font-size: 14px; width: 140px; height: 30px; border-radius: 25px; background-color: #fdc82f;" />
            <asp:Button ID="Btn_refresh" runat="server" Text="Refesh" OnClick="Btn_refresh_Click" Style="float: right; margin-right: 1px; font-size: 14px; width: 140px; height: 30px; border-radius: 25px; background-color: #fdc82f;" />
            <br />
            &nbsp;
            &nbsp;
            &nbsp;
             <div class="Container">
                 <asp:Panel ID="Panel1" runat="server" Height="116px" Width="81.5%" Style="border-radius: 0px; margin-left: 135px;" ScrollBars="Vertical">
                     <asp:GridView ID="Gridview2" runat="server" ShowFooter="true" AutoGenerateColumns="false" CssClass="table table-bordered table-hover table-responsive" AutoPostBack="True" Style="width: 100px; height: 5px; overflow-y: auto" CellPadding="4" ForeColor="#333333" GridLines="None">

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
                         <Columns>

                             <asp:BoundField DataField="RowNumber" HeaderText="Row Number" />


                             <asp:TemplateField HeaderText="Course Code.">

                                 <ItemTemplate>

                                     <asp:TextBox ID="TextBox2" runat="server" Style="width: 298px; height: 30px;" EnableViewState="False"></asp:TextBox>

                                 </ItemTemplate>

                                 <FooterStyle HorizontalAlign="Right" />

                                 <FooterTemplate>

                                     <%--  <asp:Button ID="ButtonAdd" runat="server" Text="Add New Row" OnClick="ButtonAdd_Click" />--%>
                                 </FooterTemplate>
                             </asp:TemplateField>
                             
                             <asp:TemplateField HeaderText="Rational for Proposed changes.">

                                 <ItemTemplate>

                                     <asp:TextBox ID="TextBox1" runat="server" Style="width: 798px; height: 30px;" EnableViewState="False"></asp:TextBox>

                                 </ItemTemplate>

                             </asp:TemplateField>



                         </Columns>

                     </asp:GridView>
                 </asp:Panel>
             </div>


        </div>


        <%-- </div>--%>
        <div class="footer_container">
            <div class="footer">
                <div>
                    <b>Version : <strong>
                        <asp:Label ID="lblAssemblyVersion" runat="server"></asp:Label></strong></b>
                </div>
                <p class="copy">
                    &copy;<b> 2022 St.Clair College. All Rights Reserved. </b>
                </p>
                <p class="footerlink">
                    <a href="#">Terms of Use</a> | <a href="#">Privacy Statement</a> | <a href="#">Site
                    Map</a>
                </p>
            </div>
        </div>
    </form>
</body>
</html>
