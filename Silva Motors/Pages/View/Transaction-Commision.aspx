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
                                            <asp:Label AssociatedControlID="StartDate" CssClass="form-label" runat="server" Text="Start Date"></asp:Label>
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="bi bi-calendar-check"></i></span>
                                                <asp:TextBox ID="StartDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-6 mb-3">
                                            <asp:Label AssociatedControlID="EndDate" CssClass="form-label" runat="server" Text="End Date"></asp:Label>
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="bi bi-calendar-check"></i></span>
                                                <asp:TextBox ID="EndDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
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
                                            <asp:RadioButton ID="ViewOptionAll" runat="server" GroupName="ViewOption" Text="View All Transactions" Checked="true" CssClass="form-check-input" />
                                        </div>
                                        <div class="col-md-6">
                                            <asp:RadioButton ID="ViewOptionDue" runat="server" GroupName="ViewOption" Text="View All Due" CssClass="form-check-input" />
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-md-6">
                                            <asp:RadioButton ID="ViewOptionRefNo" runat="server" GroupName="ViewOption" Text="View Selected Ref/No" CssClass="form-check-input" />
                                            <asp:TextBox ID="RefNo" runat="server" CssClass="form-control mt-2" placeholder="Enter Ref/No"></asp:TextBox>
                                        </div>
                                        <div class="col-md-6">
                                            <asp:RadioButton ID="ViewOptionTrxType" runat="server" GroupName="ViewOption" Text="View Selected Tx Type" CssClass="form-check-input" />
                                            <asp:TextBox ID="TrxType" runat="server" CssClass="form-control mt-2" placeholder="Enter Transaction Type"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <asp:Button ID="btnAddCommission" runat="server" Text="Add New Commission" CssClass="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addCommissionModal" Style="margin-left: 1585px; background-color: #c22; color: white; border: none; padding: 8px 30px; font-weight: normal;" />

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
                                    <asp:Label AssociatedControlID="invoiceNo" CssClass="form-label" runat="server" Text="Invoice No"></asp:Label>
                                    <asp:DropDownList ID="invoiceNo" runat="server" CssClass="form-select" AutoPostBack="true" >
                                        <asp:ListItem Text="Select Invoice No" Value=""></asp:ListItem>
                                        <!-- Dynamically populate invoice numbers -->
                                    </asp:DropDownList>
                                    <div class="invalid-feedback">Please select an invoice number.</div>
                                </div>

                                <!-- Broker Dropdown -->
                                <div class="col-12 mb-3">
                                    <asp:Label AssociatedControlID="broker" CssClass="form-label" runat="server" Text="Broker"></asp:Label>
                                    <asp:DropDownList ID="broker" runat="server" CssClass="form-select" AutoPostBack="true" >
                                        <asp:ListItem Text="Select Broker" Value=""></asp:ListItem>
                                        <!-- Dynamically populate brokers -->
                                    </asp:DropDownList>
                                    <div class="invalid-feedback">Please select a broker.</div>
                                </div>

                                <!-- Commission Input -->
                                <div class="col-12 mb-3">
                                    <asp:Label AssociatedControlID="commission" CssClass="form-label" runat="server" Text="Commission"></asp:Label>
                                    <div class="input-group">
                                        <span class="input-group-text">$</span>
                                        <asp:TextBox ID="commission" runat="server" CssClass="form-control" Placeholder="Enter Commission Amount" MaxLength="10" />
                                    </div>
                                    <div class="invalid-feedback">Please enter a valid commission amount.</div>
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
