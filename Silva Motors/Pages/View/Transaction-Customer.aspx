<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Transaction-Customer.aspx.cs" Inherits="Silva_Motors.Pages.View.Transaction_Customer" %>

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
        <div class="header">CUSTOMER TRANSACTIONS</div>
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
                                            <label for="StartDate" class="form-label">Start Date</label>
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="bi bi-calendar-check"></i></span>
                                                <asp:TextBox ID="StartDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-6 mb-3">
                                            <label for="EndDate" class="form-label">End Date</label>
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
                                    <div class="mb-3">
                                        <div class="form-check">
                                            <asp:RadioButton ID="ViewOptionAll" runat="server" GroupName="ViewOption" Text="View All Transactions" Value="all" Checked="true" CssClass="form-check-input" />
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <div class="form-check">
                                            <asp:RadioButton ID="ViewOptionRefNo" runat="server" GroupName="ViewOption" Text="View Selected Ref/No" Value="refNo" CssClass="form-check-input" />
                                            <asp:TextBox ID="RefNo" runat="server" CssClass="form-control mt-2" Placeholder="Enter Ref/No"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <div class="form-check">
                                            <asp:RadioButton ID="ViewOptionTrxType" runat="server" GroupName="ViewOption" Text="View Selected Tx Type" Value="trxType" CssClass="form-check-input" />
                                            <asp:TextBox ID="TrxType" runat="server" CssClass="form-control mt-2" Placeholder="Enter Transaction Type"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="table-responsive">
                <asp:GridView ID="gvCustomers" runat="server" AutoGenerateColumns="false"
                    CssClass="table table-bordered customers-table" Width="100%">
                    <Columns>
                        <asp:BoundField DataField="RefNo" HeaderText="REF/NO" />
                        <asp:BoundField DataField="Date" HeaderText="DATE" />
                        <asp:BoundField DataField="Time" HeaderText="TIME" />
                        <asp:BoundField DataField="Particulars" HeaderText="PARTICULARS" />
                        <asp:BoundField DataField="Owner" HeaderText="OWNER" />
                        <asp:BoundField DataField="User" HeaderText="USER" />
                        <asp:BoundField DataField="Amount" HeaderText="AMOUNT" />
                        <asp:TemplateField HeaderText="STATUS">
                            <HeaderTemplate>
                                Status
                                <asp:DropDownList ID="statusFilter" runat="server" CssClass="filter-input" AutoPostBack="true" >
                                    <asp:ListItem Value="">All</asp:ListItem>
                                    <asp:ListItem Value="active">Active</asp:ListItem>
                                    <asp:ListItem Value="inactive">Inactive</asp:ListItem>
                                </asp:DropDownList>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <span class='<%# Convert.ToBoolean(Eval("ActiveState")) ? "status-badge status-active" : "status-badge status-inactive" %>'>
                                    <i class='<%# Convert.ToBoolean(Eval("ActiveState")) ? "bi bi-check-circle-fill" : "bi bi-x-circle-fill" %> me-1'></i>
                                    <%# Convert.ToBoolean(Eval("ActiveState")) ? "Active" : "Inactive" %>
                                </span>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ACTIONS">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnEdit" runat="server" CssClass="btn btn-warning btn-sm"
                                    CommandName="EditRecord" CommandArgument='<%# Eval("Id") %>'>
                                    <i class="bi bi-pencil-fill"></i>
                                </asp:LinkButton>
                                <asp:LinkButton ID="btnDelete" runat="server"
                                    CssClass='<%# Convert.ToBoolean(Eval("ActiveState")) ? "btn btn-danger btn-sm" : "btn btn-success btn-sm" %>'
                                    OnClientClick='<%# "return confirmDelete(" + Eval("Id") + ");" %>'>
                                    <i class='<%# Convert.ToBoolean(Eval("ActiveState")) ? "bi bi-toggle-off" : "bi bi-toggle-on" %>'></i>
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <HeaderStyle BackColor="Black" ForeColor="White" />
                    <RowStyle BackColor="#e0e0e0" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
            </div>
            <!-- Trigger Button -->
            <asp:Button ID="btnViewCashInvoice" runat="server" CssClass="btn btn-primary" Text="View Cash Invoice" data-bs-toggle="modal" data-bs-target="#cashInvoiceModal" />

            <!-- Cash Invoice Modal -->
            <div class="modal fade" id="cashInvoiceModal" tabindex="-1" aria-labelledby="cashInvoiceModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg cash-invoice-modal">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="cashInvoiceModalLabel">CASH INVOICE</h5>
                            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label class="form-label">TO</label>
                                    <asp:TextBox ID="To1" runat="server" CssClass="form-control mb-2" ReadOnly="true" Style="background-color: #e0e0e0;" />
                                    <asp:TextBox ID="To2" runat="server" CssClass="form-control mb-2" ReadOnly="true" Style="background-color: #e0e0e0;" />
                                    <asp:TextBox ID="To3" runat="server" CssClass="form-control mb-2" ReadOnly="true" Style="background-color: #e0e0e0;" />
                                    <asp:TextBox ID="To4" runat="server" CssClass="form-control mb-2" ReadOnly="true" Style="background-color: #e0e0e0;" />
                                    <asp:TextBox ID="To5" runat="server" CssClass="form-control mb-2" ReadOnly="true" Style="background-color: #e0e0e0;" />
                                </div>
                                <div class="col-md-6 text-end">
                                    <div class="mb-2">
                                        Date:
                                        <asp:TextBox ID="InvoiceDate" runat="server" CssClass="form-control d-inline-block w-auto" Text="2025-03-26" ReadOnly="true" Style="background-color: #e0e0e0;" />
                                    </div>
                                    <div class="mb-2">
                                        Time:
                                        <asp:TextBox ID="InvoiceTime" runat="server" CssClass="form-control d-inline-block w-auto" Text="9:27:59 AM" ReadOnly="true" Style="background-color: #e0e0e0;" />
                                    </div>
                                    <div class="mb-2">
                                        User:
                                        <asp:TextBox ID="User" runat="server" CssClass="form-control d-inline-block w-auto" Text="0003" ReadOnly="true" Style="background-color: #e0e0e0;" />
                                    </div>
                                    <div class="mb-2">
                                        TRX No:
                                        <asp:TextBox ID="TrxNo" runat="server" CssClass="form-control d-inline-block w-auto" Text="CAS-A262937" ReadOnly="true" Style="background-color: #e0e0e0;" />
                                    </div>
                                    <div class="mb-2">
                                        Details:
                                        <asp:TextBox ID="Details" runat="server" CssClass="form-control d-inline-block w-auto" Text="" ReadOnly="true" Style="background-color: #e0e0e0;" />
                                    </div>
                                </div>
                            </div>

                            <asp:GridView ID="gvInvoiceDetails" runat="server" CssClass="table table-bordered" AutoGenerateColumns="false">
                                <Columns>
                                    <asp:BoundField DataField="Code" HeaderText="Code" />
                                    <asp:BoundField DataField="ItemDescription" HeaderText="Item Description" />
                                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                                    <asp:BoundField DataField="UnitPrice" HeaderText="Unit Price" />
                                    <asp:BoundField DataField="Amount" HeaderText="Amount" />
                                </Columns>
                            </asp:GridView>

                            <div class="row p-3" style="background-color: #000000; color: #ffffff;">
                                <div class="col-md-6">
                                    <label class="form-label">Total Quantity:</label>
                                    <asp:TextBox ID="TotalQuantity" runat="server" CssClass="form-control w-auto d-inline-block" Text="1.00" ReadOnly="true" Style="background-color: #e0e0e0;" />
                                </div>
                                <div class="col-md-6 text-end">
                                    <label class="form-label">Discount:</label>
                                    <asp:TextBox ID="Discount" runat="server" CssClass="form-control w-auto d-inline-block" Text="0.00" ReadOnly="true" Style="background-color: #e0e0e0;" />
                                    <label class="form-label ms-3">Total:</label>
                                    <asp:TextBox ID="Total" runat="server" CssClass="form-control w-auto d-inline-block" Text="6,300.00" ReadOnly="true" Style="background-color: #e0e0e0;" />
                                </div>
                            </div>
                        </div>

                        <div class="modal-footer">
                            <asp:Button ID="btnRePrint" runat="server" Text="Re Print" CssClass="btn btn-primary" Style="background-color: #B71D1D; border-color: #B71D1D;" />
                            <button type="button" class="btn" data-dismiss="modal" style="background-color: #D9D9D9;">Cancel</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
