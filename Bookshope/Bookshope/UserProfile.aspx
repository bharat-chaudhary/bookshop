<%@ Page Title="User Profile" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="UserProfile.aspx.cs" Inherits="Bookshope.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-OERcA2Fj5xQbLqkGFmrRxPOlgY60pM5Ch5o2kltDYFq3zIeR+F6GxkhWuXVoBl8A" crossorigin="anonymous">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .btn-custom {
            background-color: #007bff; /* Custom button color */
            color: white;
            border: none;
            transition: background-color 0.3s, transform 0.3s; 
        }

        .btn-custom:hover {
            background-color: #0056b3; /* Darker shade on hover */
            transform: translateY(-2px); /* Slight lift effect */
        }
    </style>

    <div class="container my-4">
        <!-- Profile Header -->
        <div class="row mb-4">
            <div class="col-md-12">
                <h2 class="display-4 text-center">Your Profile</h2>
            </div>
        </div>

        <!-- Profile Card -->
        <div class="card">
            <div class="card-header bg-info text-white">
                <h4 class="mb-0">Profile Information</h4>
            </div>
            <div class="card-body">
                <asp:TextBox ID="txtid" class="form-control" runat="server" Visible="False"></asp:TextBox>

                <!-- Name Field -->
                <div class="mb-3">
                    <label for="txtname" class="form-label"><b>Name:</b></label>
                    <asp:TextBox ID="txtname" class="form-control" runat="server" Font-Size="19px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ErrorMessage="Please Enter Your Name" ControlToValidate="txtname" 
                        Display="Dynamic" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                </div>

                <!-- Password Field -->
                <div class="mb-3">
                    <label for="txtpass" class="form-label"><b>Password:</b></label>
                    <asp:TextBox ID="txtpass" class="form-control" runat="server" Font-Size="19px" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ErrorMessage="Please Enter Your Password" ControlToValidate="txtpass" 
                        Display="Dynamic" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                </div>

                <!-- Mobile Number Field -->
                <div class="mb-3">
                    <label for="txtmonu" class="form-label"><b>Mobile Number:</b></label>
                    <asp:TextBox ID="txtmonu" class="form-control" runat="server" Font-Size="19px" TextMode="Phone"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                        ErrorMessage="Please Enter Your Mobile Number" ControlToValidate="txtmonu" 
                        Display="Dynamic" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                </div>

                <!-- Address Field -->
                <div class="mb-3">
                    <label for="txtaddre" class="form-label"><b>Address:</b></label>
                    <asp:TextBox ID="txtaddre" class="form-control" runat="server" Font-Size="19px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ErrorMessage="Please Enter Your Address" ControlToValidate="txtaddre" 
                        Display="Dynamic" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                </div>

                <!-- Update Button -->
                <div class="mb-3">
                    <asp:Button ID="Button1" runat="server" Text="Update" OnClick="Button1_Click" 
                        class="btn btn-info btn-custom" />
                </div>
            </div>
        </div>

        <!-- Optional GridView for User Data (if needed) -->
        <div class="mt-4">
            <asp:GridView ID="GridView1" runat="server" class="table table-bordered table-striped"></asp:GridView>
        </div>
    </div>
      <div class="text-center mt-3">
    <button type="button" class="btn btn-secondary" onclick="window.location.href='UserHomePage.aspx';">Back</button>
   </div>
    <!-- Bootstrap JS and Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" 
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+E3Gx02iPYxPjIqVQTw/P9pSL9r+" 
        crossorigin="anonymous"></script>
</asp:Content>
