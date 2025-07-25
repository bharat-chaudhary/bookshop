<%@ Page Title="Admin User Management" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminUserManage.aspx.cs" Inherits="Bookshope.WebForm5" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-OERcA2Fj5xQbLqkGFmrRxPOlgY60pM5Ch5o2kltDYFq3zIeR+F6GxkhWuXVoBl8A" crossorigin="anonymous">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid my-4">
        <h1 class="text-primary mb-4">Admin User Management</h1>
        
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" DisplayMode="List" ForeColor="Red" />
    </div>
    
    <div class="table-responsive">
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="U_id" DataSourceID="SqlDataSource1" OnRowUpdating="GridView1_RowUpdating" CssClass="table table-bordered table-striped">
            <Columns>
                <asp:BoundField DataField="U_id" HeaderText="U_id" InsertVisible="False" ReadOnly="True" SortExpression="U_id" Visible="false" />

                <asp:TemplateField HeaderText="User Name" SortExpression="U_name">
                    <EditItemTemplate>
                        <asp:TextBox ID="U_nameTextBox" runat="server" Text='<%# Bind("U_name") %>' CssClass="form-control" />
                        <asp:RequiredFieldValidator 
                            ID="rfvU_name" 
                            runat="server" 
                            ControlToValidate="U_nameTextBox" 
                            InitialValue="" 
                            ErrorMessage="User Name is required." 
                            ForeColor="Red" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="U_nameLabel" runat="server" Text='<%# Bind("U_name") %>' />
                    </ItemTemplate>
                </asp:TemplateField>

               
                <asp:TemplateField HeaderText="Password" Visible="false" SortExpression="U_password">
                    <EditItemTemplate>
                        <asp:TextBox ID="U_passwordTextBox" runat="server" Text='<%# Bind("U_password") %>' CssClass="form-control" TextMode="Password" />
                        <asp:RequiredFieldValidator 
                            ID="rfvU_password" 
                            runat="server" 
                            ControlToValidate="U_passwordTextBox" 
                            InitialValue="" 
                            ErrorMessage="Password is required." 
                            ForeColor="Red" />
                        <asp:RegularExpressionValidator 
                            ID="revU_password" 
                            runat="server" 
                            ControlToValidate="U_passwordTextBox" 
                            ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$" 
                            ErrorMessage="Password must be at least 8 characters long and contain both letters and numbers." 
                            ForeColor="Red" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="U_passwordLabel" runat="server" Text="********" /> <!-- Password is masked in view mode -->
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Contact" SortExpression="U_contact">
                    <EditItemTemplate>
                        <asp:TextBox ID="U_contactTextBox" runat="server" Text='<%# Bind("U_contact") %>' CssClass="form-control" />
                        <asp:RequiredFieldValidator 
                            ID="rfvU_contact" 
                            runat="server" 
                            ControlToValidate="U_contactTextBox" 
                            InitialValue="" 
                            ErrorMessage="Contact is required." 
                            ForeColor="Red" />
                        <asp:RegularExpressionValidator 
                            ID="revU_contact" 
                            runat="server" 
                            ControlToValidate="U_contactTextBox" 
                            ValidationExpression="^\d{10}$" 
                            ErrorMessage="Contact must be a 10-digit number." 
                            ForeColor="Red" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="U_contactLabel" runat="server" Text='<%# Bind("U_contact") %>' />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Address" SortExpression="U_address">
                    <EditItemTemplate>
                        <asp:TextBox ID="U_addressTextBox" runat="server" Text='<%# Bind("U_address") %>' CssClass="form-control" />
                        <asp:RequiredFieldValidator 
                            ID="rfvU_address" 
                            runat="server" 
                            ControlToValidate="U_addressTextBox" 
                            InitialValue="" 
                            ErrorMessage="Address is required." 
                            ForeColor="Red" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="U_addressLabel" runat="server" Text='<%# Bind("U_address") %>' />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Type" SortExpression="U_type">
                    <EditItemTemplate>
                        <asp:TextBox ID="U_typeTextBox" runat="server" Text='<%# Bind("U_type") %>' CssClass="form-control" />
                        <asp:RequiredFieldValidator 
                            ID="rfvU_type" 
                            runat="server" 
                            ControlToValidate="U_typeTextBox" 
                            InitialValue="" 
                            ErrorMessage="Type is required." 
                            ForeColor="Red" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="U_typeLabel" runat="server" Text='<%# Bind("U_type") %>' />
                    </ItemTemplate>
                </asp:TemplateField>

              
                <asp:TemplateField HeaderText="Status" SortExpression="Status">
                    <EditItemTemplate>
                        <asp:DropDownList ID="StatusDropDown" runat="server" CssClass="form-control">
                            <asp:ListItem Value="Active" Text="Active" />
                            <asp:ListItem Value="Inactive" Text="Inactive" />
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator 
                            ID="rfvStatus" 
                            runat="server" 
                            ControlToValidate="StatusDropDown" 
                            InitialValue="" 
                            ErrorMessage="Status is required." 
                            ForeColor="Red" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="StatusLabel" runat="server" Text='<%# Bind("Status") %>' />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ButtonType="Button" ControlStyle-CssClass="btn btn-primary mb-4"/>
            </Columns>
        </asp:GridView>
    </div>
      <div class="text-center mt-3">
  <button type="button" class="btn btn-secondary" onclick="window.location.href='AdminHome.aspx';">Back</button>
 </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConflictDetection="CompareAllValues" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        DeleteCommand="DELETE FROM [Users] WHERE [U_id] = @original_U_id"
        InsertCommand="INSERT INTO [Users] ([U_name], [U_password], [U_contact], [U_address], [U_type], [Status]) VALUES (@U_name, @U_password, @U_contact, @U_address, @U_type, @Status)" 
        OldValuesParameterFormatString="original_{0}" 
        SelectCommand="SELECT * FROM [Users]" 
        UpdateCommand="UPDATE [Users] SET [U_name] = @U_name, [U_password] = @U_password, [U_contact] = @U_contact, [U_address] = @U_address, [U_type] = @U_type, [Status] = @Status WHERE [U_id] = @original_U_id">
        <UpdateParameters>
            <asp:Parameter Name="U_name" Type="String" />
            <asp:Parameter Name="U_password" Type="String" />
            <asp:Parameter Name="U_contact" Type="String" />
            <asp:Parameter Name="U_address" Type="String" />
            <asp:Parameter Name="U_type" Type="String" />
            <asp:Parameter Name="Status" Type="String" />
            <asp:Parameter Name="U_id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:Label ID="ErrorMessageLabel" runat="server" ForeColor="Red" Visible="False"></asp:Label>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+E3Gx02iPYxPjIqVQTw/P9pSL9r+" crossorigin="anonymous"></script>
</asp:Content>
