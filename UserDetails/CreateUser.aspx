<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateUser.aspx.cs" Inherits="UserDetails.CreateUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Details</title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="padding-top:30px">
            <center>
                <table id="tblUser" runat="server" border="0" style="background-color:burlywood;width:400px">
                    <tr>
                        <td colspan="3">&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="3"><center><h2><u>Register</u></h2></center></td>
                    </tr>
                    <tr>
                        <td style="text-align:right"><asp:Label ID="lblUsername" runat="server">User Name</asp:Label></td>
                        <td>:</td>
                        <td style="text-align:left"><asp:TextBox ID="txtUsername" runat="server" Width="200px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td style="text-align:right"><asp:Label ID="lblUserNo" runat="server">User No</asp:Label></td>
                        <td>:</td>
                        <td style="text-align:left"><asp:TextBox ID="txtUserNo" runat="server" Width="200px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td colspan="3" style="text-align:center"><asp:Label ID="lblInfo" runat="server" Visible="false" Font-Size="Smaller" ForeColor="red"></asp:Label></td>
                    </tr>
                    <tr>
                        <td colspan="3">&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <center>
                                <asp:Button ID="btnCreateUser" runat="server" Text="Create" Width="100px" OnClick="btnCreateUser_Click"/><br />
                                <asp:Label ID="lblViewUser" runat="server" Font-Size="Small">Click <a href="EditViewUser.aspx">here</a> to view/edit existing user</asp:Label>
                            </center></td>
                    </tr>
                    <tr>
                        <td colspan="3">&nbsp;</td>
                    </tr>
                </table>
             </center>
        </div>
    </form>
</body>
</html>
