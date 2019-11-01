<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SalesByCategory.aspx.cs" Inherits="MGO.SalesByCategory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
        <div class="col-sm-6">
            &nbsp;
            <asp:Label ID="lblCategories" runat="server" Text="Select a Category: "></asp:Label>
            <asp:DropDownList ID="ddlCategories" AppendDataBoundItems="true" runat="server" DataSourceID="SqlCategoriesDdl" DataTextField="Cat_Description" DataValueField="Cat_Description" AutoPostBack="True">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlCategoriesDdl" runat="server" ConnectionString="<%$ ConnectionStrings:MGOConnectionString %>" SelectCommand="SELECT DISTINCT [Cat_Description] FROM [Category]"></asp:SqlDataSource>
            <br />
&nbsp;</div>
    </div>
    
    <div class="row">
        <div class="col-sm-12">
            <asp:GridView ID="grdSalesByCat" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-striped table-condensed" DataSourceID="SqlSalesByCat" OnRowDataBound="grdSalesByCat_RowDataBound" ShowFooter="True">
                <Columns>
                    <asp:BoundField DataField="Cat_Num" HeaderText="Category Number" SortExpression="Cat_Num" />
                    <asp:BoundField DataField="Cat_Description" HeaderText="Category Description" SortExpression="Cat_Description" />
                    <asp:BoundField DataField="SKU" HeaderText="SKU" SortExpression="SKU" />
                    <asp:BoundField DataField="Item_Description" HeaderText="Item Description" SortExpression="Item_Description" />
                    <asp:BoundField DataField="Item_Price" HeaderText="Item Price" SortExpression="Item_Price" DataFormatString="{0:c}" />
                    <asp:BoundField DataField="Sale_Num" HeaderText="Sale Number" SortExpression="Sale_Num" />
                    <asp:BoundField DataField="SI_Qty_Sold" HeaderText="Quantity Sold" SortExpression="SI_Qty_Sold" />
                    <asp:BoundField DataField="Column1" HeaderText="Sales Total" ReadOnly="True" SortExpression="Column1" DataFormatString="{0:c}" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlSalesByCat" runat="server" ConnectionString="<%$ ConnectionStrings:MGOConnectionString %>" SelectCommand="SELECT Category.Cat_Num, Category.Cat_Description, Item.SKU, Item.Item_Description, Item.Item_Price, SaleItem.Sale_Num, SaleItem.SI_Qty_Sold, Item.Item_Price * SaleItem.SI_Qty_Sold AS Expr1, ( Item.Item_Price*SaleItem.SI_Qty_Sold)
FROM Category INNER JOIN Item ON Category.Cat_Num = Item.Cat_Num INNER JOIN SaleItem ON Item.SKU = SaleItem.SKU WHERE (Category.Cat_Description = @CatDesc)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlCategories" DefaultValue="" Name="CatDesc" PropertyName="SelectedValue" />
                </SelectParameters>
                
            </asp:SqlDataSource>


        </div>
    </div>

</asp:Content>
