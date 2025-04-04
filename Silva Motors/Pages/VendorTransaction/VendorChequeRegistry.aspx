<%@ Page Title="" Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="VendorChequeRegistry.aspx.cs" Inherits="Silva_Motors.Pages.VendorTransaction.VendorChequeRegistry" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

    <link rel="stylesheet" href='<%= ResolveUrl("~/Content/CustomCSS/CustomerTransaction/CustomerPaymentReciept.css") %>' />

    <div class="main">
        <div class="header">VENDOR CHEQUE REGISTRY</div>

        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group mb-4">
                                        <div class="form-check mb-4">
                                            <asp:RadioButton ID="rbAllCheque" runat="server" GroupName="radioOptions" Checked="true" />
                                            <label class="form-check-label ml-4" for="<%= rbAllCheque.ClientID %>">All Cheques</label>
                                        </div>
                                        <div class="form-check mb-4">
                                            <asp:RadioButton ID="rbChequeInHand" runat="server" GroupName="radioOptions" />
                                            <label class="form-check-label ml-4" for="<%= rbChequeInHand.ClientID %>">Cheque In Hand</label>
                                        </div>
                                        <div class="form-check mb-4">
                                            <asp:RadioButton ID="rbChequeRealized" runat="server" GroupName="radioOptions" />
                                            <label class="form-check-label ml-4" for="<%= rbChequeRealized.ClientID %>">Cheque Realized</label>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtChequeNo" runat="server" CssClass="form-control" placeholder="Cheque No"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtVendor" runat="server" CssClass="form-control" placeholder="Vendor Name"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtAmount" runat="server" CssClass="form-control" placeholder="Amount"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="table-responsive">
                                <asp:GridView ID="gvTransactions" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered customers-table" Width="100%">
                                    <HeaderStyle CssClass="table-header" />
                                    <Columns>
                                        <asp:BoundField DataField="ChequeNo" HeaderText="CHEQUE NO" />
                                        <asp:BoundField DataField="BankName" HeaderText="BANK NAME" />
                                        <asp:BoundField DataField="Branch" HeaderText="BRANCH" />
                                        <asp:BoundField DataField="Date" HeaderText="DATE" />
                                        <asp:BoundField DataField="Status" HeaderText="STATUS" />
                                        <asp:BoundField DataField="Vendor" HeaderText="VENDOR" />
                                        <asp:BoundField DataField="Amount" HeaderText="AMOUNT" />

                                    </Columns>
                                    <HeaderStyle BackColor="Black" ForeColor="White" />
                                    <RowStyle BackColor="#e0e0e0" />
                                    <AlternatingRowStyle BackColor="White" />
                                </asp:GridView>
                                <div class="form-group d-flex align-items-center">
                                    <asp:Label ID="lblGrandTotal" runat="server" Text="Grand Total" CssClass="me-2"></asp:Label>
                                    <asp:TextBox ID="grandTotal" runat="server" CssClass="form-control" Width="30%"></asp:TextBox>
                                </div>
                            </div>
                            <div class="text-right mb-3">
                                <asp:Button ID="btnPrint" runat="server" Text="Print" CssClass="btn btn-primary" Style="background-color: #B71D1D; border-color: #B71D1D; color: white;" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
