<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TotalPurchasesAndSales.aspx.cs" Inherits="MGO.TotalPurchasesAndSales" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Display Total Purchases and Sales</h1>

    <div class="row">
        <div class="col-sm-6"><h4>Purchase Totals:</h4></div>
        <div class="col-sm-12">
            <asp:GridView ID="grdPTotals" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-striped table-condensed" DataSourceID="SqlPTotals" OnRowDataBound="grdPTotals_RowDataBound" ShowFooter="True">
                <Columns>
                    <asp:BoundField DataField="SKU" HeaderText="SKU" SortExpression="SKU" />
                    <asp:BoundField DataField="Item_Description" HeaderText="Item Description" SortExpression="Item_Description" />
                    <asp:BoundField DataField="Item_Cost" HeaderText="Item Cost" SortExpression="Item_Cost" DataFormatString="{0:c}" />
                    <asp:BoundField DataField="PO_Num" HeaderText="Purchase Order Number" SortExpression="PO_Num" />
                    <asp:BoundField DataField="PI_Qty" HeaderText="Item Quantity" SortExpression="PI_Qty" />
                    <asp:BoundField DataField="Column1" HeaderText="Total Item Purchase" ReadOnly="True" SortExpression="Column1" DataFormatString="{0:c}" />
                </Columns>
            </asp:GridView>

            <asp:SqlDataSource ID="SqlPTotals" runat="server" ConnectionString="<%$ ConnectionStrings:MGOConnectionString %>" SelectCommand="SELECT Item.SKU, Item.Item_Description, Item.Item_Cost, PurchaseItem.PO_Num, PurchaseItem.PI_Qty, (Item.Item_Cost*PurchaseItem.PI_Qty) 
FROM Item INNER JOIN PurchaseItem ON Item.SKU = PurchaseItem.SKU"></asp:SqlDataSource>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-6">
            <br />
            <br />
            <h4>Sales Totals:</h4></div>
        <div class="col-sm-12">
            <asp:GridView ID="grdSTotals" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-striped table-condensed" DataSourceID="SqlSTotals" OnRowDataBound="grdSTotals_RowDataBound" ShowFooter="True">
                <Columns>
                    <asp:BoundField DataField="SKU" HeaderText="SKU" SortExpression="SKU" />
                    <asp:BoundField DataField="Item_Description" HeaderText="Item_Description" SortExpression="Item_Description" />
                    <asp:BoundField DataField="Item_Price" HeaderText="Item_Price" SortExpression="Item_Price" />
                    <asp:BoundField DataField="Sale_Num" HeaderText="Sale_Num" SortExpression="Sale_Num" />
                    <asp:BoundField DataField="SI_Qty_Sold" HeaderText="SI_Qty_Sold" SortExpression="SI_Qty_Sold" />
                    <asp:BoundField DataField="Column1" DataFormatString="{0:c}" HeaderText="Total Item Sales" ReadOnly="True" SortExpression="Column1" />
                </Columns>
            </asp:GridView>

            <asp:SqlDataSource ID="SqlSTotals" runat="server" ConnectionString="<%$ ConnectionStrings:MGOConnectionString %>" SelectCommand="SELECT Item.SKU, Item.Item_Description, Item.Item_Price, SaleItem.Sale_Num, SaleItem.SI_Qty_Sold, (Item.Item_Price*SaleItem.SI_Qty_Sold) 
FROM Item INNER JOIN SaleItem ON Item.SKU = SaleItem.SKU"></asp:SqlDataSource>
        </div>
    </div>
</asp:Content>
