<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ModifyEmployees.aspx.cs" Inherits="MGO.ModifyEmployees" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-sm-12">
            <asp:GridView ID="grdEmployees" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-striped table-condensed" DataKeyNames="Emp_ID" DataSourceID="SqlEmployees" OnRowDeleted="grdEmployees_RowDeleted" OnRowUpdated="grdEmployees_RowUpdated">
                <Columns>
                    <asp:BoundField DataField="Emp_ID" HeaderText="Employee ID" ReadOnly="True" SortExpression="Emp_ID" />
                    <asp:BoundField DataField="Emp_FName" HeaderText="First Name" SortExpression="Emp_FName" />
                    <asp:BoundField DataField="Emp_LName" HeaderText="Last Name" SortExpression="Emp_LName" />
                    <asp:BoundField DataField="Emp_Position" HeaderText="Position" SortExpression="Emp_Position" />
                    <asp:BoundField DataField="Emp_Commission" HeaderText="Commission" SortExpression="Emp_Commission" DataFormatString="{0:c}" />
                    <asp:CommandField ShowEditButton="True" />
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" OnClientClick="return confirm('Are you sure you want to delete this employee?');" Text="Delete"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>


            <asp:SqlDataSource ID="SqlEmployees" runat="server" ConnectionString="<%$ ConnectionStrings:MGOConnectionString %>" SelectCommand="SELECT * FROM [Employee]" DeleteCommand="DELETE FROM [Employee] WHERE [Emp_ID] = @Emp_ID" InsertCommand="INSERT INTO [Employee] ([Emp_ID], [Emp_FName], [Emp_LName], [Emp_Position], [Emp_Commission]) VALUES (@Emp_ID, @Emp_FName, @Emp_LName, @Emp_Position, @Emp_Commission)" UpdateCommand="UPDATE [Employee] SET [Emp_FName] = @Emp_FName, [Emp_LName] = @Emp_LName, [Emp_Position] = @Emp_Position, [Emp_Commission] = @Emp_Commission WHERE [Emp_ID] = @Emp_ID">
                <DeleteParameters>
                    <asp:Parameter Name="Emp_ID" Type="Int16" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Emp_ID" Type="Int16" />
                    <asp:Parameter Name="Emp_FName" Type="String" />
                    <asp:Parameter Name="Emp_LName" Type="String" />
                    <asp:Parameter Name="Emp_Position" Type="String" />
                    <asp:Parameter Name="Emp_Commission" Type="Single" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Emp_FName" Type="String" />
                    <asp:Parameter Name="Emp_LName" Type="String" />
                    <asp:Parameter Name="Emp_Position" Type="String" />
                    <asp:Parameter Name="Emp_Commission" Type="Single" />
                    <asp:Parameter Name="Emp_ID" Type="Int16" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>

    </div>

    <%-- Validation Summary --%>
    <div calss="row">
        <div class="col-sm-12">
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="text-danger" HeaderText="Please correct the following errors:" ValidationGroup="edit" />
            <asp:Label ID="lblErrorMessage" CssClass="text-danger" EnableViewState="false" runat="server" ></asp:Label>
        </div>
    </div>

    <%--Add an Employee Form --%>
    <div class="row">
        <div class="col-sm-12">
            <p>To add a new employee, enter the employee information and click Add</p>
        </div>
    </div>

    <%-- EmpID text box --%>
    <div class="form-group">
        <div class="col-sm-2">Employee ID:</div>
        <div class="col-sm-3">
            <asp:TextBox ID="txtEmployeeID" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-sm-7">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="txtEmployeeID" ErrorMessage="Employee ID is a required field." 
                Display="Dynamic" CssClass="text-danger" ValidationGroup="Add">
            </asp:RequiredFieldValidator>
        </div>
    </div>

    <%-- First Name text box --%>
    <div class="form-group">
        <div class="col-sm-2">First Name:</div>
        <div class="col-sm-3">
            <asp:TextBox ID="txtFName" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-sm-7">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                ControlToValidate="txtFName" ErrorMessage="First Name is a required field." 
                CssClass="text-danger" Display="Dynamic" ValidationGroup="Add">
            </asp:RequiredFieldValidator>
        </div>
    </div>

    <%--Lat Name text box--%>
    <div class="form-group">
        <div class="col-sm-2">Last Name:</div>
        <div class="col-sm-3">
            <asp:TextBox ID="txtLName" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-sm-7">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                ControlToValidate="txtLName" ErrorMessage="Last Name is a required field." 
                Display="Dynamic" CssClass="text-danger" ValidationGroup="Add">
            </asp:RequiredFieldValidator>            
        </div>
    </div>

    <%-- Position text box --%>
    <div class="form-group">
        <div class="col-sm-2">Position:</div>
        <div class="col-sm-3">
            <asp:DropDownList ID="ddlPosition" runat="server" DataSourceID="SqlPositions" DataTextField="Emp_Position" DataValueField="Emp_Position"></asp:DropDownList>
            <asp:SqlDataSource ID="SqlPositions" runat="server" ConnectionString="<%$ ConnectionStrings:MGOConnectionString %>" SelectCommand="SELECT DISTINCT [Emp_Position] FROM [Employee]"></asp:SqlDataSource>
        </div>
    </div>

    <%-- Commission text box --%>
    <div class="form-group">
        <div class="col-sm-2">Commission:</div>
        <div class="col-sm-3">
            <asp:TextBox ID="txtCommission" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-sm-7">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="txtCommission" ErrorMessage="Commission is a required field." 
                Display="Dynamic" CssClass="text-danger" ValidationGroup="Add">
            </asp:RequiredFieldValidator>   
            <asp:CompareValidator ID="CompareValidator3" runat="server" 
                ControlToValidate="txtCommission" ErrorMessage="Commission must be a valid currency value." 
                Display="Dynamic" CssClass="text-danger" 
                Operator="DataTypeCheck" Type="Double" ValidationGroup="Add">
            </asp:CompareValidator>
        </div>
    </div>

    <%-- Add button --%>
    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <asp:Button ID="btnAdd" runat="server" Text="Add Employee" ValidationGroup="Add" 
                CssClass="btn btn-primary" OnClick="btnAdd_Click"  />
        </div>
    </div>
</div>
</asp:Content>
