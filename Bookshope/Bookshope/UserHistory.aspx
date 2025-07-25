<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="UserHistory.aspx.cs" Inherits="Bookshope.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
    <link href="Css/UserHistory.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5">
        <h1 class="mb-4">Book History</h1>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CssClass="table table-striped">
            <Columns>
                <asp:BoundField DataField="B_name" HeaderText="Book Name" SortExpression="B_name" />
                <asp:BoundField DataField="O_price" HeaderText="Price" SortExpression="O_price" />
                <asp:BoundField DataField="O_quantity" HeaderText="Quantity" SortExpression="O_quantity" />
                <asp:BoundField DataField="O_date" HeaderText="Date" SortExpression="O_date" />
            </Columns>
        </asp:GridView>
           <div class="text-center mt-3">
        <button type="button" class="btn btn-secondary" onclick="window.location.href='UserHomePage.aspx';">Back</button>
       </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT [B_name], [O_price], [O_quantity], [O_date] FROM [OrderDetails] WHERE ([U_id] = @U_id)">
            <SelectParameters>
                <asp:SessionParameter Name="U_id" SessionField="UserId" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
