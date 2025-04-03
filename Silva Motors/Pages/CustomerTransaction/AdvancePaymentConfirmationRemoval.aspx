<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdvancePaymentConfirmationRemoval.aspx.cs" Inherits="Silva_Motors.Pages.CustomerTransaction.AdvancePaymentConfirmationRemoval" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Bootstrap CSS and jQuery References (if not already in MasterPage) -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href='<%= ResolveUrl("~/Content/CustomCSS/CustomerTransaction/CustomerPaymentReciept.css") %>' />
    <style>
        .payment-row {
            margin-bottom: 15px;
        }
        .modal-title {
            font-weight: 600;
        }
        .separator {
            margin: 20px 0;
            border-top: 1px solid #dee2e6;
        }
        .checkbox-col {
            display: flex;
            align-items: center;
            justify-content: center;
        }
    </style>
    <div class="main">
        <div class="container-fluid">
            <div class="row align-items-center">
                <div class="col d-flex justify-content-between align-items-center">
                    <div class="header h4">ADVANCE PAYMENT CONFIRMATION/ REMOVAL</div>
                    <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#addpaymentconfirmModal">
                        Add
                    </button>
                </div>
            </div>
        </div>

        <!-- Form Section -->
        <div class="form-section">
            <div class="row">
                <div class="col-md-3">
                    <div class="form-group">
                        <label>Customer</label>
                        <asp:DropDownList ID="ddlCustomer" runat="server" CssClass="form-control">
                            <asp:ListItem Text="Select Customer" Value="" />
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <asp:TextBox ID="txtField1" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txtField2" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txtField3" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txtField4" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <asp:TextBox ID="txtAdvNo" runat="server" CssClass="form-control" Placeholder="ADV No"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txtEngineNo" runat="server" CssClass="form-control" Placeholder="Engine No"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <asp:TextBox ID="txtTec1" runat="server" CssClass="form-control" Placeholder="TEC 1"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txtTec2" runat="server" CssClass="form-control" Placeholder="TEC 2"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <div class="input-group">
                            <asp:TextBox ID="txtDate" runat="server" CssClass="form-control" Placeholder="Enter Date"></asp:TextBox>
                            <div class="input-group-append">
                                <span class="input-group-text">
                                    <i class="fa fa-calendar"></i>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Items Table -->
        <div class="table-responsive">
            <asp:GridView ID="gvItem" runat="server" AutoGenerateColumns="false"
                CssClass="table table-bordered customers-table" Width="100%">
                <HeaderStyle CssClass="table-header" />
                <Columns>
                    <asp:BoundField DataField="Code" HeaderText="CODE" />
                    <asp:BoundField DataField="ItemDesc" HeaderText="ITEM-DESC" />
                    <asp:BoundField DataField="Qty" HeaderText="QTY" />
                    <asp:BoundField DataField="UnitPrice" HeaderText="UNIT PRICE" />
                    <asp:BoundField DataField="Amount" HeaderText="AMOUNT" />
                </Columns>
            </asp:GridView>
        </div>

        <!-- Total Section -->
        <div class="total-section">
            <div class="row">
                <div class="col-md-4">
                    <div class="form-group">
                        <label>Total</label>
                        <asp:TextBox ID="txtTotal" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label>Total Paid</label>
                        <asp:TextBox ID="txtTotalPaid" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label>Due Balance</label>
                        <asp:TextBox ID="txtDueBalance" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal -->
        <div class="modal fade" id="addpaymentconfirmModal" tabindex="-1" aria-labelledby="advancePaymentModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="advancePaymentModalLabel">Add Advance Payment Confirmation / Removal</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <!-- Payment Options Section -->
                        <div class="row payment-row">
                            <div class="col-2 checkbox-col">
                                <asp:CheckBox ID="chkCash" runat="server" CssClass="form-check-input" />
                            </div>
                            <div class="col-4">
                                <label class="form-check-label" for="chkCash">Cash</label>
                            </div>
                            <div class="col-6">
                                <asp:TextBox ID="txtCash" runat="server" CssClass="form-control" />
                            </div>
                        </div>

                        <div class="row payment-row">
                            <div class="col-2 checkbox-col">
                                <asp:CheckBox ID="chkCheque" runat="server" CssClass="form-check-input" />
                            </div>
                            <div class="col-4">
                                <label class="form-check-label" for="chkCheque">Cheque</label>
                            </div>
                            <div class="col-6">
                                <asp:TextBox ID="txtCheque" runat="server" CssClass="form-control" />
                            </div>
                        </div>

                        <div class="row payment-row">
                            <div class="col-2 checkbox-col">
                                <asp:CheckBox ID="chkCreditCard" runat="server" CssClass="form-check-input" />
                            </div>
                            <div class="col-4">
                                <label class="form-check-label" for="chkCreditCard">Credit Card</label>
                            </div>
                            <div class="col-6">
                                <asp:TextBox ID="txtCreditCard" runat="server" CssClass="form-control"/>
                            </div>
                        </div>

                        <div class="row payment-row">
                            <div class="col-2 checkbox-col">
                                <asp:CheckBox ID="chkVoucher" runat="server" CssClass="form-check-input" />
                            </div>
                            <div class="col-4">
                                <label class="form-check-label" for="chkVoucher">Voucher or Ref No</label>
                            </div>
                            <div class="col-6">
                                <asp:TextBox ID="txtVoucher" runat="server" CssClass="form-control" />
                            </div>
                        </div>

                        <!-- Separator -->
                        <div class="separator"></div>

                        <!-- Total Payment Section -->
                        <div class="row">
                            <div class="col-6">
                                <label for="txtTotalPayment" class="form-label fw-bold">Total Payment</label>
                            </div>
                            <div class="col-6">
                                <asp:TextBox ID="txtTotalPayment" runat="server" CssClass="form-control" ReadOnly="true" />
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

    <script type="text/javascript">
        $(document).ready(function () {
            // Initialize datepicker for date field
            $("#<%= txtDate.ClientID %>").datepicker({
                dateFormat: 'dd/mm/yy',
                showOn: "both",
                buttonText: "<i class='fa fa-calendar'></i>"
            });

            // Calculate due balance when total paid changes
            $("#<%= txtTotalPaid.ClientID %>").on('change', function () {
                calculateDueBalance();
            });

            function calculateDueBalance() {
                var total = parseFloat($("#<%= txtTotal.ClientID %>").val()) || 0;
                var totalPaid = parseFloat($("#<%= txtTotalPaid.ClientID %>").val()) || 0;
                var dueBalance = total - totalPaid;

                $("#<%= txtDueBalance.ClientID %>").val(dueBalance.toFixed(2));
            }
        });
    </script>
</asp:Content>
