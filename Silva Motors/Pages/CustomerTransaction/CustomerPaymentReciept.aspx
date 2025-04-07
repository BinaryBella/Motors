<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CustomerPaymentReciept.aspx.cs" Inherits="Silva_Motors.Pages.CustomerTransaction.CustomerPaymentReciept" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href='<%= ResolveUrl("~/Content/CustomCSS/CustomerTransaction/CustomerPaymentReciept.css") %>' />
    <!-- Select2 CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" rel="stylesheet" />
    <!-- Custom Select2 Bootstrap Theme -->
    <link href="https://cdn.jsdelivr.net/npm/select2-bootstrap-5-theme@1.3.0/dist/select2-bootstrap-5-theme.min.css" rel="stylesheet" />
    <!-- SweetAlert2 -->
    <link href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <div class="main">
        <div class="header">CUSTOMER PAYMENT RECIEPT</div>

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
                                            <asp:CheckBox ID="chkCreditCard" runat="server" Text="Credit Card / Voucher" class="w-50" />
                                            <asp:TextBox ID="txtCreditCard" runat="server" class="w-50" Enabled="false"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="column">
                                    <div class="form-group">
                                        <asp:Label ID="lblTotalDueAmount" runat="server" Text="Total Due Amount" CssClass="form-label" />
                                        <asp:TextBox ID="txt_CustomerTotalDueBal" runat="server" CssClass="form-control" ReadOnly="true" />
                                    </div>
                                    <div class="form-group">
                                        <asp:Label ID="lblRemainingBalance" runat="server" Text="Remaining Balance" CssClass="form-label" />
                                        <asp:TextBox ID="txt_remaining_balance" runat="server" CssClass="form-control" ReadOnly="true" />
                                    </div>
                                    <div class="form-group">
                                        <label>Reciept Balance</label>
                                        <asp:TextBox ID="txt_total_recieptbalance" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <div class="transaction-table-section">
                             
                                <div class="transaction-table-section">
                                    <asp:GridView ID="gvTransactions" runat="server" CssClass="customers-table table table-bordered" AutoGenerateColumns="False">
                                        <Columns>
                                            <asp:BoundField DataField="No" HeaderText="NO" />
                                            <asp:BoundField DataField="RefNo" HeaderText="REF/NO" />
                                            <asp:BoundField DataField="Date" HeaderText="DATE" />
                                            <asp:BoundField DataField="Particulars" HeaderText="PARTICULARS" />
                                            <asp:BoundField DataField="AtrxNetAm" HeaderText="TRX AMOUNT" />
                                            <asp:BoundField DataField="AtrxDueAm" HeaderText="DUE AMOUNT" />
                                            <asp:BoundField DataField="Age" HeaderText="AGE" SortExpression="Age" />
                                            <asp:TemplateField HeaderText="X"></asp:TemplateField>
                                            <asp:BoundField DataField="Amount" HeaderText="AMOUNT" />
                                        </Columns>
                                    </asp:GridView>
                                </div>

                                <asp:HiddenField ID="hdnCheckedPayments" runat="server" />
                            </div>
                            <div class="action-buttons">
                                <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary" Style="background-color: #B71D1D; border-color: #B71D1D; color: white;" />
                               <asp:Button ID="btnCancel" runat="server" CssClass="btn" Text="Cancel" OnClientClick="$('#addInvoiceModal').modal('hide'); return false;" Style="background-color: #D9D9D9;" />
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
