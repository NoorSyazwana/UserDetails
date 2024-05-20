<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditViewUser.aspx.cs" Inherits="UserDetails.EditViewUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="padding-top:30px">
            <table id="tblUser" runat="server" border="0" style="background-color:burlywood;width:100%">
                <tr><td>&nbsp;</td></tr>
                <tr>
                    <td>
                        <center>
                            <h3>List of users</h3>
                            <asp:GridView ID="grdUser" runat="server" AutoGenerateColumns="false"
                                PageSize="10" AllowPaging="true" AllowSorting="true" OnRowDataBound="grdUser_RowDataBound" 
                                OnRowCancelingEdit="grdUser_RowCancelingEdit" OnRowDeleting="grdUser_RowDeleting" 
                                OnRowUpdating="grdUser_RowUpdating" OnRowEditing="grdUser_RowEditing" DataKeyNames="UserID"
                                EmptyDataText="No records has been added." OnPageIndexChanging="grdUser_PageIndexChanging" 
                                OnSorting="grdUser_Sorting">

                                <Columns>
                                    <asp:TemplateField HeaderText="UserID" HeaderStyle-Width="100px" SortExpression="UserID">
                                        <ItemTemplate>
                                            <asp:Label ID="lblUserID" runat="server" Text='<%# Eval("UserID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:Label ID ="txtUserID" runat="server" Text='<%# Eval("UserID") %>'></asp:Label>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="UserName" HeaderStyle-Width="350px" SortExpression="UserName">
                                        <ItemTemplate>
                                            <asp:Label ID="lblUserName" runat="server" Text='<%# Eval("UserName") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtUserName" runat="server" Text='<%# Eval("UserName") %>' Width="100px"></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="UserNo" HeaderStyle-Width="150px" SortExpression="UserNo">
                                        <ItemTemplate>
                                            <asp:Label ID="lblUserNo" runat="server" Text='<%# Eval("UserNo") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtUserNo" runat="server" Text='<%# Eval("UserNo") %>' Width="100px"></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="CreateDate" HeaderStyle-Width="250px" SortExpression="CreateDate">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCreateDate" runat="server" Text='<%# Eval("CreateDate") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:Label ID="txtCreateDate" runat="server" Text='<%# Eval("CreateDate") %>'></asp:Label>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:CommandField ButtonType="Link" ShowEditButton="true" ShowDeleteButton="true" />
                                </Columns>
                            </asp:GridView>
                        </center>
                    </td>
                </tr>
                <tr><td>&nbsp;</td></tr>
                <tr><td><center><asp:Button ID="btnBack" runat="server" Text="Back" Width="100px" PostBackUrl="~/CreateUser.aspx" /></center></td></tr>
                <tr><td>&nbsp;</td></tr>
            </table>
        </div>
    </form>
</body>
</html>
