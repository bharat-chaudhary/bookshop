<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderForm.aspx.cs" Inherits="Bookshope.OrderForm" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Order Form</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Order Details</h2>
            <label for="userid">User ID:</label>
            <asp:TextBox ID="txtUserId" runat="server" required></asp:TextBox><br /><br />
            <label for="bookid">Book ID:</label>
            <asp:TextBox ID="txtBookId" runat="server" required></asp:TextBox><br /><br />
            <label for="orderdate">Order Date:</label>
            <asp:TextBox ID="txtOrderDate" runat="server" ReadOnly="true"></asp:TextBox><br /><br />
            <label for="quantity">Quantity:</label>
            <asp:TextBox ID="txtQuantity" runat="server" required></asp:TextBox><br /><br />
            <asp:Button ID="btnSubmit" runat="server" Text="Place Order" OnClick="btnSubmit_Click" />
            <asp:Label ID="lblMessage" runat="server" ForeColor="Green"></asp:Label>
        </div>
    </form>
</body>
</html>
