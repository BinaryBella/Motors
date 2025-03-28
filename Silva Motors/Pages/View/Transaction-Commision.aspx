<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Transaction-Commision.aspx.cs" Inherits="Silva_Motors.Pages.View.Transaction_Commision" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

    <link rel="stylesheet" href='<%= ResolveUrl("~/Content/CustomCSS/View/TransactionCSS.css") %>' />

    <div class="main">
        <div class="header">COMMISION TRANSACTIONS</div>

        <div class="container-fluid px-4">
            <div class="card shadow-sm mb-4">
                <div class="card-body" style="background-color: #f0f0f0;">
                    <div class="row">
                        <!-- Date Range Section -->
                        <div class="col-md-6 mb-3">
                            <div class="card h-100">
                                <div class="card-header">
                                    <i class="bi bi-calendar me-2"></i>Date Range
                                </div>
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-6 mb-3">
                                            <label asp-for="StartDate" class="form-label">Start Date</label>
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="bi bi-calendar-check"></i></span>
                                                <input asp-for="StartDate" type="date" class="form-control">
                                            </div>
                                        </div>
                                        <div class="col-md-6 mb-3">
                                            <label asp-for="EndDate" class="form-label">End Date</label>
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="bi bi-calendar-check"></i></span>
                                                <input asp-for="EndDate" type="date" class="form-control">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- View Options Section -->
                        <div class="col-md-6 mb-3">
                            <div class="card h-100">
                                <div class="card-header">
                                    <i class="bi bi-eye me-2"></i>View Options
                                </div>
                                <div class="card-body">
                                    <div class="row mb-3">
                                        <div class="col-md-6">
                                            <div class="form-check">
                                                <input asp-for="ViewOption" type="radio" value="all" class="form-check-input" checked>
                                                <label class="form-check-label" for="ViewOption">
                                                    View All Transactions
                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-check">
                                                <input asp-for="ViewOption" type="radio" value="due" class="form-check-input">
                                                <label class="form-check-label" for="ViewOption">
                                                    View All Due
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-md-6">
                                            <div class="form-check">
                                                <input asp-for="ViewOption" type="radio" value="refNo" class="form-check-input">
                                                <label class="form-check-label" for="ViewOption">
                                                    View Selected Ref/No
                                                </label>
                                                <input asp-for="RefNo" type="text" class="form-control mt-2" placeholder="Enter Ref/No">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-check">
                                                <input asp-for="ViewOption" type="radio" value="trxType" class="form-check-input">
                                                <label class="form-check-label" for="ViewOption">
                                                    View Selected Tx Type
                                                </label>
                                                <input asp-for="TrxType" type="text" class="form-control mt-2" placeholder="Enter Transaction Type">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addCommissionModal" style="margin-left: 1585px; background-color: #c22; color: white; border: none; padding: 8px 30px; font-weight: normal;">
                Add New Commission
            </button>

            <div class="table-responsive">
                <asp:GridView ID="gvCustomers" runat="server" AutoGenerateColumns="false"
                    CssClass="table table-bordered customers-table" Width="100%">
                    <Columns>
                        <asp:BoundField DataField="RefNo" HeaderText="REF/NO" />
                        <asp:BoundField DataField="Date" HeaderText="DATE" />
                        <asp:BoundField DataField="Time" HeaderText="TIME" />
                        <asp:BoundField DataField="RepName" HeaderText="REP NAME" />
                        <asp:BoundField DataField="User" HeaderText="USER" />
                        <asp:BoundField DataField="NetAmount" HeaderText="NET AMOUNT" />
                        <asp:BoundField DataField="Commision" HeaderText="COMMISION" />
                        <asp:BoundField DataField="DueCommision" HeaderText="DUE COMMISION" />
                    </Columns>
                    <HeaderStyle BackColor="Black" ForeColor="White" />
                    <RowStyle BackColor="#e0e0e0" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
            </div>

            <!-- Add Commision Modal -->
            <div class="modal fade" id="addCommissionModal" tabindex="-1" aria-labelledby="addCommissionModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="customerModalLabel">Add Commision</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="row g-3">
                                <!-- Invoice No Dropdown -->
                                <div class="col-12 mb-3">
                                    <label for="invoiceNo" class="form-label">Invoice No</label>
                                    <select id="invoiceNo" name="InvoiceNo" class="form-select" required>
                                        <option value="">Select Invoice No</option>
                                        <!-- Dynamically populate invoice numbers -->
                                    </select>
                                    <div class="invalid-feedback">Please select an invoice number.</div>
                                </div>

                                <!-- Broker Dropdown -->
                                <div class="col-12 mb-3">
                                    <label for="broker" class="form-label">Broker</label>
                                    <select id="broker" name="Broker" class="form-select" required>
                                        <option value="">Select Broker</option>
                                        <!-- Dynamically populate brokers -->
                                    </select>
                                    <div class="invalid-feedback">Please select a broker.</div>
                                </div>

                                <!-- Commission Input -->
                                <div class="col-12 mb-3">
                                    <label for="commission" class="form-label">Commission</label>
                                    <div class="input-group">
                                        <span class="input-group-text">$</span>
                                        <input type="number" id="commission" name="Commission"
                                            class="form-control"
                                            placeholder="Enter Commission Amount"
                                            step="0.01"
                                            min="0"
                                            required>
                                        <div class="invalid-feedback">Please enter a valid commission amount.</div>
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
    </div>
</asp:Content>
