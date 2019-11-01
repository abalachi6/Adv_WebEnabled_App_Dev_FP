<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductsByCity.aspx.cs" Inherits="MGO.ProductsByCity" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
        <div class="col-sm-2">
            Select a City:
        </div>
            <div class="col-sm-4">
                <asp:DropDownList ID="ddlCities" runat="server" AutoPostBack="True" DataSourceID="SqlCities" DataTextField="Cust_City" DataValueField="Cust_City"></asp:DropDownList>
                <asp:SqlDataSource ID="SqlCities" runat="server" ConnectionString="<%$ ConnectionStrings:MGOConnectionString %>" SelectCommand="SELECT DISTINCT [Cust_City] FROM [Customer] ORDER BY [Cust_City]"></asp:SqlDataSource>
            
        </div>
        <div class="row">
            <div class="col-sm-12">

                <asp:GridView ID="grdProductsbyCity" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-striped table-condensed" DataSourceID="SqlProductsbyCity">
                    <Columns>
                        <asp:BoundField DataField="SKU" HeaderText="SKU" SortExpression="SKU" />
                        <asp:BoundField DataField="Item_Description" HeaderText="Item Description" SortExpression="Item_Description" />
                        <asp:BoundField DataField="Cat_Description" HeaderText="Cat Description" SortExpression="Cat_Description" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlProductsbyCity" runat="server" ConnectionString="<%$ ConnectionStrings:MGOConnectionString %>" SelectCommand="SELECT SaleItem.SKU, Item.Item_Description, Category.Cat_Description FROM Customer INNER JOIN Sale ON Customer.Cust_ID = Sale.Cust_ID INNER JOIN SaleItem ON Sale.Sale_Num = SaleItem.Sale_Num INNER JOIN Item ON SaleItem.SKU = Item.SKU INNER JOIN Category ON Item.Cat_Num = Category.Cat_Num WHERE (Customer.Cust_City = @CustCities)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlCities" Name="CustCities" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>

        </div>
    </div>
</asp:Content>
