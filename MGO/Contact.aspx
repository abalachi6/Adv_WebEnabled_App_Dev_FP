<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="MGO.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
        <div class="col-sm-offset-1 col-sm-11">
            <h3>How to contact us</h3>
        </div>
    </div>

    <%--Row 1 Welcome Information--%>
    <div class="row">
        <div class="col-sm-offset-1 col-sm-11">
            <p>
                If you ever have any questions or comments,
                <br />
                please be sure to contact us in whatever way is most convenient for you.
            </p>
        </div>
    </div>

    <%--Row 2 Phone--%>
    <div class="row">
        <div class="col-sm-offset-1 col-sm-2">Phone:</div>
        <div class="col-sm-9">
            1-800-555-0400
            <br />
            M-F, 8 to 5 Central Time
        </div>
    </div>
    <%--End of the Phone row--%>

    <%--Row 3 Email--%>
    <div class="row">
        <div class="col-sm-offset-1 col-sm-2">Email:</div>
        <div class="col-sm-9">
            <a href="mailto:someemail@email.com">someemail@email.com</a>
        </div>
    </div>
    <%--End of the Email row--%>

    <%--Row 4 Fax--%>
    <div class="row">
        <div class="col-sm-offset-1 col-sm-2">Fax:</div>
        <div class="col-sm-9">
            1-559-555-2732
        </div>
    </div>
    <%--End of the Fax row--%>

    <%--Row 5 Address--%>
    <div class="row">
        <div class="col-sm-offset-1 col-sm-2">Address:</div>
        <div class="col-sm-9">
            Mountain Goat Outfitters
            <br />
            1234 Main Street
            <br />
            Gatlinburg, Tennessee 11112
        </div>
    </div>
    <%--End of the Address row--%>
</asp:Content>
