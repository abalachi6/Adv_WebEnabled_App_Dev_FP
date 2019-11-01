<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ItemsByAmount.aspx.cs" Inherits="MGO.ItemsByAmount" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-sm-offset-0 col-sm-2">Enter Dollar Amount:</div>
        <div class="col-sm-4">
            <asp:TextBox ID="txtItemAmount" runat="server"></asp:TextBox>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-offset-0 col-sm-6">*Items costing more than the specified amount will be returned.</div>
    </div>
    <div class="row">
        <div class="col-sm-12">
            <asp:GridView ID="grdItemAmount" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-striped table-condensed" DataKeyNames="SKU" DataSourceID="SqlgrdItemAmount">
                <Columns>
                    <asp:BoundField DataField="SKU" HeaderText="SKU" ReadOnly="True" SortExpression="SKU" />
                    <asp:BoundField DataField="Item_Description" HeaderText="Item Description" SortExpression="Item_Description" />
                    <asp:BoundField DataField="Item_Cost" HeaderText="Item Cost" SortExpression="Item_Cost" DataFormatString="{0:c}" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlgrdItemAmount" runat="server" ConnectionString="<%$ ConnectionStrings:MGOConnectionString %>" SelectCommand="SELECT SKU, Item_Description, Item_Cost FROM Item WHERE (Item_Cost &gt;= @ItemCost)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtItemAmount" Name="ItemCost" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>
