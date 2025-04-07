<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdvancePaymentAdjustment.aspx.cs" Inherits="Silva_Motors.Pages.CustomerTransaction.AdvancePaymentAdjustment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href='<%= ResolveUrl("~/Content/CustomCSS/CustomerTransaction/CustomerPaymentReciept.css") %>' />
    <!-- Select2 CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" rel="stylesheet" />
    <!-- Custom Select2 Bootstrap Theme -->
    <link href="https://cdn.jsdelivr.net/npm/select2-bootstrap-5-theme@1.3.0/dist/select2-bootstrap-5-theme.min.css" rel="stylesheet" />
    <!-- SweetAlert2 -->
    <link href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <div class="main">
        <div class="container-fluid">
            <div class="row align-items-center">
                <div class="col d-flex justify-content-between align-items-center">
                    <div class="header h4">ADVANCE PAYMENT ADJUSTMENT</div>
                    <%-- <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#addpaymentModal">
                        Add
                    </button>--%>
                    <asp:Button ID="btnAdd" runat="server" Text="Add" CssClass="btn btn-danger"
                        OnClientClick="return false;" data-bs-toggle="modal" data-bs-target="#addpaymentModal" />
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <div class="customer-info-section">
                            <div class="form-container">
                                <div class="column">
                                    <div class="form-group">
                                        <label>Select Customer</label>
                                        <asp:DropDownList ID="txt_SearchCustomerId" CssClass="form-control select-customer" runat="server" AutoPostBack="true">
                                        </asp:DropDownList>
                                    </div>
                                    <div class="form-group mb-6">
                                        <asp:TextBox ID="txt_CustomerName" runat="server" CssClass="form-control mb-2" ReadOnly="true"></asp:TextBox>
                                        <asp:TextBox ID="txt_CustomerAdd1" runat="server" CssClass="form-control mb-2" ReadOnly="true"></asp:TextBox>
                                        <asp:TextBox ID="txt_Contact1" runat="server" CssClass="form-control mb-2" ReadOnly="true"></asp:TextBox>
                                        <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control mb-2" ReadOnly="true"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="column">
                                    <div class="form-group">
                                        <div class="form-check mt-3">
                                            <asp:CheckBox ID="chkCash" runat="server" Text="Cash" class="w-50" />
                                            <asp:TextBox ID="txtCash" runat="server" class="w-50" Enabled="false"></asp:TextBox>
                                        </div>
                                        <div class="form-check">
                                            <asp:CheckBox ID="chkCheque" runat="server" Text="Cheque" class="w-50" />
                                            <asp:TextBox ID="txtCheque" runat="server" class="w-50" Enabled="false"></asp:TextBox>
                                        </div>
                                        <div class="form-check">
                                            <asp:CheckBox ID="chkCreditCard" runat="server" Text="Voucher" class="w-50" />
                                            <asp:TextBox ID="txtCreditCard" runat="server" class="w-50" Enabled="false"></asp:TextBox>
                                        </div>
                                        <div class="form-check">
                                            <asp:CheckBox ID="chkVoucher" runat="server" Text="Voucher" class="w-50" />
                                            <asp:TextBox ID="TxtVoucher" runat="server" class="w-50" Enabled="false"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="column">
                                    <div class="form-group">
                                        <label>RIP</label>
                                        <asp:TextBox ID="txt_Rip" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label>Date</label>
                                        <asp:TextBox ID="txt_Date" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                    </div>
                                    <div class="form-check">
                                        <asp:CheckBox ID="CheckBox1" runat="server" Text="Modify Entered T/Receipt" class="w-50" />
                                    </div>
                                </div>
                            </div>
                            <div class="table-responsive">
                                <asp:GridView ID="gvTransactions" runat="server" AutoGenerateColumns="false"
                                    CssClass="table table-bordered customers-table" Width="100%">
                                    <Columns>
                                        <asp:BoundField DataField="No" HeaderText="NO" />
                                        <asp:BoundField DataField="RefNo" HeaderText="CHEQUE NO" />
                                        <asp:BoundField DataField="Bank" HeaderText="BANK" />
                                        <asp:BoundField DataField="Branch" HeaderText="BRANCH" />
                                        <asp:BoundField DataField="Date" HeaderText="DATE" />
                                        <asp:BoundField DataField="Amount" HeaderText="AMOUNT" />
                                    </Columns>
                                </asp:GridView>
                                <asp:HiddenField ID="hdnCheckedPayments" runat="server" />
                            </div>
                            <div style="background-color: #f1f1f1; margin-bottom: 10px; padding: 10px;">
                                <div class="row mt-3">
                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <asp:Label ID="lblTotalGoodAmount" runat="server" Text="Total Good Amount"></asp:Label>
                                            <asp:TextBox ID="txtTotalGoodAmount" CssClass="form-control" runat="server" />
                                        </div>
                                    </div>
                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <asp:Label ID="lblTotalPaid" runat="server" Text="Total Paid"></asp:Label>
                                            <asp:TextBox ID="txtTotalPaid" CssClass="form-control" runat="server" />
                                        </div>
                                    </div>
                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <asp:Label ID="lblDueBalance" runat="server" Text="Due Balance"></asp:Label>
                                            <asp:TextBox ID="txtDueBalance" CssClass="form-control" runat="server" />
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <asp:Label ID="lblValidDays" runat="server" Text="Valid Days"></asp:Label>
                                            <asp:TextBox ID="txtValidDays" CssClass="form-control" runat="server" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <!-- Hidden field to store success/failure message from server -->
    <asp:HiddenField ID="hdnSaveStatus" runat="server" />
    <asp:HiddenField ID="hdnSaveMessage" runat="server" />
    <asp:HiddenField ID="txt_Customer_NEW_DueBal" runat="server" />
    <asp:HiddenField ID="txt_Customer_OLD_DueBal" runat="server" />

    <!-- jQuery and Select2 scripts -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>
    <!-- SweetAlert2 -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</asp:Content>
