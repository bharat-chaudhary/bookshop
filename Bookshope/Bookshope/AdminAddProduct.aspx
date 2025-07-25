<%@ Page Title="Add New Book" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminAddProduct.aspx.cs" Inherits="Bookshope.WebForm9" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Form Section -->
    <div class="container mt-5">
        <div class="card shadow-lg p-4">
            <h2 class="text-center mb-4">Add New Book</h2>
            
            <div class="mb-3">
                <label for="B_Titel" class="form-label">Title</label>
                <asp:TextBox ID="B_Titel" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="mb-3">
                <label for="B_Author" class="form-label">Author</label>
                <asp:TextBox ID="B_Author" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="mb-3">
                <label for="Price" class="form-label">Price</label>
                <asp:TextBox ID="Price" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="mb-3">
                <label for="Category" class="form-label">Quantity</label>
                <asp:TextBox ID="Category" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="mb-3">
                <label for="ImageUpload" class="form-label">Book Image</label>
                <asp:FileUpload ID="ImageUpload" runat="server" CssClass="form-control" />
            </div>

            <div class="text-center">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-primary w-100" OnClick="btnSubmit_Click" />
            </div>

            <div class="text-center mt-3">
                <asp:Label ID="lblMessage" runat="server" CssClass="text-danger"></asp:Label>
            </div>
        </div>
    </div>

  
    <div class="container mt-5">
        <div class="card shadow-lg p-4">
            <h2 class="text-center mb-4">Book List</h2>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-hover">
                <Columns>
                    <asp:BoundField DataField="B_id" HeaderText="ID" Visible="false" />
                    <asp:BoundField DataField="B_name" HeaderText="Title" />
                    <asp:BoundField DataField="B_author" HeaderText="Author" />
                    <asp:BoundField DataField="B_price" HeaderText="Price" />
                    <asp:BoundField DataField="B_quantity" HeaderText="Quantity" />
                    <asp:TemplateField HeaderText="Image">
                        <ItemTemplate>
                            <img src='<%# ResolveUrl(Eval("B_img").ToString()) %>' alt='<%# Eval("B_name") %> Image' class="img-fluid rounded" style="max-width: 100px;" />
                        </ItemTemplate>
                    </asp:TemplateField>
                   <%--  --%>
                </Columns>
            </asp:GridView>
                   <!-- Back Button with Bootstrap styling -->
       <div class="text-center mt-3">
       <button type="button" class="btn btn-secondary" onclick="window.location.href='AdminHome.aspx';">Back</button>
      </div>
       </div>

    </div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                SelectCommand="SELECT * FROM [Books]">
            </asp:SqlDataSource>
      
</asp:Content>
