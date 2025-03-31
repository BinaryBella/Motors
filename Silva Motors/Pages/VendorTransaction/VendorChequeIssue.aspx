<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VendorChequeIssue.aspx.cs" Inherits="Silva_Motors.Pages.VendorTransaction.VendorChequeIssue" %>

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
        <div class="header">VENDOR CHEQUE ISSUE</div>

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
                                        <label>Total Due Amount</label>
                                        <asp:TextBox ID="txt_CustomerTotalDueBal" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label>Remaining Balance</label>
                                        <asp:TextBox ID="txt_remaining_balance" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label>Reciept Balance</label>
                                        <asp:TextBox ID="txt_total_recieptbalance" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <div class="transaction-table-section">
                                <table id="myTable" class="transaction-table table table-bordered">
                                    <thead>
                                        <tr>
                                            <th>NO</th>
                                            <th>REF/NO</th>
                                            <th style="width: 200px;">DATE</th>
                                            <th style="width: 135px;">PARTICULARS</th>
                                            <th style="width: 250px;">TRX AMOUNT</th>
                                            <th style="width: 150px;" class="th">DUE AMOUNT</th>
                                            <th style="width: 150px;" class="th">AGE</th>
                                            <th>X</th>
                                            <th>AMOUNT</th>
                                        </tr>
                                    </thead>

                                    <tbody class="tbody">
                                        <asp:Repeater ID="rptTransactions" runat="server">
                                            <ItemTemplate>
                                                <tr>
                                                    <td><%# Eval("No") %></td>
                                                    <td><%# Eval("RefNo") %></td>
                                                    <td><%# Eval("Date", "{0:yyyy-MM-dd}") %></td>
                                                    <td><%# Eval("Particulars") %></td>
                                                    <td><%# Eval("AtrxNetAm", "{0:N2}") %></td>
                                                    <td><%# Eval("AtrxDueAm", "{0:N2}") %></td>
                                                    <td><%# Eval("Age") %></td>
                                                    <td><%# Eval("X") %></td>
                                                    <td><%# Eval("Amount") %></td>
                                                    <td>
                                                        <asp:CheckBox ID="chkBox" runat="server" onclick="updateCheckedAmount(this)" />
                                                        <asp:HiddenField ID="hdnDueAmount" runat="server" Value='<%# Eval("AtrxDueAm") %>' />
                                                    </td>

                                                    <td></td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </tbody>
                                </table>
                                <asp:HiddenField ID="hdnCheckedPayments" runat="server" />
                            </div>
                            <div class="action-buttons">
                                <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary" Style="background-color: #B71D1D; border-color: #B71D1D; color: white;" />
                                <button type="button" class="btn" data-dismiss="modal" style="background-color: #D9D9D9;">Cancel</button>
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