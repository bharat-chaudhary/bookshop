<%@ Page Title="User Order" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="UserOrder.aspx.cs" Inherits="Bookshope.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5">
        <h1>User Order</h1>
        
        <div class="form-group">
          <label for="txtuserid"></label>
            <asp:TextBox ID="txtuserid" runat="server" Visible="false" CssClass="form-control" ReadOnly="true"></asp:TextBox>
        </div>
        
        <div class="form-group">
            <label for="txtbookid"></label>
            <asp:TextBox ID="txtbookid" runat="server" Visible="false" CssClass="form-control"></asp:TextBox>
        </div>
        
        <div class="form-group">
            <label for="txtname">Name:</label>
            <asp:TextBox ID="txtname" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        
        <div class="form-group">
            <label for="txtprice">Price:</label>
            <asp:TextBox ID="txtprice" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        
        <div class="form-group">
            <label for="txtquntity">Quantity:</label>
            <asp:TextBox ID="txtquntity" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        
        <asp:TextBox ID="TextBox5" runat="server" Visible="false"></asp:TextBox>
        
        <div class="text-center">
            <asp:Button ID="Button1" runat="server" Text="Order" CssClass="btn btn-primary mt-3" OnClick="Button1_Click" />
        </div>
        
        <asp:Label ID="lblMessage" runat="server" CssClass="text-danger mt-3"></asp:Label>
        
        <hr />
        
        <h2>Available Books</h2>
       <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="B_id" DataSourceID="SqlDataSource2" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CssClass="table table-striped mt-3">
    <Columns>
        <asp:BoundField DataField="B_id" HeaderText="B_id" SortExpression="B_id" Visible="false"/>
        <asp:BoundField DataField="B_name" HeaderText="Book Name" SortExpression="B_name" />
        <asp:BoundField DataField="B_price" HeaderText="Book Price" SortExpression="B_price" />
        <asp:BoundField DataField="B_author" HeaderText="Author" SortExpression="B_author" />
        <asp:TemplateField HeaderText="Image">
               <ItemTemplate>
        <img src='<%# ResolveUrl(Eval("B_img").ToString()) %>' alt='<%# Eval("B_name") %> Image' class="img-fluid rounded" style="max-width: 100px;" />
    </ItemTemplate>
</asp:TemplateField>
        <asp:CommandField ShowSelectButton="True" ButtonType="Button"  ControlStyle-CssClass="btn btn-info" />
    </Columns>
</asp:GridView>

      <div class="text-center mt-3">
   <button type="button" class="btn btn-secondary" onclick="window.location.href='UserHomePage.aspx';">Back</button>
   </div>
        
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            DeleteCommand="DELETE FROM [Books] WHERE [B_id] = @B_id" 
            InsertCommand="INSERT INTO [Books] ([B_name], [B_price], [B_author], [B_img]) VALUES (@B_name, @B_price, @B_author, @B_img)" 
            SelectCommand="SELECT [B_id], [B_name], [B_price], [B_author], [B_img] FROM [Books]" 
            UpdateCommand="UPDATE [Books] SET [B_name] = @B_name, [B_price] = @B_price, [B_author] = @B_author, [B_img] = @B_img WHERE [B_id] = @B_id">
            <DeleteParameters>
                <asp:Parameter Name="B_id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="B_name" Type="String" />
                <asp:Parameter Name="B_price" Type="Decimal" />
                <asp:Parameter Name="B_author" Type="String" />
                <asp:Parameter Name="B_img" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="B_name" Type="String" />
                <asp:Parameter Name="B_price" Type="Decimal" />
                <asp:Parameter Name="B_author" Type="String" />
                <asp:Parameter Name="B_img" Type="String" />
                <asp:Parameter Name="B_id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
