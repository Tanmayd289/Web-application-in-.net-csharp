<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="CAE_LOAD.aspx.cs" Inherits="St.Clair.CAE_LOAD" MaintainScrollPositionOnPostback="true" %>

<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>St.Clair| Dashboard </title>

    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
    <!-- overlayScrollbars -->
    <link rel="stylesheet" href="plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="dist/css/adminlte.min.css">

    <script src="Scripts/FusionCharts/fusioncharts.js"></script>
    <script src="Scripts/FusionCharts/fusioncharts.charts.js"></script>
    
    <script type="text/javascript" src="https://cdn.fusioncharts.com/fusioncharts/latest/fusioncharts.js"></script>
    <script type="text/javascript" src="https://cdn.fusioncharts.com/fusioncharts/latest/themes/fusioncharts.theme.fusion.js"></script>

</head>
   
<body class="hold-transition dark-mode sidebar-mini layout-fixed layout-navbar-fixed layout-footer-fixed">
    <form runat="server">
        <div class="wrapper">

            <!-- Preloader -->
            <div class="preloader flex-column justify-content-center align-items-center">
                <img class="animation__wobble" src="images/logo.png" alt="logo" height="500" width="500">
            </div>

            <!-- Navbar -->
            <nav class="main-header navbar navbar-expand navbar-dark" style="height: 59px;">
                <!-- Left navbar links -->
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
                    </li>
                    <li class="nav-item d-none d-sm-inline-block">
                        <a href="index3.html" class="nav-link">Home</a>
                    </li>
                    <li class="nav-item d-none d-sm-inline-block">
                        <a href="#" class="nav-link">Contact</a>
                    </li>
                </ul>

                <!-- Right navbar links -->
                <ul class="navbar-nav ml-auto">
                    <!-- Navbar Search -->
                    <li class="nav-item">
                        <%-- <a class="nav-link" data-widget="navbar-search" href="#" role="button">
                            <i class="fas fa-search"></i>
                        </a>--%>
                        <div class="navbar-search-block">
                            <form class="form-inline">

                                <div class="input-group input-group-sm">
                                    <input class="form-control form-control-navbar" type="search" placeholder="Search" aria-label="Search">
                                    <div class="input-group-append">
                                        <button class="btn btn-navbar" type="submit">
                                            <i class="fas fa-search"></i>
                                        </button>
                                        <button class="btn btn-navbar" type="button" data-widget="navbar-search">
                                            <i class="fas fa-times"></i>
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </li>

                    <!-- Messages Dropdown Menu -->
                    <!-- Notifications Dropdown Menu -->
                    <li class="nav-item">
                        <a class="nav-link" data-widget="fullscreen" href="#" role="button">
                            <i class="fas fa-expand-arrows-alt"></i>
                        </a>
                    </li>
                    <%-- <li class="nav-item">
                        <a class="nav-link" data-widget="control-sidebar" data-slide="true" href="#" role="button">
                            <i class="fas fa-th-large"></i>
                        </a>
                    </li>--%>
                </ul>
            </nav>
            <!-- /.navbar -->

            <!-- Main Sidebar Container -->
            <aside class="main-sidebar sidebar-dark-primary elevation-4">
                <!-- Brand Logo -->
                <a href="index3.html" class="brand-link">
                    <img src="images/STClair.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="/* opacity: 2.8; */border-radius: unset;">
                    <span class="brand-text font-weight-light">STClair</span>
                </a>

                <!-- Sidebar -->
                <div class="sidebar">
                    <!-- Sidebar user panel (optional) -->
                    <div class="user-panel mt-3 pb-3 mb-3 d-flex">
                        <div class="image">
                            <img src="dist/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">
                        </div>
                        <div class="info">
                            <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
                            <%--<a href="#" class="d-block">Alexander Pierce</a>--%>
                        </div>
                    </div>

                    <!-- SidebarSearch Form -->
                    <div class="form-inline">
                        <div class="input-group" data-widget="sidebar-search">
                            <input class="form-control form-control-sidebar" type="search" placeholder="Search" aria-label="Search">
                            <div class="input-group-append">
                                <button class="btn btn-sidebar">
                                    <i class="fas fa-search fa-fw"></i>
                                </button>
                            </div>
                        </div>
                    </div>

                    <!-- Sidebar Menu -->
                    <nav class="mt-2">
                        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                            <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
                            <li class="nav-item menu-open">
                                <a href="#" class="nav-link active">
                                    <i class="nav-icon fas fa-tachometer-alt"></i>
                                    <p>
                                        Dashboard
                <i class="right fas fa-angle"></i>
                                    </p>
                                </a>
                                 <ul class="nav nav-treeview">
                                    <%--<li class="nav-item">
                                        <a href="./index.html" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Dashboard</p>
                                        </a>
                                    </li>--%>
                                    <li class="nav-item">
                                        <a href="./CAE_Form.aspx" class="nav-link active">
                                            <i class="fa fa-arrow-left" aria-hidden="true"></i>
                                            <p>Back</p>
                                        </a>
                                    </li>
                                    <%--    <li class="nav-item">
                                        <a href="./index3.html" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Dashboard v3</p>
                                        </a>
                                    </li>--%>
                                </ul>
                                <ul class="nav nav-treeview">
                                    <%--<li class="nav-item">
                                        <a href="./index.html" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Dashboard</p>
                                        </a>
                                    </li>--%>
                                    <li class="nav-item">
                                        <a href="./Login.aspx" class="nav-link active">
                                            <i class="nav-icon fa fa-sign-out-alt"></i>
                                            <p>Logout</p>
                                        </a>
                                    </li>
                                    <%--    <li class="nav-item">
                                        <a href="./index3.html" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Dashboard v3</p>
                                        </a>
                                    </li>--%>
                                </ul>
                            </li>

                        </ul>
                    </nav>
                    <!-- /.sidebar-menu -->
                </div>
                <!-- /.sidebar -->
            </aside>

            <!-- Content Wrapper. Contains page content -->
            <div class="row">
            </div>
            <br />



            <div class="content-wrapper">
                <!-- Content Header (Page header) -->

                <!-- /.content-header -->

                <!-- Main content -->
                <section class="content">
                    <div class="container-fluid">
                        <!-- Info boxes -->

                        <!-- /.row -->


                        <!-- /.row -->

                        <div class="row">
                            <div class="col-md-8" style="flex: none; max-width: none;">
                                <div class="card">
                                    <div class="card-header">
                                        <h3 class="card-title">Program chart</h3>

                                        <div class="card-tools">
                                            <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                                <i class="fas fa-minus"></i>
                                            </button>
                                            <button type="button" class="btn btn-tool" data-card-widget="remove">
                                                <i class="fas fa-times"></i>
                                            </button>
                                        </div>
                                        <%--   <div class="card-tools" style="padding-right: 50px;">

                                            <asp:Label ID="Label1" runat="server" Text="From:"></asp:Label>
                                            <asp:TextBox ID="Txt_From" type="date" runat="server" Style="text-align: center; border-radius: 20px;"></asp:TextBox>
                                            <asp:Label ID="Label2" runat="server" Text="TO:"></asp:Label>
                                            <asp:TextBox ID="txt_To" type="date" runat="server" Style="text-align: center; border-radius: 20px;"></asp:TextBox>
                                            <asp:Button ID="Btn_Search" runat="server" OnClick="Btn_Search_Click" Text="Search" Style="border-radius: 25px; background-color: #fdc82f;" />

                                        </div>--%>
                                    </div>
                                    <div class="card-body p-0">
                                        <div class="d-md-flex">
                                            <div class="p-1 flex-fill" style="overflow: hidden; height: 410px;">
                                                <!-- Map will be created here -->
                                                <div id="world-map-markers" style="height: 400px; overflow: hidden">
                                                    <div class="map">


                                                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                                                        <div id="panel" style="height: 500px; background-color: White; padding: 10px; overflow: auto">
                                                            <%--  <h1>
                                                        <a href="../adminIndex.aspx">Back </a>| Service Master  
                                                    </h1>--%>

                                                            <asp:UpdatePanel ID="UpdatePanelService" runat="server" UpdateMode="Conditional">
                                                                <ContentTemplate>
                                                                    <asp:GridView ID="gridService" CssClass="col-md-8" AutoGenerateColumns="false" AutoPostBack="True" runat="server" CellPadding="12" ForeColor="#333333"
                                                                        GridLines="None" PagerSettings-LastPageText="Next Page" AllowPaging="True" Style="max-width: 99.666667%;" PageSize="3" OnPageIndexChanging="gridService_PageIndexChanging">
                                                                        <%--Caption="Current Program Chart" CaptionAlign="Top"--%>
                                                                        <PagerSettings Mode="NumericFirstLast" PageButtonCount="3"  FirstPageText="First Page" LastPageText="Last Page"/>
                                                                        <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
                                                                        <RowStyle Height="1px" />

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
                                                                            <asp:BoundField ItemStyle-Width="150px" DataField="course_ID" HeaderText="Course ID" />
                                                                            <asp:BoundField ItemStyle-Width="150px" DataField="Course_Code" HeaderText="Course Code" />
                                                                            <asp:BoundField ItemStyle-Width="150px" DataField="Course_Title" HeaderText="Course Title" />
                                                                            <asp:BoundField ItemStyle-Width="150px" DataField="Contact_Hours_Per_Week" HeaderText="Contact Hours Per Week" />
                                                                            <asp:BoundField ItemStyle-Width="150px" DataField="Lecture/Lab_Ratio" HeaderText="Lecture/Lab_Ratio" />
                                                                            <asp:BoundField ItemStyle-Width="150px" DataField="Course_Credit" HeaderText="Course Credit" />
                                                                            <asp:BoundField ItemStyle-Width="150px" DataField="Total_Term_Hours" HeaderText="Total Term Hours" />
                                                                            <asp:BoundField ItemStyle-Width="150px" DataField="Semester_Length_In_Weeks" HeaderText="Semester Length In Weeks" />
                                                                            <asp:BoundField ItemStyle-Width="150px" DataField="Co_requisities" HeaderText="Co Requisities" />
                                                                            <asp:BoundField ItemStyle-Width="150px" DataField="Pre_requisities" HeaderText="Pre Requisities" />
                                                                            <asp:BoundField ItemStyle-Width="150px" DataField="Delivery_method" HeaderText="Delivery Method" />
                                                                        </Columns>

                                                                    </asp:GridView>
                                                                    <%--  <asp:UpdateProgress ID="UpdateProgress1" runat="server"
                                                                        AssociatedUpdatePanelID="UpdatePanelService">
                                                                        <ProgressTemplate>
                                                                            Please wait image is getting uploaded....  
                                                                        </ProgressTemplate>
                                                                    </asp:UpdateProgress>--%>
                                                                </ContentTemplate>
                                                                <Triggers>
                                                                </Triggers>
                                                            </asp:UpdatePanel>
                                                        </div>


                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-8" style="flex: none; max-width: none;">
                                <div class="card">
                                    <div class="card-header">
                                        <h3 class="card-title">Request's by Faculty</h3>

                                        <div class="card-tools">
                                            <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                                <i class="fas fa-minus"></i>
                                            </button>
                                            <button type="button" class="btn btn-tool" data-card-widget="remove">
                                                <i class="fas fa-times"></i>
                                            </button>
                                        </div>
                                    </div>
                                    <div class="card-body p-0">
                                        <div class="d-md-flex">
                                            <div class="p-1 flex-fill" style="overflow: hidden; height: 390px;">
                                                <!-- Map will be created here -->
                                                <div id="world-map-markers2" style="height: 360px; overflow: auto">
                                                    <div class="map">



                                                        <div id="panel2" style="background-color: White; padding: 10px">
                                                            <%--  <h1>
                                                        <a href="../adminIndex.aspx">Back </a>| Service Master  
                                                    </h1>--%>

                                                            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                                                <ContentTemplate>
                                                                    <asp:GridView ID="GridView1" CssClass="col-md-8" AutoGenerateColumns="false" AutoPostBack="True" runat="server" CellPadding="12" ForeColor="#333333"
                                                                        GridLines="None" AllowPaging="True" Style="max-width: 99.666667%;" PageSize="3" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowEditing="GridView1_RowEditing" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" >
                                                                   
                                                                         <PagerSettings Mode="NumericFirstLast" PageButtonCount="4"  FirstPageText="First Page" LastPageText="Last Page"/>
                                                                        <%--Caption="Current Program Chart" CaptionAlign="Top"--%>
                                                                        
                                                                        <RowStyle BackColor="#E3EAEB"></RowStyle>

                                                                        <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>

                                                                        <Columns>
                                                                            <asp:BoundField ItemStyle-Width="150px" DataField="Program_Name" HeaderText="Program Name" >
                                                                            <ItemStyle Width="150px" />
                                                                            </asp:BoundField>
                                                                            <asp:BoundField ItemStyle-Width="150px" DataField="Program_Code" HeaderText="Program Code" >
                                                                            <ItemStyle Width="150px" />
                                                                            </asp:BoundField>
                                                                            <asp:BoundField ItemStyle-Width="150px" DataField="Course_Title" HeaderText="Course Title" >
                                                                            <ItemStyle Width="150px" />
                                                                            </asp:BoundField>
                                                                            <asp:BoundField ItemStyle-Width="150px" DataField="Rational_for_Proposed_changes" HeaderText="Rational for Proposed changes" >
                                                                            <ItemStyle Width="150px" />
                                                                            </asp:BoundField>
                                                                            <asp:BoundField ItemStyle-Width="150px" DataField="Changes_Course_Code" HeaderText="Changes Course Code" >
                                                                            <ItemStyle Width="150px" />
                                                                            </asp:BoundField>
                                                                            <asp:BoundField ItemStyle-Width="150px" DataField="MTCU_Code" HeaderText="MTCU Code" >
                                                                            <ItemStyle Width="150px" />
                                                                            </asp:BoundField>
                                                                            <asp:BoundField ItemStyle-Width="150px" DataField="UserName" HeaderText="UserName" >
                                                                            <ItemStyle Width="150px" />
                                                                            </asp:BoundField>
                                                                        </Columns>

                                                                        <EditRowStyle BackColor="#7C6F57"></EditRowStyle>

                                                                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White"></FooterStyle>

                                                                        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White"></HeaderStyle>

                                                                        <PagerSettings LastPageText="Next Page" />

                                                                        <PagerStyle HorizontalAlign="Center" BackColor="#666666" ForeColor="White"></PagerStyle>

                                                                        <RowStyle Height="1px" />

                                                                        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>

                                                                        <SortedAscendingCellStyle BackColor="#F8FAFA"></SortedAscendingCellStyle>

                                                                        <SortedAscendingHeaderStyle BackColor="#246B61"></SortedAscendingHeaderStyle>

                                                                        <SortedDescendingCellStyle BackColor="#D4DFE1"></SortedDescendingCellStyle>

                                                                        <SortedDescendingHeaderStyle BackColor="#15524A"></SortedDescendingHeaderStyle>

                                                                    </asp:GridView>
                                                                    <%--  <asp:UpdateProgress ID="UpdateProgress1" runat="server"
                                                                        AssociatedUpdatePanelID="UpdatePanelService">
                                                                        <ProgressTemplate>
                                                                            Please wait image is getting uploaded....  
                                                                        </ProgressTemplate>
                                                                    </asp:UpdateProgress>--%>
                                                                </ContentTemplate>
                                                                <Triggers>
                                                                </Triggers>
                                                            </asp:UpdatePanel>
                                                        </div>


                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-8" style="flex: none; max-width: none;">
                                <div class="card">
                                    <div class="card-header">
                                        <h3 class="card-title">Changes</h3>

                                        <div class="card-tools">
                                            <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                                <i class="fas fa-minus"></i>
                                            </button>
                                            <button type="button" class="btn btn-tool" data-card-widget="remove">
                                                <i class="fas fa-times"></i>
                                            </button>
                                        </div>
                                        <div class="card-tools" style="padding-right: 50px;">

                                            <%--<asp:Label ID="Label5" runat="server" Text="From:"></asp:Label>
                                            <asp:TextBox ID="TextBox3" type="date" runat="server" Style="text-align: center; border-radius: 20px;"></asp:TextBox>
                                            <asp:Label ID="Label6" runat="server" Text="TO:"></asp:Label>
                                            <asp:TextBox ID="TextBox4" type="date" runat="server" Style="text-align: center; border-radius: 20px;"></asp:TextBox>--%>
                                            <asp:Button ID="Btn_Save" runat="server" Text="Submit" OnClick="Btn_Save_Click1" Style="float: right; margin-right: 1px; font-size: 14px; width: 140px; height: 30px; border-radius: 25px; background-color: #fdc82f;" />
                                            <asp:Button ID="ButtonAdd" runat="server" Text="Add New Changes" OnClick="ButtonAdd_Click1" Style="border-radius: 25px; background-color: #fdc82f;" />
                                            <asp:Button ID="Btn_delete" runat="server" Text="Delete" OnClick="Btn_delete_Click" Style="float: right; margin-right: 1px; font-size: 14px; width: 140px; height: 30px; border-radius: 25px; background-color: #fdc82f;" />
                                            <%--<asp:Button ID="Button2" runat="server" OnClick="Btn_Search_Click" Text="Search" Style="border-radius: 25px; background-color: #fdc82f;" />--%>
                                        </div>
                                    </div>
                                    <div class="card-body p-0">
                                        <div class="d-md-flex">
                                            <div class="p-1 flex-fill" style="overflow: hidden; height: 390px;">
                                                <!-- Map will be created here -->
                                                <div id="world-map-markers3" style="height: 360px; overflow-y: scroll">
                                                    <div class="map">
                                                        <asp:Panel ID="Panel1" runat="server" Style="border-radius: 0px;">
                                                            <asp:GridView ID="Gridview2" runat="server" ShowFooter="true" AutoGenerateColumns="false" CssClass="table table-bordered table-hover table-responsive"
                                                                AutoPostBack="True" Style="max-width: 99.666667%;" CellPadding="12" ForeColor="#333333" GridLines="None">

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

                                                                            <asp:TextBox ID="TextBox2" runat="server" EnableViewState="False"></asp:TextBox>

                                                                        </ItemTemplate>

                                                                        <FooterStyle HorizontalAlign="Right" />

                                                                        <FooterTemplate>

                                                                            <%--  <asp:Button ID="ButtonAdd" runat="server" Text="Add New Row" OnClick="ButtonAdd_Click" />--%>
                                                                        </FooterTemplate>
                                                                    </asp:TemplateField>

                                                                    <asp:TemplateField ItemStyle-Width="1500px" HeaderText="Rational for Proposed changes.">

                                                                        <ItemTemplate>

                                                                            <asp:TextBox ID="TextBox1" runat="server" Width="800px" EnableViewState="False"></asp:TextBox>

                                                                        </ItemTemplate>

                                                                    </asp:TemplateField>

                                                                  
                                                                </Columns>

                                                            </asp:GridView>
                                                        </asp:Panel>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Main row -->
                    <%--<div class="row">
                        <!-- Left col -->
                        <div class="col-md-8">
                            <!-- MAP & BOX PANE -->
                            <div class="card">
                                <div class="card-header">
                                    <h3 class="card-title">US-Visitors Report</h3>

                                    <div class="card-tools">
                                        <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                            <i class="fas fa-minus"></i>
                                        </button>
                                        <button type="button" class="btn btn-tool" data-card-widget="remove">
                                            <i class="fas fa-times"></i>
                                        </button>
                                    </div>
                                </div>
                                <!-- /.card-header -->
                                <div class="card-body p-0">
                                    <div class="d-md-flex">
                                        <div class="p-1 flex-fill" style="overflow: hidden">
                                            <!-- Map will be created here -->
                                            <div id="world-map-markers" style="height: 325px; overflow: hidden">
                                                <div class="map"></div>
                                            </div>
                                        </div>
                                        <div class="card-pane-right bg-success pt-2 pb-2 pl-4 pr-4">
                                            <div class="description-block mb-4">
                                                <div class="sparkbar pad" data-color="#fff">90,70,90,70,75,80,70</div>
                                                <h5 class="description-header">8390</h5>
                                                <span class="description-text">Visits</span>
                                            </div>
                                            <!-- /.description-block -->
                                            <div class="description-block mb-4">
                                                <div class="sparkbar pad" data-color="#fff">90,50,90,70,61,83,63</div>
                                                <h5 class="description-header">30%</h5>
                                                <span class="description-text">Referrals</span>
                                            </div>
                                            <!-- /.description-block -->
                                            <div class="description-block">
                                                <div class="sparkbar pad" data-color="#fff">90,50,90,70,61,83,63</div>
                                                <h5 class="description-header">70%</h5>
                                                <span class="description-text">Organic</span>
                                            </div>
                                            <!-- /.description-block -->
                                        </div>
                                        <!-- /.card-pane-right -->
                                    </div>
                                    <!-- /.d-md-flex -->
                                </div>
                                <!-- /.card-body -->
                            </div>
                            <!-- /.card -->
                            <div class="row">
                                <div class="col-md-6">
                                    <!-- DIRECT CHAT -->
                                    <div class="card direct-chat direct-chat-warning">
                                        <div class="card-header">
                                            <h3 class="card-title">Direct Chat</h3>

                                            <div class="card-tools">
                                                <span title="3 New Messages" class="badge badge-warning">3</span>
                                                <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                                    <i class="fas fa-minus"></i>
                                                </button>
                                                <button type="button" class="btn btn-tool" title="Contacts" data-widget="chat-pane-toggle">
                                                    <i class="fas fa-comments"></i>
                                                </button>
                                                <button type="button" class="btn btn-tool" data-card-widget="remove">
                                                    <i class="fas fa-times"></i>
                                                </button>
                                            </div>
                                        </div>
                                        <!-- /.card-header -->
                                        <div class="card-body">
                                            <!-- Conversations are loaded here -->
                                            <div class="direct-chat-messages">
                                                <!-- Message. Default to the left -->
                                                <div class="direct-chat-msg">
                                                    <div class="direct-chat-infos clearfix">
                                                        <span class="direct-chat-name float-left">Alexander Pierce</span>
                                                        <span class="direct-chat-timestamp float-right">23 Jan 2:00 pm</span>
                                                    </div>
                                                    <!-- /.direct-chat-infos -->
                                                    <img class="direct-chat-img" src="dist/img/user1-128x128.jpg" alt="message user image">
                                                    <!-- /.direct-chat-img -->
                                                    <div class="direct-chat-text">
                                                        Is this template really for free? That's unbelievable!
                                                    </div>
                                                    <!-- /.direct-chat-text -->
                                                </div>
                                                <!-- /.direct-chat-msg -->

                                                <!-- Message to the right -->
                                                <div class="direct-chat-msg right">
                                                    <div class="direct-chat-infos clearfix">
                                                        <span class="direct-chat-name float-right">Sarah Bullock</span>
                                                        <span class="direct-chat-timestamp float-left">23 Jan 2:05 pm</span>
                                                    </div>
                                                    <!-- /.direct-chat-infos -->
                                                    <img class="direct-chat-img" src="dist/img/user3-128x128.jpg" alt="message user image">
                                                    <!-- /.direct-chat-img -->
                                                    <div class="direct-chat-text">
                                                        You better believe it!
                                                    </div>
                                                    <!-- /.direct-chat-text -->
                                                </div>
                                                <!-- /.direct-chat-msg -->

                                                <!-- Message. Default to the left -->
                                                <div class="direct-chat-msg">
                                                    <div class="direct-chat-infos clearfix">
                                                        <span class="direct-chat-name float-left">Alexander Pierce</span>
                                                        <span class="direct-chat-timestamp float-right">23 Jan 5:37 pm</span>
                                                    </div>
                                                    <!-- /.direct-chat-infos -->
                                                    <img class="direct-chat-img" src="dist/img/user1-128x128.jpg" alt="message user image">
                                                    <!-- /.direct-chat-img -->
                                                    <div class="direct-chat-text">
                                                        Working with AdminLTE on a great new app! Wanna join?
                                                    </div>
                                                    <!-- /.direct-chat-text -->
                                                </div>
                                                <!-- /.direct-chat-msg -->

                                                <!-- Message to the right -->
                                                <div class="direct-chat-msg right">
                                                    <div class="direct-chat-infos clearfix">
                                                        <span class="direct-chat-name float-right">Sarah Bullock</span>
                                                        <span class="direct-chat-timestamp float-left">23 Jan 6:10 pm</span>
                                                    </div>
                                                    <!-- /.direct-chat-infos -->
                                                    <img class="direct-chat-img" src="dist/img/user3-128x128.jpg" alt="message user image">
                                                    <!-- /.direct-chat-img -->
                                                    <div class="direct-chat-text">
                                                        I would love to.
                                                    </div>
                                                    <!-- /.direct-chat-text -->
                                                </div>
                                                <!-- /.direct-chat-msg -->

                                            </div>
                                            <!--/.direct-chat-messages-->

                                            <!-- Contacts are loaded here -->
                                            <div class="direct-chat-contacts">
                                                <ul class="contacts-list">
                                                    <li>
                                                        <a href="#">
                                                            <img class="contacts-list-img" src="dist/img/user1-128x128.jpg" alt="User Avatar">

                                                            <div class="contacts-list-info">
                                                                <span class="contacts-list-name">Count Dracula
                                <small class="contacts-list-date float-right">2/28/2015</small>
                                                                </span>
                                                                <span class="contacts-list-msg">How have you been? I was...</span>
                                                            </div>
                                                            <!-- /.contacts-list-info -->
                                                        </a>
                                                    </li>
                                                    <!-- End Contact Item -->
                                                    <li>
                                                        <a href="#">
                                                            <img class="contacts-list-img" src="dist/img/user7-128x128.jpg" alt="User Avatar">

                                                            <div class="contacts-list-info">
                                                                <span class="contacts-list-name">Sarah Doe
                                <small class="contacts-list-date float-right">2/23/2015</small>
                                                                </span>
                                                                <span class="contacts-list-msg">I will be waiting for...</span>
                                                            </div>
                                                            <!-- /.contacts-list-info -->
                                                        </a>
                                                    </li>
                                                    <!-- End Contact Item -->
                                                    <li>
                                                        <a href="#">
                                                            <img class="contacts-list-img" src="dist/img/user3-128x128.jpg" alt="User Avatar">

                                                            <div class="contacts-list-info">
                                                                <span class="contacts-list-name">Nadia Jolie
                                <small class="contacts-list-date float-right">2/20/2015</small>
                                                                </span>
                                                                <span class="contacts-list-msg">I'll call you back at...</span>
                                                            </div>
                                                            <!-- /.contacts-list-info -->
                                                        </a>
                                                    </li>
                                                    <!-- End Contact Item -->
                                                    <li>
                                                        <a href="#">
                                                            <img class="contacts-list-img" src="dist/img/user5-128x128.jpg" alt="User Avatar">

                                                            <div class="contacts-list-info">
                                                                <span class="contacts-list-name">Nora S. Vans
                                <small class="contacts-list-date float-right">2/10/2015</small>
                                                                </span>
                                                                <span class="contacts-list-msg">Where is your new...</span>
                                                            </div>
                                                            <!-- /.contacts-list-info -->
                                                        </a>
                                                    </li>
                                                    <!-- End Contact Item -->
                                                    <li>
                                                        <a href="#">
                                                            <img class="contacts-list-img" src="dist/img/user6-128x128.jpg" alt="User Avatar">

                                                            <div class="contacts-list-info">
                                                                <span class="contacts-list-name">John K.
                                <small class="contacts-list-date float-right">1/27/2015</small>
                                                                </span>
                                                                <span class="contacts-list-msg">Can I take a look at...</span>
                                                            </div>
                                                            <!-- /.contacts-list-info -->
                                                        </a>
                                                    </li>
                                                    <!-- End Contact Item -->
                                                    <li>
                                                        <a href="#">
                                                            <img class="contacts-list-img" src="dist/img/user8-128x128.jpg" alt="User Avatar">

                                                            <div class="contacts-list-info">
                                                                <span class="contacts-list-name">Kenneth M.
                                <small class="contacts-list-date float-right">1/4/2015</small>
                                                                </span>
                                                                <span class="contacts-list-msg">Never mind I found...</span>
                                                            </div>
                                                            <!-- /.contacts-list-info -->
                                                        </a>
                                                    </li>
                                                    <!-- End Contact Item -->
                                                </ul>
                                                <!-- /.contacts-list -->
                                            </div>
                                            <!-- /.direct-chat-pane -->
                                        </div>
                                        <!-- /.card-body -->
                                        <div class="card-footer">
                                            <form action="#" method="post">
                                                <div class="input-group">
                                                    <input type="text" name="message" placeholder="Type Message ..." class="form-control">
                                                    <span class="input-group-append">
                                                        <button type="button" class="btn btn-warning">Send</button>
                                                    </span>
                                                </div>
                                            </form>
                                        </div>
                                        <!-- /.card-footer-->
                                    </div>
                                    <!--/.direct-chat -->
                                </div>
                                <!-- /.col -->

                                <div class="col-md-6">
                                    <!-- USERS LIST -->
                                    <div class="card">
                                        <div class="card-header">
                                            <h3 class="card-title">Latest Members</h3>

                                            <div class="card-tools">
                                                <span class="badge badge-danger">8 New Members</span>
                                                <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                                    <i class="fas fa-minus"></i>
                                                </button>
                                                <button type="button" class="btn btn-tool" data-card-widget="remove">
                                                    <i class="fas fa-times"></i>
                                                </button>
                                            </div>
                                        </div>
                                        <!-- /.card-header -->
                                        <div class="card-body p-0">
                                            <ul class="users-list clearfix">
                                                <li>
                                                    <img src="dist/img/user1-128x128.jpg" alt="User Image">
                                                    <a class="users-list-name" href="#">Alexander Pierce</a>
                                                    <span class="users-list-date">Today</span>
                                                </li>
                                                <li>
                                                    <img src="dist/img/user8-128x128.jpg" alt="User Image">
                                                    <a class="users-list-name" href="#">Norman</a>
                                                    <span class="users-list-date">Yesterday</span>
                                                </li>
                                                <li>
                                                    <img src="dist/img/user7-128x128.jpg" alt="User Image">
                                                    <a class="users-list-name" href="#">Jane</a>
                                                    <span class="users-list-date">12 Jan</span>
                                                </li>
                                                <li>
                                                    <img src="dist/img/user6-128x128.jpg" alt="User Image">
                                                    <a class="users-list-name" href="#">John</a>
                                                    <span class="users-list-date">12 Jan</span>
                                                </li>
                                                <li>
                                                    <img src="dist/img/user2-160x160.jpg" alt="User Image">
                                                    <a class="users-list-name" href="#">Alexander</a>
                                                    <span class="users-list-date">13 Jan</span>
                                                </li>
                                                <li>
                                                    <img src="dist/img/user5-128x128.jpg" alt="User Image">
                                                    <a class="users-list-name" href="#">Sarah</a>
                                                    <span class="users-list-date">14 Jan</span>
                                                </li>
                                                <li>
                                                    <img src="dist/img/user4-128x128.jpg" alt="User Image">
                                                    <a class="users-list-name" href="#">Nora</a>
                                                    <span class="users-list-date">15 Jan</span>
                                                </li>
                                                <li>
                                                    <img src="dist/img/user3-128x128.jpg" alt="User Image">
                                                    <a class="users-list-name" href="#">Nadia</a>
                                                    <span class="users-list-date">15 Jan</span>
                                                </li>
                                            </ul>
                                            <!-- /.users-list -->
                                        </div>
                                        <!-- /.card-body -->
                                        <div class="card-footer text-center">
                                            <a href="javascript:">View All Users</a>
                                        </div>
                                        <!-- /.card-footer -->
                                    </div>
                                    <!--/.card -->
                                </div>
                                <!-- /.col -->
                            </div>
                            <!-- /.row -->

                            <!-- TABLE: LATEST ORDERS -->
                            <div class="card">
                                <div class="card-header border-transparent">
                                    <h3 class="card-title">Latest Orders</h3>

                                    <div class="card-tools">
                                        <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                            <i class="fas fa-minus"></i>
                                        </button>
                                        <button type="button" class="btn btn-tool" data-card-widget="remove">
                                            <i class="fas fa-times"></i>
                                        </button>
                                    </div>
                                </div>
                                <!-- /.card-header -->
                                <div class="card-body p-0">
                                    <div class="table-responsive">
                                        <table class="table m-0">
                                            <thead>
                                                <tr>
                                                    <th>Order ID</th>
                                                    <th>Item</th>
                                                    <th>Status</th>
                                                    <th>Popularity</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td><a href="pages/examples/invoice.html">OR9842</a></td>
                                                    <td>Call of Duty IV</td>
                                                    <td><span class="badge badge-success">Shipped</span></td>
                                                    <td>
                                                        <div class="sparkbar" data-color="#00a65a" data-height="20">90,80,90,-70,61,-83,63</div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td><a href="pages/examples/invoice.html">OR1848</a></td>
                                                    <td>Samsung Smart TV</td>
                                                    <td><span class="badge badge-warning">Pending</span></td>
                                                    <td>
                                                        <div class="sparkbar" data-color="#f39c12" data-height="20">90,80,-90,70,61,-83,68</div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td><a href="pages/examples/invoice.html">OR7429</a></td>
                                                    <td>iPhone 6 Plus</td>
                                                    <td><span class="badge badge-danger">Delivered</span></td>
                                                    <td>
                                                        <div class="sparkbar" data-color="#f56954" data-height="20">90,-80,90,70,-61,83,63</div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td><a href="pages/examples/invoice.html">OR7429</a></td>
                                                    <td>Samsung Smart TV</td>
                                                    <td><span class="badge badge-info">Processing</span></td>
                                                    <td>
                                                        <div class="sparkbar" data-color="#00c0ef" data-height="20">90,80,-90,70,-61,83,63</div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td><a href="pages/examples/invoice.html">OR1848</a></td>
                                                    <td>Samsung Smart TV</td>
                                                    <td><span class="badge badge-warning">Pending</span></td>
                                                    <td>
                                                        <div class="sparkbar" data-color="#f39c12" data-height="20">90,80,-90,70,61,-83,68</div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td><a href="pages/examples/invoice.html">OR7429</a></td>
                                                    <td>iPhone 6 Plus</td>
                                                    <td><span class="badge badge-danger">Delivered</span></td>
                                                    <td>
                                                        <div class="sparkbar" data-color="#f56954" data-height="20">90,-80,90,70,-61,83,63</div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td><a href="pages/examples/invoice.html">OR9842</a></td>
                                                    <td>Call of Duty IV</td>
                                                    <td><span class="badge badge-success">Shipped</span></td>
                                                    <td>
                                                        <div class="sparkbar" data-color="#00a65a" data-height="20">90,80,90,-70,61,-83,63</div>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <!-- /.table-responsive -->
                                </div>
                                <!-- /.card-body -->
                                <div class="card-footer clearfix">
                                    <a href="javascript:void(0)" class="btn btn-sm btn-info float-left">Place New Order</a>
                                    <a href="javascript:void(0)" class="btn btn-sm btn-secondary float-right">View All Orders</a>
                                </div>
                                <!-- /.card-footer -->
                            </div>
                            <!-- /.card -->
                        </div>
                        <!-- /.col -->

                        <div class="col-md-4">
                            <!-- Info Boxes Style 2 -->
                            <div class="info-box mb-3 bg-warning">
                                <span class="info-box-icon"><i class="fas fa-tag"></i></span>

                                <div class="info-box-content">
                                    <span class="info-box-text">Inventory</span>
                                    <span class="info-box-number">5,200</span>
                                </div>
                                <!-- /.info-box-content -->
                            </div>
                            <!-- /.info-box -->
                            <div class="info-box mb-3 bg-success">
                                <span class="info-box-icon"><i class="far fa-heart"></i></span>

                                <div class="info-box-content">
                                    <span class="info-box-text">Mentions</span>
                                    <span class="info-box-number">92,050</span>
                                </div>
                                <!-- /.info-box-content -->
                            </div>
                            <!-- /.info-box -->
                            <div class="info-box mb-3 bg-danger">
                                <span class="info-box-icon"><i class="fas fa-cloud-download-alt"></i></span>

                                <div class="info-box-content">
                                    <span class="info-box-text">Downloads</span>
                                    <span class="info-box-number">114,381</span>
                                </div>
                                <!-- /.info-box-content -->
                            </div>
                            <!-- /.info-box -->
                            <div class="info-box mb-3 bg-info">
                                <span class="info-box-icon"><i class="far fa-comment"></i></span>

                                <div class="info-box-content">
                                    <span class="info-box-text">Direct Messages</span>
                                    <span class="info-box-number">163,921</span>
                                </div>
                                <!-- /.info-box-content -->
                            </div>
                            <!-- /.info-box -->

                            <div class="card">
                                <div class="card-header">
                                    <h3 class="card-title">Browser Usage</h3>

                                    <div class="card-tools">
                                        <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                            <i class="fas fa-minus"></i>
                                        </button>
                                        <button type="button" class="btn btn-tool" data-card-widget="remove">
                                            <i class="fas fa-times"></i>
                                        </button>
                                    </div>
                                </div>
                                <!-- /.card-header -->
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-8">
                                            <div class="chart-responsive">
                                                <canvas id="pieChart" height="150"></canvas>
                                            </div>
                                            <!-- ./chart-responsive -->
                                        </div>
                                        <!-- /.col -->
                                        <div class="col-md-4">
                                            <ul class="chart-legend clearfix">
                                                <li><i class="far fa-circle text-danger"></i>Chrome</li>
                                                <li><i class="far fa-circle text-success"></i>IE</li>
                                                <li><i class="far fa-circle text-warning"></i>FireFox</li>
                                                <li><i class="far fa-circle text-info"></i>Safari</li>
                                                <li><i class="far fa-circle text-primary"></i>Opera</li>
                                                <li><i class="far fa-circle text-secondary"></i>Navigator</li>
                                            </ul>
                                        </div>
                                        <!-- /.col -->
                                    </div>
                                    <!-- /.row -->
                                </div>
                                <!-- /.card-body -->
                                <div class="card-footer p-0">
                                    <ul class="nav nav-pills flex-column">
                                        <li class="nav-item">
                                            <a href="#" class="nav-link">United States of America
                      <span class="float-right text-danger">
                          <i class="fas fa-arrow-down text-sm"></i>
                          12%</span>
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a href="#" class="nav-link">India
                      <span class="float-right text-success">
                          <i class="fas fa-arrow-up text-sm"></i>4%
                      </span>
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a href="#" class="nav-link">China
                      <span class="float-right text-warning">
                          <i class="fas fa-arrow-left text-sm"></i>0%
                      </span>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                                <!-- /.footer -->
                            </div>
                            <!-- /.card -->

                            <!-- PRODUCT LIST -->
                            <div class="card">
                                <div class="card-header">
                                    <h3 class="card-title">Recently Added Products</h3>

                                    <div class="card-tools">
                                        <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                            <i class="fas fa-minus"></i>
                                        </button>
                                        <button type="button" class="btn btn-tool" data-card-widget="remove">
                                            <i class="fas fa-times"></i>
                                        </button>
                                    </div>
                                </div>
                                <!-- /.card-header -->
                                <div class="card-body p-0">
                                    <ul class="products-list product-list-in-card pl-2 pr-2">
                                        <li class="item">
                                            <div class="product-img">
                                                <img src="dist/img/default-150x150.png" alt="Product Image" class="img-size-50">
                                            </div>
                                            <div class="product-info">
                                                <a href="javascript:void(0)" class="product-title">Samsung TV
                        <span class="badge badge-warning float-right">$1800</span></a>
                                                <span class="product-description">Samsung 32" 1080p 60Hz LED Smart HDTV.
                                                </span>
                                            </div>
                                        </li>
                                        <!-- /.item -->
                                        <li class="item">
                                            <div class="product-img">
                                                <img src="dist/img/default-150x150.png" alt="Product Image" class="img-size-50">
                                            </div>
                                            <div class="product-info">
                                                <a href="javascript:void(0)" class="product-title">Bicycle
                        <span class="badge badge-info float-right">$700</span></a>
                                                <span class="product-description">26" Mongoose Dolomite Men's 7-speed, Navy Blue.
                                                </span>
                                            </div>
                                        </li>
                                        <!-- /.item -->
                                        <li class="item">
                                            <div class="product-img">
                                                <img src="dist/img/default-150x150.png" alt="Product Image" class="img-size-50">
                                            </div>
                                            <div class="product-info">
                                                <a href="javascript:void(0)" class="product-title">Xbox One <span class="badge badge-danger float-right">$350
                                                </span>
                                                </a>
                                                <span class="product-description">Xbox One Console Bundle with Halo Master Chief Collection.
                                                </span>
                                            </div>
                                        </li>
                                        <!-- /.item -->
                                        <li class="item">
                                            <div class="product-img">
                                                <img src="dist/img/default-150x150.png" alt="Product Image" class="img-size-50">
                                            </div>
                                            <div class="product-info">
                                                <a href="javascript:void(0)" class="product-title">PlayStation 4
                        <span class="badge badge-success float-right">$399</span></a>
                                                <span class="product-description">PlayStation 4 500GB Console (PS4)
                                                </span>
                                            </div>
                                        </li>
                                        <!-- /.item -->
                                    </ul>
                                </div>
                                <!-- /.card-body -->
                                <div class="card-footer text-center">
                                    <a href="javascript:void(0)" class="uppercase">View All Products</a>
                                </div>
                                <!-- /.card-footer -->
                            </div>
                            <!-- /.card -->
                        </div>
                        <!-- /.col -->
                    </div>--%>
                    <!-- /.row -->
            </div>
            <!--/. container-fluid -->
            </section>
                <!-- /.content -->
        </div>
        <!-- /.content-wrapper -->

        <!-- Control Sidebar -->
        <aside class="control-sidebar control-sidebar-dark">
            <!-- Control sidebar content goes here -->
        </aside>
        <!-- /.control-sidebar -->

        <!-- Main Footer -->
        <footer class="main-footer">
            <strong>Copyright &copy; 2014-2021 <a href="https://www.stclaircollege.ca/" target="_blank">St.Clair</a>.</strong>
            All rights reserved.
    <div class="float-right d-none d-sm-inline-block">
        <b>Version</b> 1.0.0
    </div>
        </footer>
        </div>
        <!-- ./wrapper -->

        <!-- REQUIRED SCRIPTS -->
        <!-- jQuery -->
        <script src="plugins/jquery/jquery.min.js"></script>
        <!-- Bootstrap -->
        <script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
        <!-- overlayScrollbars -->
        <script src="plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
        <!-- AdminLTE App -->
        <script src="dist/js/adminlte.js"></script>

        <!-- PAGE PLUGINS -->
        <!-- jQuery Mapael -->
        <script src="plugins/jquery-mousewheel/jquery.mousewheel.js"></script>
        <script src="plugins/raphael/raphael.min.js"></script>
        <script src="plugins/jquery-mapael/jquery.mapael.min.js"></script>
        <script src="plugins/jquery-mapael/maps/usa_states.min.js"></script>
        <!-- ChartJS -->
        <script src="plugins/chart.js/Chart.min.js"></script>

        <!-- AdminLTE for demo purposes -->
        <script src="dist/js/demo.js"></script>
        <!-- AdminLTE dashboard demo (This is only for demo purposes) -->
        <script src="dist/js/pages/dashboard2.js"></script>
    </form>
</body>
</html>
