<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminOrderManage.aspx.cs" Inherits="Bookshope.WebForm6" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Add Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-OERcA2Fj5xQbLqkGFmrRxPOlgY60pM5Ch5o2kltDYFq3zIeR+F6GxkhWuXVoBl8A" crossorigin="anonymous">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container my-4">
        <h1 class="text-primary mb-4">Admin Order Management</h1>
        <div class="mb-3">
            <label for="txtqunt" class="form-label">Quantity:</label>
            <asp:TextBox ID="txtqunt" runat="server" CssClass="form-control" />
        </div>
        <asp:Button ID="Button1" runat="server" Text="Update" CssClass="btn btn-primary mb-4" OnClick="Button1_Click" />

        <asp:GridView 
            ID="GridView1" 
            runat="server" 
            AllowPaging="True" 
            AllowSorting="True" 
            AutoGenerateColumns="False" 
            DataKeyNames="O_id" 
            DataSourceID="SqlDataSource1" 
            OnSelectedIndexChanged="GridView1_SelectedIndexChanged" 
            CssClass="table table-striped table-bordered">
            <Columns>
                <asp:BoundField DataField="O_id" HeaderText="O_id" ReadOnly="True" SortExpression="O_id" Visible="false" />
                <asp:BoundField DataField="U_id" HeaderText="U_id" SortExpression="U_id" Visible="false"/>
                <asp:BoundField DataField="B_id" HeaderText="B_id" SortExpression="B_id"  Visible="false"/>
                

                <asp:BoundField DataField="B_name" HeaderText="Book Name" SortExpression="B_name" />
                <asp:BoundField DataField="B_price" HeaderText="Book Price" SortExpression="B_price" />
                <asp:BoundField DataField="O_quantity" HeaderText="Order Quantity" SortExpression="O_quantity" />
                <asp:BoundField DataField="O_price" HeaderText="Order Price" SortExpression="O_price" />
                <asp:BoundField DataField="O_date" HeaderText="Date" SortExpression="O_date" />
                
                
                
                
                <asp:CommandField ShowDeleteButton="True" ShowSelectButton="True" ControlStyle-CssClass="btn btn-info" ButtonType="Button" >
<ControlStyle CssClass="btn btn-info"></ControlStyle>
                </asp:CommandField>
            </Columns>  
        </asp:GridView>
          <div class="text-center mt-3">
        <button type="button" class="btn btn-secondary" onclick="window.location.href='AdminAddProduct.aspx';">Back</button>
        </div>
        <asp:SqlDataSource 
            ID="SqlDataSource1" 
            runat="server" 
            ConflictDetection="CompareAllValues" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            DeleteCommand="DELETE FROM [OrderDetails] WHERE [O_id] = @O_id" 
            InsertCommand="INSERT INTO [OrderDetails] ([U_id], [B_id], [O_date], [O_quantity], [O_price], [B_name], [B_price]) VALUES (@U_id, @B_id, @O_date, @O_quantity, @O_price, @B_name, @B_price)" 
            SelectCommand="SELECT * FROM [OrderDetails]" 
            UpdateCommand="UPDATE [OrderDetails] SET [U_id] = @U_id, [B_id] = @B_id WHERE [O_id] = @O_id">
        </asp:SqlDataSource>
    </div>

    <!-- Add Bootstrap JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+E3Gx02iPYxPjIqVQTw/P9pSL9r+" crossorigin="anonymous"></script>
</asp:Content>
