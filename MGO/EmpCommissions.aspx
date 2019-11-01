<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EmpCommissions.aspx.cs" Inherits="MGO.EmpCommissions" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
        <div class="col-sm-12 table-responsive">
            <asp:GridView ID="grdCommisions" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-striped table-condensed" DataSourceID="SqlEmpCommisions">
                <Columns>
                    <asp:BoundField DataField="Column1" HeaderText="Employee" ReadOnly="True" SortExpression="Column1" />
                    <asp:BoundField DataField="Emp_Commission" DataFormatString="{0:c}" HeaderText="Commission" SortExpression="Emp_Commission" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlEmpCommisions" runat="server" ConnectionString="<%$ ConnectionStrings:MGOConnectionString %>" SelectCommand="SELECT [Emp_FName] +' ' + [Emp_LName], [Emp_Commission] FROM [Employee]"></asp:SqlDataSource>
        </div>

    </div>
</asp:Content>
