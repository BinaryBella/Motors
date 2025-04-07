<%@ Page Title="Invoice" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Invoice.aspx.cs" Inherits="Silva_Motors.Pages.CustomerTransaction.Invoice" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href='<%= ResolveUrl("~/Content/CustomCSS/CustomerTransaction/InvoiceCSS.css") %>' />

    <div class="main">
        <div class="container-fluid">
            <div class="row align-items-center">
                <div class="col d-flex justify-content-between align-items-center">
                    <div class="header h4">INVOICE</div>
                    <asp:Button ID="btnShowAddInvoiceModal" runat="server" CssClass="btn btn-danger" Text="Add" UseSubmitBehavior="false" OnClientClick="return false;" />
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
                        <asp:Label AssociatedControlID="txtTotalBalanceDue" runat="server" Text="Total Balance Due" />
                        <asp:TextBox ID="txtTotalBalanceDue" CssClass="form-control" runat="server" />
                    </div>
                </div>
                <div class="col-md-2">
                    <div class="form-group">
                        <asp:Label AssociatedControlID="txtChequeBalance" runat="server" Text="Cheque Balance" />
                        <asp:TextBox ID="txtChequeBalance" CssClass="form-control" runat="server" />
                    </div>
                </div>
                <div class="col-md-2">
                    <div class="form-group">
                        <asp:Label AssociatedControlID="txtAvailableBalance" runat="server" Text="Available Balance" />
                        <asp:TextBox ID="txtAvailableBalance" CssClass="form-control" runat="server" />
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <asp:Label AssociatedControlID="txtCreditPeriod" runat="server" Text="Credit Period" />
                        <asp:TextBox ID="txtCreditPeriod" CssClass="form-control" runat="server" />
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <asp:Label AssociatedControlID="txtCreditLimit" runat="server" Text="Credit Limit" />
                        <asp:TextBox ID="txtCreditLimit" CssClass="form-control" runat="server" />
                    </div>
                </div>
            </div>
        </div>

        <div class="row mt-3">
            <div class="col-12">
                <asp:GridView ID="gvItems" runat="server" CssClass="customers-table table table-bordered" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField DataField="Code" HeaderText="CODE" />
                        <asp:BoundField DataField="ItemDesc" HeaderText="ITEM-DESC" />
                        <asp:BoundField DataField="Qty" HeaderText="QTY" />
                        <asp:BoundField DataField="UnitPrice" HeaderText="UNIT PRICE" />
                        <asp:BoundField DataField="UnitDisc" HeaderText="UNIT DISC" />
                        <asp:BoundField DataField="Amount" HeaderText="AMOUNT" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>


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
                        <asp:Label ID="lblTotalQty" runat="server" Text="Total Qty" />
                        <asp:TextBox ID="txtTotalQty" runat="server" CssClass="form-control" ReadOnly="true" />
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <asp:Label ID="lblTotal" runat="server" Text="Total" />
                        <asp:TextBox ID="txtTotal" runat="server" CssClass="form-control" ReadOnly="true" />
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <asp:Label ID="lblDiscAmount" runat="server" Text="Dis. Amount" />
                        <asp:TextBox ID="txtDiscAmount" runat="server" CssClass="form-control" ReadOnly="true" />
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <asp:Label ID="lblGrandTotal" runat="server" Text="Grand Total" />
                        <asp:TextBox ID="txtGrandTotal" runat="server" CssClass="form-control" ReadOnly="true" />
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
                        <asp:Button ID="btnCloseModal" runat="server" CssClass="btn-close" UseSubmitBehavior="false" OnClientClick="return false;" />
                    </div>
                    <div class="modal-body">

                        <!-- Add New Item Form -->
                        <!-- Section 1 -->
                        <div class="row mb-3">
                            <h6 class="fw-bold">Item Details</h6>
                            <div class="col-md-2">
                                <div class="mb-2">
                                    <asp:TextBox ID="txtItemCode" runat="server" CssClass="form-control" Placeholder="Item Code" />
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="mb-2">
                                    <asp:TextBox ID="txtPartNumber" runat="server" CssClass="form-control" Placeholder="Part Number" />
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="mb-2">
                                    <asp:TextBox ID="txtBrand" runat="server" CssClass="form-control" Placeholder="Brand" />
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="mb-2">
                                    <asp:TextBox ID="txtOldName" runat="server" CssClass="form-control" Placeholder="Old Name" />
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="mb-2">
                                    <asp:TextBox ID="txtCategory" runat="server" CssClass="form-control" Placeholder="Category" />
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="mb-2">
                                    <asp:TextBox ID="txtModel" runat="server" CssClass="form-control" Placeholder="Model" />
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="mb-2">
                                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" Placeholder="Description" />
                                </div>
                            </div>
                        </div>

                        <!-- Grid View Table -->
                        <div class="table-responsive mb-4">

                            <asp:GridView ID="invoiceItemsTable" runat="server" CssClass="customers-table table table-bordered" AutoGenerateColumns="False">
                                <Columns>
                                    <asp:BoundField DataField="Code" HeaderText="CODE" />
                                    <asp:BoundField DataField="Part" HeaderText="Part" />
                                    <asp:BoundField DataField="Brand" HeaderText="BRAND" />
                                    <asp:BoundField DataField="OldName" HeaderText="OLD_Name" />
                                    <asp:BoundField DataField="Rack" HeaderText="Rack" />
                                    <asp:BoundField DataField="Category" HeaderText="CATEGORY" />
                                    <asp:BoundField DataField="Model" HeaderText="MODEL" />
                                    <asp:BoundField DataField="Description" HeaderText="DESCRIPTION" />
                                    <asp:BoundField DataField="Qty" HeaderText="QTY" />
                                    <asp:BoundField DataField="Price" HeaderText="PRICE" />
                                    <asp:BoundField DataField="Action" HeaderText="ACTION" />

                                </Columns>
                            </asp:GridView>
                        </div>

                        <!-- Section 2 -->
                        <div class="row mb-3">
                            <h6 class="fw-bold">Pricing Details</h6>
                            <div class="col-md-3">
                                <div class="mb-2">
                                    <asp:Label ID="lblQty" runat="server" CssClass="form-label" Text="Qty" AssociatedControlID="txtQty" />
                                    <asp:TextBox ID="txtQty" runat="server" CssClass="form-control" Text="1" MinLength="1" />
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="mb-2">
                                    <asp:Label ID="lblPrice" runat="server" CssClass="form-label" Text="Price" AssociatedControlID="txtPrice" />
                                    <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control" TextMode="SingleLine" />
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="mb-2">
                                    <asp:Label ID="lblUnitDisc" runat="server" CssClass="form-label" Text="Unit Disc." AssociatedControlID="txtUnitDisc" />
                                    <asp:TextBox ID="txtUnitDisc" runat="server" CssClass="form-control" Text="0" />
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="mb-2">
                                    <asp:Label ID="lblAmount" runat="server" CssClass="form-label" Text="Amount" AssociatedControlID="txtAmount" />
                                    <asp:TextBox ID="txtAmount" runat="server" CssClass="form-control" ReadOnly="true" />
                                </div>
                            </div>
                            <div class="col-md-12 mt-2">
                                <div class="form-check form-check-inline">
                                    <asp:RadioButton ID="rbAll" runat="server" CssClass="form-check-input" GroupName="stockType" Text="All" Checked="True" />
                                    <asp:Label ID="lblAll" runat="server" CssClass="form-check-label" AssociatedControlID="rbAll" Text="All" />
                                </div>
                                <div class="form-check form-check-inline">
                                    <asp:RadioButton ID="rbBrandNew" runat="server" CssClass="form-check-input" GroupName="stockType" Text="Brand-New (Stock)" />
                                    <asp:Label ID="lblBrandNew" runat="server" CssClass="form-check-label" AssociatedControlID="rbBrandNew" Text="Brand-New (Stock)" />
                                </div>
                                <div class="form-check form-check-inline">
                                    <asp:RadioButton ID="rbReCondition" runat="server" CssClass="form-check-input" GroupName="stockType" Text="Re-Condition (Non STK)" />
                                    <asp:Label ID="lblReCondition" runat="server" CssClass="form-check-label" AssociatedControlID="rbReCondition" Text="Re-Condition (Non STK)" />
                                </div>
                            </div>
                        </div>

                        <!-- Section 3 -->
                        <div class="row">
                            <h6 class="fw-bold">Additional Information</h6>
                            <div class="col-md-4">
                                <div class="mb-2">
                                    <asp:Label ID="lblOriginalPrice" runat="server" CssClass="form-label" Text="Original Price" AssociatedControlID="txtOriginalPrice" />
                                    <asp:TextBox ID="txtOriginalPrice" runat="server" CssClass="form-control" TextMode="SingleLine" />
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="mb-2">
                                    <asp:Label ID="lblFinalPrice" runat="server" CssClass="form-label" Text="Final Price" AssociatedControlID="txtFinalPrice" />
                                    <asp:TextBox ID="txtFinalPrice" runat="server" CssClass="form-control" TextMode="SingleLine" />
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="mb-2">
                                    <asp:Label ID="lblMinPrice" runat="server" CssClass="form-label" Text="Min Price" AssociatedControlID="txtMinPrice" />
                                    <asp:TextBox ID="txtMinPrice" runat="server" CssClass="form-control" TextMode="SingleLine" />
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="mb-2">
                                    <asp:Label ID="lblTType" runat="server" CssClass="form-label" Text="T. Type" AssociatedControlID="ddlTType" />
                                    <asp:DropDownList ID="ddlTType" runat="server" CssClass="form-select">
                                        <asp:ListItem Text="Select Type" Value="" Selected="True" Enabled="False" />
                                        
                                    </asp:DropDownList>
                                </div>
                                <div class="col-md-4">
                                    <div class="mb-2">
                                        <asp:Label ID="lblCommission" runat="server" CssClass="form-label" Text="Commission" AssociatedControlID="txtCommission" />
                                        <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" Text="0" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary" Style="background-color: #B71D1D; border-color: #B71D1D;" OnClientClick="return validateForm();" />
                            <asp:Button ID="btnCancel" runat="server" CssClass="btn" Text="Cancel" OnClientClick="$('#addInvoiceModal').modal('hide'); return false;" Style="background-color: #D9D9D9;" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
