<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Bookshope.Login" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page with Dropdown</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            height: 100vh;
            background-image: url('images/bbbbbb.jpg'); 
            background-size: cover;
            background-position: center; 
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: Arial, sans-serif; 
        }

        .body1 {
            background-color: rgba(255, 255, 255, 0.9); 
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            width: 300px; 
        }

        h2 {
            text-align: center; 
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 15px; 

        label {
            margin-bottom: 5px; 
            display: block; 
        }

        .form-control {
            width: 100%;
            padding: 10px; 
            border: 1px solid black; 
            border-radius: 4px;
        }

        .btn {
            width: 100%; 
            padding: 10px;
            background-color: #28a745; 
            color: black; 
            border: none; 
            border-radius: 4px; 
            cursor: pointer; 
        }

        .btn:hover {
            background-color: #218838; 
        }

        .text-danger {
            color: #ff3300; 
        }

        .forgot-password {
            text-align: center;
            margin-top: 10px;
        }

        .forgot-password a {
            color: #007bff;
            text-decoration: none;
        }

        .forgot-password a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="body1">
            <h2>Login</h2>
            <div class="form">
                <div class="form-group">
                    <label for="username">Username:</label>
                    <asp:TextBox class="form-control" ID="txtname" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter User Name" ControlToValidate="txtname" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label for="password">Password:</label>
                    <asp:TextBox class="form-control" ID="txtpass" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Enter Password" ControlToValidate="txtpass" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control">
                        <asp:ListItem Value="User">User</asp:ListItem>
                        <asp:ListItem Value="Admin">Admin</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="form-group">
                    <asp:Button ID="Button1" class="btn" runat="server" Text="LOGIN" OnClick="Button1_Click" />
                </div>
               
            </div>
        </div>
    </form>
</body>
</html>
