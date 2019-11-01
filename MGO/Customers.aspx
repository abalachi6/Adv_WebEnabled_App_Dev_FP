<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Customers.aspx.cs" Inherits="MGO.Customers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
        <div class="col-cm-12">
            <asp:GridView ID="grdCustList" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-striped table-condensed" DataKeyNames="Cust_ID" DataSourceID="SqlCustList">
                <Columns>
                    <asp:BoundField DataField="Cust_ID" HeaderText="Customer ID" ReadOnly="True" SortExpression="Cust_ID" />
                    <asp:BoundField DataField="Cust_FName" HeaderText="First Name" SortExpression="Cust_FName" />
                    <asp:BoundField DataField="Cust_LName" HeaderText="Last Name" SortExpression="Cust_LName" />
                    <asp:BoundField DataField="Cust_Street1" HeaderText="Address line 1" SortExpression="Cust_Street1" />
                    <asp:BoundField DataField="Cust_Street2" HeaderText="Address Line 2" SortExpression="Cust_Street2" />
                    <asp:BoundField DataField="Cust_City" HeaderText="City" SortExpression="Cust_City" />
                    <asp:BoundField DataField="Cust_State" HeaderText="State" SortExpression="Cust_State" />
                    <asp:BoundField DataField="Cust_ZIP" HeaderText="ZIP" SortExpression="Cust_ZIP" />
                    <asp:BoundField DataField="Cust_EMail" HeaderText="EMail" SortExpression="Cust_EMail" />
                    <asp:CommandField ShowEditButton="True" />
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" OnClientClick="return confirm('Are you sure you want to delete this customer?');" Text="Delete"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlCustList" runat="server" ConnectionString="<%$ ConnectionStrings:MGOConnectionString %>" DeleteCommand="DELETE FROM [Customer] WHERE [Cust_ID] = @Cust_ID" InsertCommand="INSERT INTO [Customer] ([Cust_ID], [Cust_FName], [Cust_LName], [Cust_Street1], [Cust_Street2], [Cust_City], [Cust_State], [Cust_ZIP], [Cust_EMail]) VALUES (@Cust_ID, @Cust_FName, @Cust_LName, @Cust_Street1, @Cust_Street2, @Cust_City, @Cust_State, @Cust_ZIP, @Cust_EMail)" SelectCommand="SELECT * FROM [Customer]" UpdateCommand="UPDATE [Customer] SET [Cust_FName] = @Cust_FName, [Cust_LName] = @Cust_LName, [Cust_Street1] = @Cust_Street1, [Cust_Street2] = @Cust_Street2, [Cust_City] = @Cust_City, [Cust_State] = @Cust_State, [Cust_ZIP] = @Cust_ZIP, [Cust_EMail] = @Cust_EMail WHERE [Cust_ID] = @Cust_ID">
                <DeleteParameters>
                    <asp:Parameter Name="Cust_ID" Type="Int16" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Cust_ID" Type="Int16" />
                    <asp:Parameter Name="Cust_FName" Type="String" />
                    <asp:Parameter Name="Cust_LName" Type="String" />
                    <asp:Parameter Name="Cust_Street1" Type="String" />
                    <asp:Parameter Name="Cust_Street2" Type="String" />
                    <asp:Parameter Name="Cust_City" Type="String" />
                    <asp:Parameter Name="Cust_State" Type="String" />
                    <asp:Parameter Name="Cust_ZIP" Type="String" />
                    <asp:Parameter Name="Cust_EMail" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Cust_FName" Type="String" />
                    <asp:Parameter Name="Cust_LName" Type="String" />
                    <asp:Parameter Name="Cust_Street1" Type="String" />
                    <asp:Parameter Name="Cust_Street2" Type="String" />
                    <asp:Parameter Name="Cust_City" Type="String" />
                    <asp:Parameter Name="Cust_State" Type="String" />
                    <asp:Parameter Name="Cust_ZIP" Type="String" />
                    <asp:Parameter Name="Cust_EMail" Type="String" />
                    <asp:Parameter Name="Cust_ID" Type="Int16" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>

    </div>
</asp:Content>
