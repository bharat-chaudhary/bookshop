<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AuditTable.aspx.cs" Inherits="Bookshope.AuditTable" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Audit Table</title>
    <!-- Add Bootstrap CSS link -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-5">
            <!-- Add a row to center the table -->
            <div class="row justify-content-center">
                <div class="col-md-8">
                    <h2 class="text-center mb-4">Audit Table</h2>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="A_Id" DataSourceID="SqlDataSource2" CellPadding="4" ForeColor="#333333" GridLines="None" CssClass="table table-striped table-bordered">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:BoundField DataField="A_Id" HeaderText="A_Id" InsertVisible="False" ReadOnly="True" SortExpression="A_Id" />
                            <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
                            <asp:BoundField DataField="UserType" HeaderText="UserType" SortExpression="UserType" />
                            <asp:BoundField DataField="LoginTime" HeaderText="LoginTime" SortExpression="LoginTime" />
                            <asp:BoundField DataField="LogoutTime" HeaderText="LogoutTime" SortExpression="LogoutTime" Visible="false" />
                        </Columns>
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                    </asp:GridView>
                    
                    <!-- Back Button with Bootstrap styling -->
                   <!-- Back Button with Bootstrap styling -->
                 <div class="text-center mt-3">
             <button type="button" class="btn btn-secondary" onclick="window.location.href='UserHomePage.aspx';">Back</button>
            </div>

                </div>
            </div>
        </div>

        <!-- Add SqlDataSource2 inside the form -->
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Audit]"></asp:SqlDataSource>
    </form>
    
    <!-- Add Bootstrap JS and Popper.js for some interactive features -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
</body>
</html>
