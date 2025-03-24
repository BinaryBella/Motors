<%@ Page Title="Retail Customers" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="Silva_Motors.Pages.MasterFiles.RetailCustomer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

    <link rel="stylesheet" href='<%= ResolveUrl("~/Content/CustomCSS/MasterFiles/StockItemsCSS.css") %>' />
    <div class="container-fluid main">
        <div class="header">STOCK ITEMS</div>

        <div class="d-flex justify-content-between mb-3">
            <asp:Button ID="btnFilters" runat="server" Text="Filters" CssClass="filters-button" />
            <asp:Button ID="btnAdd" runat="server" Text=" ADD" CssClass="add-button" />
        </div>

        <div class="table-responsive">
            <asp:GridView ID="gvStockItems" runat="server" AutoGenerateColumns="false"
                CssClass="table table-bordered customers-table" Width="100%">
                <Columns>
                    <asp:BoundField DataField="Code" HeaderText="CODE" />
                    <asp:BoundField DataField="PartNumber" HeaderText="PART NUMBER" />
                    <asp:BoundField DataField="Address" HeaderText="ADDRESS" />
                    <asp:BoundField DataField="Telephone" HeaderText="TELEPHONE" />
                    <asp:BoundField DataField="CreditLimit" HeaderText="CREDIT LIMIT" />
                    <asp:BoundField DataField="Outstanding" HeaderText="OUTSTANDING" />
                    <asp:TemplateField HeaderText="ACTIONS">
                        <ItemTemplate>
                            <!-- Action buttons -->
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <HeaderStyle BackColor="Black" ForeColor="White" />
                <RowStyle BackColor="#e0e0e0" />
                <AlternatingRowStyle BackColor="White" />
            </asp:GridView>
        </div>

        <div class="d-flex justify-content-between mt-3">
            <div class="pagination">
                <a href="#">1</a>
                <a href="#" class="active">2</a>
                <a href="#">3</a>
                <a href="#">4</a>
                <a href="#">5</a>
            </div>
        </div>

        <div style="display:flex; justify-content:end;">
            <span class="total-outstanding">TOTAL OUTSTANDING</span>
            <span class="total-value">
                <asp:Literal ID="litTotalOutstanding" runat="server"></asp:Literal>
            </span>
        </div>
    </div>

    <div class="checkbox-container">
        <asp:CheckBox ID="chkShowDebtor" runat="server" Text="Show Debtor" CssClass="checkbox-label" />
        <asp:CheckBox ID="chkShowCreditor" runat="server" Text="Show Creditor" CssClass="checkbox-label" />
    </div>
    </div>

    <%-- Modal Markup --%>
    <div class="modal fade" id="customerModal" tabindex="-1" role="dialog" aria-labelledby="customerModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="customerModalLabel">Add Customer</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <%-- Removed the form tag here --%>
                    <div class="form-group row">
                        <label for="txtCode" class="col-sm-3 col-form-label">Code</label>
                        <div class="col-sm-9">
                            <asp:TextBox ID="txtCode" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="txtName" class="col-sm-3 col-form-label">Name</label>
                        <div class="col-sm-9">
                            <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="txtAddress" class="col-sm-3 col-form-label">Address</label>
                        <div class="col-sm-9">
                            <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="txtMobile" class="col-sm-3 col-form-label">Mobile No</label>
                        <div class="col-sm-9">
                            <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="txtAltPhone" class="col-sm-3 col-form-label">Alt. Phone</label>
                        <div class="col-sm-9">
                            <asp:TextBox ID="txtAltPhone" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="txtFax" class="col-sm-3 col-form-label">Fax</label>
                        <div class="col-sm-9">
                            <asp:TextBox ID="txtFax" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="txtEmail" class="col-sm-3 col-form-label">E-mail</label>
                        <div class="col-sm-9">
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="txtCompanyContact" class="col-sm-3 col-form-label">If Company Contact Name</label>
                        <div class="col-sm-9">
                            <asp:TextBox ID="txtCompanyContact" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="txtIntroduceBy" class="col-sm-3 col-form-label">Introduce By</label>
                        <div class="col-sm-9">
                            <asp:TextBox ID="txtIntroduceBy" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="ddlType" class="col-sm-3 col-form-label">Type</label>
                        <div class="col-sm-9">
                            <asp:DropDownList ID="ddlType" runat="server" CssClass="form-control">
                                <asp:ListItem Text="Retail Customer" Value="Retail"></asp:ListItem>
                                <asp:ListItem Text="Wholesale Customer" Value="Wholesale"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="ddlMode" class="col-sm-3 col-form-label">Mode</label>
                        <div class="col-sm-9">
                            <asp:DropDownList ID="ddlMode" runat="server" CssClass="form-control">
                                <asp:ListItem Text="Commercial" Value="Commercial"></asp:ListItem>
                                <asp:ListItem Text="Residential" Value="Residential"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="txtCreditLimit" class="col-sm-3 col-form-label">Credit Limit</label>
                        <div class="col-sm-9">
                            <asp:TextBox ID="txtCreditLimit" runat="server" CssClass="form-control" TextMode="Number" step="0.01"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="ddlCreditPeriod" class="col-sm-3 col-form-label">Credit Period</label>
                        <div class="col-sm-9">
                            <asp:DropDownList ID="ddlCreditPeriod" runat="server" CssClass="form-control">
                                <asp:ListItem Text="30 days" Value="30"></asp:ListItem>
                                <asp:ListItem Text="60 days" Value="60"></asp:ListItem>
                                <asp:ListItem Text="90 days" Value="90"></asp:ListItem>
                                <asp:ListItem Text="120 days" Value="120"></asp:ListItem>
                                <asp:ListItem Text="150 days" Value="150"></asp:ListItem>
                                <asp:ListItem Text="180 days" Value="180"></asp:ListItem>
                                <asp:ListItem Text="364 days" Value="364"></asp:ListItem>
                                <asp:ListItem Text="Unlimited" Value="Unlimited"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="txtBalanceDue" class="col-sm-3 col-form-label">Balance Due</label>
                        <div class="col-sm-9">
                            <asp:TextBox ID="txtBalanceDue" runat="server" CssClass="form-control" TextMode="Number" step="0.01"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="txtPDCheques" class="col-sm-3 col-form-label">P/D Cheques</label>
                        <div class="col-sm-9">
                            <asp:TextBox ID="txtPDCheques" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary" Style="background-color: #B71D1D; border-color: #B71D1D;" OnClientClick="return validateForm();" />
                    <button type="button" class="btn" data-dismiss="modal" style="background-color: #D9D9D9;">Cancel</button>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        $(document).ready(function () {
            // Attach click event to the Add button
            $("#<%= btnAdd.ClientID %>").click(function (e) {
            e.preventDefault();
            $("#customerModal").modal("show");
        });

        // Handle save button click
        $("#<%= btnSave.ClientID %>").click(function (e) {
            // Prevent postback for this example - in real application you'll handle server-side validation
            e.preventDefault();

            // Validate form
            if (validateForm()) {
                // Here you would typically make an AJAX call or allow postback to server
                // For demo purposes, we'll just close the modal and show success message
                $("#customerModal").modal("hide");
                alert("Customer data saved successfully!");
            }
        });
    });

        function validateForm() {
            let isValid = true;

            // Basic validation example - add more as needed
            if ($("#<%= txtName.ClientID %>").val() === "") {
            alert("Customer name is required");
            isValid = false;
        }

        if ($("#<%= txtMobile.ClientID %>").val() === "") {
                alert("Mobile number is required");
                isValid = false;
            }

            return isValid;
        }
    </script>
</asp:Content>
