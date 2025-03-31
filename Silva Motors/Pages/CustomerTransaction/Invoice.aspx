<%@ Page Title="Invoice" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Invoice.aspx.cs" Inherits="Silva_Motors.Pages.CustomerTransaction.Invoice" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href='<%= ResolveUrl("~/Content/CustomCSS/CustomerTransaction/InvoiceCSS.css") %>' />

    <div class="main">
        <div class="container-fluid">
            <div class="row align-items-center">
                <div class="col d-flex justify-content-between align-items-center">
                    <div class="header h4">INVOICE</div>
                    <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#addInvoiceModal">
                        Add
                    </button>
                </div>
            </div>
        </div>

        <div style="background-color: #f1f1f1; margin-bottom: 10px; padding: 10px;">
            <div class="row">
                <div class="col-md-3">
                    <div class="form-group">
                        <label>Invoice To</label>
                        <asp:DropDownList ID="ddlInvoiceTo" CssClass="form-control" runat="server">
                            <asp:ListItem Text="Select Customer" Value="" />
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="row">
                        <div class="col-12 mb-2">
                            <asp:TextBox ID="txtCustomerName" CssClass="form-control" runat="server" Placeholder="Customer Name" />
                        </div>
                        <div class="col-12 mb-2">
                            <asp:TextBox ID="txtAddress" CssClass="form-control" runat="server" Placeholder="Address" />
                        </div>
                        <div class="col-12 mb-2">
                            <asp:TextBox ID="txtContact" CssClass="form-control" runat="server" Placeholder="Contact" />
                        </div>
                        <div class="col-12">
                            <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server" Placeholder="Email" />
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="row">
                        <div class="col-12 mb-2">
                            <asp:TextBox ID="txtTEC1" CssClass="form-control" runat="server" Placeholder="TEC 1" />
                        </div>
                        <div class="col-12 mb-2">
                            <asp:TextBox ID="txtTEC2" CssClass="form-control" runat="server" Placeholder="TEC 2" />
                        </div>
                        <div class="col-12">
                            <asp:TextBox ID="txtTEC3" CssClass="form-control" runat="server" Placeholder="TEC 3" />
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group mb-2">
                        <asp:DropDownList ID="ddlMode" CssClass="form-control" runat="server">
                            <asp:ListItem Text="Select Mode" Value="" />
                            <asp:ListItem Text="Cash" Value="Cash" />
                            <asp:ListItem Text="Credit" Value="Credit" />
                        </asp:DropDownList>
                    </div>
                    <div class="form-group mb-2">
                        <asp:TextBox ID="txtDescription" CssClass="form-control" runat="server" Placeholder="Description" />
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txtDate" CssClass="form-control" runat="server" TextMode="Date" Placeholder="Date" />
                    </div>
                </div>
            </div>

            <div class="row mt-3">
                <div class="col-md-2">
                    <div class="form-group">
                        <label>Total Balance Due</label>
                        <asp:TextBox ID="txtTotalBalanceDue" CssClass="form-control" runat="server" />
                    </div>
                </div>
                <div class="col-md-2">
                    <div class="form-group">
                        <label>Cheque Balance</label>
                        <asp:TextBox ID="txtChequeBalance" CssClass="form-control" runat="server" />
                    </div>
                </div>
                <div class="col-md-2">
                    <div class="form-group">
                        <label>Available Balance</label>
                        <asp:TextBox ID="txtAvailableBalance" CssClass="form-control" runat="server" />
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label>Credit Period</label>
                        <asp:TextBox ID="txtCreditPeriod" CssClass="form-control" runat="server" />
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label>Credit Limit</label>
                        <asp:TextBox ID="txtCreditLimit" CssClass="form-control" runat="server" />
                    </div>
                </div>
            </div>
        </div>

        <div class="row mt-3">
            <div class="col-12">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>CODE</th>
                            <th>ITEM-DESC</th>
                            <th>QTY</th>
                            <th>UNIT PRICE</th>
                            <th>UNIT DISC</th>
                            <th>AMOUNT</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>
                                <input type="text" class="form-control" value="A001" /></td>
                            <td>
                                <input type="text" class="form-control" value="Item 1" /></td>
                            <td>
                                <input type="number" class="form-control" value="2" /></td>
                            <td>
                                <input type="number" class="form-control" step="0.01" value="50.00" /></td>
                            <td>
                                <input type="number" class="form-control" step="0.01" value="5.00" /></td>
                            <td>
                                <input type="text" class="form-control" value="95.00" readonly /></td>
                        </tr>
                        <tr>
                            <td>
                                <input type="text" class="form-control" value="A002" /></td>
                            <td>
                                <input type="text" class="form-control" value="Item 2" /></td>
                            <td>
                                <input type="number" class="form-control" value="1" /></td>
                            <td>
                                <input type="number" class="form-control" step="0.01" value="30.00" /></td>
                            <td>
                                <input type="number" class="form-control" step="0.01" value="3.00" /></td>
                            <td>
                                <input type="text" class="form-control" value="27.00" readonly /></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <%--Table Grid View--%>
        <%--        <div class="row mt-3">
            <div class="col-12">
                <asp:GridView ID="gvInvoiceItems" runat="server" CssClass="table table-bordered"
                    AutoGenerateColumns="false">
                    <Columns>
                        <asp:TemplateField HeaderText="CODE">
                            <ItemTemplate>
                                <asp:TextBox ID="txtCode" runat="server" CssClass="form-control" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ITEM-DESC">
                            <ItemTemplate>
                                <asp:TextBox ID="txtItemDesc" runat="server" CssClass="form-control" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="QTY">
                            <ItemTemplate>
                                <asp:TextBox ID="txtQty" runat="server" CssClass="form-control" TextMode="Number" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="UNIT PRICE">
                            <ItemTemplate>
                                <asp:TextBox ID="txtUnitPrice" runat="server" CssClass="form-control" TextMode="Number" step="0.01" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="UNIT DISC">
                            <ItemTemplate>
                                <asp:TextBox ID="txtUnitDisc" runat="server" CssClass="form-control" TextMode="Number" step="0.01" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="AMOUNT">
                            <ItemTemplate>
                                <asp:TextBox ID="txtAmount" runat="server" CssClass="form-control" ReadOnly="true" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>--%>

        <div style="background-color: #f1f1f1; margin-bottom: 10px; padding: 10px;">

            <div class="row mt-3">
                <div class="col-md-5">
                    <div class="input-group">
                        <asp:TextBox ID="txtBroker" CssClass="form-control" runat="server" Placeholder="Broker" />
                        <div class="input-group-append" style="margin-left: 20px;">
                            <asp:Button ID="btnAddBroker" runat="server" Text="+" CssClass="btn btn-success" Style="padding-right: 10px; background-color: #dc3545; border: none;" />
                        </div>
                    </div>
                </div>
                <div class="col-md-7">
                    <asp:TextBox ID="txtCommission" CssClass="form-control" runat="server" Placeholder="Commission" TextMode="Number" step="0.01" />
                </div>
            </div>

            <div class="row mt-3">
                <div class="col-md-3">
                    <div class="form-group">
                        <label>Total Qty</label>
                        <asp:TextBox ID="txtTotalQty" CssClass="form-control" runat="server" ReadOnly="true" />
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label>Total</label>
                        <asp:TextBox ID="txtTotal" CssClass="form-control" runat="server" ReadOnly="true" />
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label>Dis. Amount</label>
                        <asp:TextBox ID="txtDiscAmount" CssClass="form-control" runat="server" ReadOnly="true" />
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label>Grand Total</label>
                        <asp:TextBox ID="txtGrandTotal" CssClass="form-control" runat="server" ReadOnly="true" />
                    </div>
                </div>
            </div>

        </div>

        <!-- Add New Invoice Modal -->
        <div class="modal fade" id="addInvoiceModal" tabindex="-1" aria-labelledby="addInvoiceModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-xl" style="max-width: 80%; width: 80%;">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addInvoiceModalLabel">Add New Invoice</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">

                        <!-- Add New Item Form -->
                        <!-- Section 1 -->
                        <div class="row mb-3">
                            <h6 class="fw-bold">Item Details</h6>
                            <div class="col-md-2">
                                <div class="mb-2">
                                    <input type="text" class="form-control" id="itemCode" name="itemCode" placeholder="Item Code">
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="mb-2">
                                    <input type="text" class="form-control" id="partNumber" name="partNumber" placeholder="Part Number">
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="mb-2">
                                    <input type="text" class="form-control" id="brand" name="brand" placeholder="Brand">
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="mb-2">
                                    <input type="text" class="form-control" id="oldName" name="oldName" placeholder="Old Name">
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="mb-2">
                                    <input type="text" class="form-control" id="category" name="category" placeholder="Category">
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="mb-2">
                                    <input type="text" class="form-control" id="model" name="model" placeholder="Model">
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="mb-2">
                                    <input type="text" class="form-control" id="description" name="description" placeholder="Description">
                                </div>
                            </div>
                        </div>

                        <!-- Grid View Table -->
                        <div class="table-responsive mb-4">
                            <table class="table table-bordered table-hover" id="invoiceItemsTable">
                                <thead class="table-light">
                                    <tr>
                                        <th>Code</th>
                                        <th>Part</th>
                                        <th>Brand</th>
                                        <th>Old Name</th>
                                        <th>Rack</th>
                                        <th>Category</th>
                                        <th>Model</th>
                                        <th>Description</th>
                                        <th>Qty</th>
                                        <th>Price</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <!-- Table data will be populated dynamically -->
                                </tbody>
                            </table>
                        </div>

                        <!-- Section 2 -->
                        <div class="row mb-3">
                            <h6 class="fw-bold">Pricing Details</h6>
                            <div class="col-md-3">
                                <div class="mb-2">
                                    <label for="qty" class="form-label">Qty</label>
                                    <input type="number" class="form-control" id="qty" name="qty" min="1" value="1">
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="mb-2">
                                    <label for="price" class="form-label">Price</label>
                                    <input type="number" step="0.01" class="form-control" id="price" name="price">
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="mb-2">
                                    <label for="unitDisc" class="form-label">Unit Disc.</label>
                                    <input type="number" step="0.01" class="form-control" id="unitDisc" name="unitDisc" value="0">
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="mb-2">
                                    <label for="amount" class="form-label">Amount</label>
                                    <input type="number" step="0.01" class="form-control" id="amount" name="amount" readonly>
                                </div>
                            </div>
                            <div class="col-md-12 mt-2">
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="stockType" id="all" value="all" checked>
                                    <label class="form-check-label" for="all">All</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="stockType" id="brandNew" value="brandNew">
                                    <label class="form-check-label" for="brandNew">Brand-New (Stock)</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="stockType" id="reCondition" value="reCondition">
                                    <label class="form-check-label" for="reCondition">Re-Condition (Non STK)</label>
                                </div>
                            </div>
                        </div>

                        <!-- Section 3 -->
                        <div class="row">
                            <h6 class="fw-bold">Additional Information</h6>
                            <div class="col-md-4">
                                <div class="mb-2">
                                    <label for="originalPrice" class="form-label">Original Price</label>
                                    <input type="number" step="0.01" class="form-control" id="originalPrice" name="originalPrice">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="mb-2">
                                    <label for="finalPrice" class="form-label">Final Price</label>
                                    <input type="number" step="0.01" class="form-control" id="finalPrice" name="finalPrice">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="mb-2">
                                    <label for="minPrice" class="form-label">Min Price</label>
                                    <input type="number" step="0.01" class="form-control" id="minPrice" name="minPrice">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="mb-2">
                                    <label for="tType" class="form-label">T. Type</label>
                                    <select class="form-select" id="tType" name="tType">
                                        <option selected disabled>Select Type</option>
                                        <!-- Options will be loaded dynamically -->
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="mb-2">
                                    <label for="commission" class="form-label">Commission</label>
                                    <input type="number" step="0.01" class="form-control" id="commission" name="commission" value="0">
                                </div>
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

    </div>
</asp:Content>
