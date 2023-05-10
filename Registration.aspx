<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="St.Clair.Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Login1" runat="server" >

    <%--  <div id="login_container" style="border-radius: 25px; border-width: 7px; margin-top: -50px; border-color: #35B736; border-style: solid; /* border-width: thin; */height: 375px; /* border: thick; */background-color: rgb(230 221 221 / 0%); /* border-block-color: unset; */">--%>
     <asp:Button ID="Btn_Logout" runat="server" Text="Logout" OnClick="Btn_Logout_Click" Style="position: absolute; margin-top: 40px; float: right; font-size: 21px; width: 149px; height: 30px; border-radius: 25px; background-color: #fdc82f; top: 1px; left: 1282px;"/>
    <asp:Button ID="Btn_Import" runat="server" Text="Import Excel" OnClick="Btn_Import_Click" Style="position: absolute; top: 131px; left: 291px; height: 29px; width: 234px; background-color: #fdc82f; border-radius: 20px; font-size: 21px" CausesValidation="false"/>
    <asp:Button ID="Btn_AddUser" runat="server" Text="Add User" OnClick="Btn_AddUser_Click" Style="position: absolute; top: 130px; left: 1014px; height: 29px; width: 234px; background-color: #fdc82f; border-radius: 20px; font-size: 21px" CausesValidation="false"/>
    <div style="overflow-y: scroll;width: 100%;height: 350px;">
               <asp:GridView ID="gvUSER_MASTER" runat="server" AutoGenerateColumns="False" CssClass="Grid" Visible="true" 
        EmptyDataText="No Data Found" GridLines="Horizontal" Width="62%" DataKeyNames="UserId" Style="margin-left: 284px; overflow-y: scroll" 
       OnRowDeleted="gvUSER_MASTER_RowDeleted" OnRowCommand="gvUSER_MASTER_RowCommand" OnRowDataBound="gvUSER_MASTER_RowDataBound" OnPageIndexChanging="gvUSER_MASTER_PageIndexChanging" Height="151px" CellPadding="15" ForeColor="#333333">
        <RowStyle Height="20px" />
        <EmptyDataRowStyle CssClass="Grid_EmptyData" />

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
            <asp:BoundField DataField="UserId" HeaderText="UserId" HeaderStyle-CssClass="displayNone"
                ItemStyle-CssClass="displayNone" HeaderStyle-HorizontalAlign="Center">
                <HeaderStyle CssClass="displayNone" />
                <ItemStyle CssClass="displayNone" />
            </asp:BoundField>
            <asp:BoundField DataField="UserName" HeaderText="User Name" ItemStyle-Width="10%"
                HeaderStyle-Width="20%" HeaderStyle-HorizontalAlign="Center"></asp:BoundField>
            <asp:BoundField DataField="Password" HeaderText="Password" HeaderStyle-CssClass="displayNone"
                ItemStyle-CssClass="displayNone" HeaderStyle-HorizontalAlign="Center">
                <HeaderStyle CssClass="displayNone" />
                <ItemStyle CssClass="displayNone" />
            </asp:BoundField>
            <asp:BoundField DataField="EmailId" HeaderText="Email Id" ItemStyle-Width="30%" HeaderStyle-Width="10%"
                HeaderStyle-HorizontalAlign="Center"></asp:BoundField>
            <asp:BoundField DataField="RoleId" HeaderText="RoleId" HeaderStyle-CssClass="displayNone"
                ItemStyle-CssClass="displayNone" HeaderStyle-HorizontalAlign="Center">
                <HeaderStyle CssClass="displayNone" />
                <ItemStyle CssClass="displayNone" />
            </asp:BoundField>
            <asp:BoundField DataField="RoleName" HeaderText="Role Name" ItemStyle-Width="10%"
                HeaderStyle-Width="20%" HeaderStyle-HorizontalAlign="Center"></asp:BoundField>
            <asp:TemplateField HeaderText="Edit" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>

                    <asp:ImageButton ID="imgbtnEdit" CommandName="Modify" Text="Edit" runat="server"
                        TabIndex="6" ImageUrl="images/EditPencil.png" ToolTip="Edit" CommandArgument='<%# Container.DataItemIndex %>' Width="30px" Height="30px" />
                </ItemTemplate>
            </asp:TemplateField>
             <asp:TemplateField HeaderText="Delete" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>

                    <asp:ImageButton ID="imgbtndelete" CommandName="Delete_Row" Text="Delete" runat="server"
                        TabIndex="7" ImageUrl="images/delete.png" ToolTip="delete" CommandArgument='<%# Container.DataItemIndex %>' Width="30px" Height="30px" />
                </ItemTemplate>
            </asp:TemplateField>

        </Columns>
    </asp:GridView>
    </div>
 

    
    <%--    </div>--%>
    <div id="login_container" runat="server" style="margin-left: 414px; width: 584px; border-radius: 25px; border-width: 7px; margin-top: -398px; border-color: #35B736; border-style: solid; /* border-width: thin; */height: 375px; /* border: thick; */background-color: rgb(230 221 221 / 0%); /* border-block-color: unset; */">
        <br />
        <br />
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                     
        <asp:Button ID="Btn_Back" OnClick="Btn_Back_Click" runat="server" Text="Back" Style="position:absolute; top: 478px; left: 468px;font-size: 21px; width: 150px; height: 32px; background-color: #fdc82f; border-radius: 20px;" />
         <asp:Label ID="Label1" runat="server" Text="UserName:" Style="color: #fdc82f; font-size: 25px; resize: vertical;" ></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <asp:TextBox ID="TextBox1" runat="server" Style="text-align: center; width: 250px; border-radius: 20px; resize: vertical; margin-left: 8px; height: 25px;" AutoCompleteType="Disabled" autocomplete="off" ></asp:TextBox>

        <br />
        <br />
        <br />

        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   
          <asp:Label ID="Label2" runat="server" Text="Password:" Style="color: #fdc82f; font-size: 25px; resize: vertical;"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <asp:TextBox ID="TextBox2" runat="server" TextMode="Password" Style="text-align: center; width: 250px; border-radius: 20px; resize: vertical; margin-left: 15px; height: 25px;" autocomplete="off"></asp:TextBox>
        <br />
        <br />
        <br />

        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   
          <asp:Label ID="Label3" runat="server" Text="E-Mail id:" Style="color: #fdc82f; font-size: 25px; resize: vertical;"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <asp:TextBox ID="TextBox3" runat="server" Style="text-align: center; width: 250px; border-radius: 20px; resize: vertical; margin-left: 27px; height: 25px;"></asp:TextBox>
        <br />
        <br />
        <br />

        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   
          <asp:Label ID="Label4" runat="server" Text="Role:" Style="color: #fdc82f; font-size: 25px; resize: vertical;"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <asp:DropDownList ID="DropDownList1" runat="server" Style="text-align: center; width: 250px; border-radius: 20px; resize: vertical; margin-left: 75px; height: 30px;"></asp:DropDownList>
        <br />
        <br />
        <br />

        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

        &nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                
          <asp:Button ID="Button1" OnClick="Button1_Click" runat="server" Text="Submit" Style="font-size: 21px; width: 150px; height: 32px; background-color: #fdc82f; border-radius: 20px;" CausesValidation="false" />
    </div>
</asp:Content>
