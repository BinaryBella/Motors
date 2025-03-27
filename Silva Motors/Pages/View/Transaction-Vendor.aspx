<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Transaction-Vendor.aspx.cs" Inherits="Silva_Motors.Pages.View.Transaction_Vendor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

    <link rel="stylesheet" href='<%= ResolveUrl("~/Content/CustomCSS/View/TransactionCSS.css") %>' />


    <div class="container-fluid main">

        <div class="header">VENDOR TRANSACTIONS</div>

        <div class="container-fluid">
            <div class="filter-section">
                <div class="row">
                    <!-- Date Range Inputs -->
                    <div class="col-md-4 mb-3">
                        <div class="date-container">
                            <div class="date-input">
                                <label for="startDate">Start Date</label>
                                <input type="text" class="form-control" id="startDate" placeholder="mm/dd/yyyy">
                            </div>
                            <div class="date-input">
                                <label for="endDate">End Date</label>
                                <input type="text" class="form-control" id="endDate" placeholder="mm/dd/yyyy">
                            </div>
                        </div>
                    </div>

                    <!-- View Options -->
                    <div class="col-md-4 mb-3">
                        <div class="view-options-container">
                            <div class="view-option-row">
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="viewOption" id="viewRefNo">
                                    <label class="form-check-label" for="viewRefNo">
                                        View Selected Ref/No
                                    </label>
                                    <input type="text" class="form-control" placeholder="Enter Ref/No">
                                </div>
                            </div>
                            <div class="view-option-row">
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="viewOption" id="viewTrxType">
                                    <label class="form-check-label" for="viewTrxType">
                                        View Selected Tx Type
                                    </label>
                                    <input type="text" class="form-control" placeholder="Enter Transaction Type">
                                </div>
                            </div>
                            <div class="view-option-row">
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="viewOption" id="viewAllTrx" checked>
                                    <label class="form-check-label" for="viewAllTrx">
                                        View All Transaction
                                    </label>
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
                    <select id="statusFilter" class="filter-input" onchange="filterTable()">
                        <option value="">All</option>
                        <option value="active">Active</option>
                        <option value="inactive">Inactive</option>
                    </select>
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
                    <asp:TemplateField HeaderText="STATUS">
                        <HeaderTemplate>
                            Status
                    <select id="statusFilter" class="filter-input" onchange="filterTable()">
                        <option value="">All</option>
                        <option value="active">Active</option>
                        <option value="inactive">Inactive</option>
                    </select>
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
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#cashInvoiceModal">
            View Good Received Memo
        </button>

        <!-- Cash Invoice Modal -->
        <div class="modal fade" id="cashInvoiceModal" tabindex="-1" aria-labelledby="cashInvoiceModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg cash-invoice-modal">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="cashInvoiceModalLabel">VIEW GOOD RECIEVED MEMO</h5>
                        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label class="form-label">TO</label>
                                <input type="text" class="form-control mb-2" readonly style="background-color: #e0e0e0;">
                                <input type="text" class="form-control mb-2" readonly style="background-color: #e0e0e0;">
                                <input type="text" class="form-control mb-2" readonly style="background-color: #e0e0e0;">
                                <input type="text" class="form-control mb-2" readonly style="background-color: #e0e0e0;">
                                <input type="text" class="form-control mb-2" readonly style="background-color: #e0e0e0;">
                            </div>
                            <div class="col-md-6 text-end">
                                <div class="mb-2">
                                    Date:
                                    <input type="text" class="form-control d-inline-block w-auto" value="2025-03-26" readonly style="background-color: #e0e0e0;">
                                </div>
                                <div class="mb-2">
                                    Time:
                                    <input type="text" class="form-control d-inline-block w-auto" value="9:27:59 AM" readonly style="background-color: #e0e0e0;">
                                </div>
                                <div class="mb-2">
                                    User:
                                    <input type="text" class="form-control d-inline-block w-auto" value="0003" readonly style="background-color: #e0e0e0;">
                                </div>
                                <div class="mb-2">
                                    TRX No:
                                    <input type="text" class="form-control d-inline-block w-auto" value="CAS-A262937" readonly style="background-color: #e0e0e0;">
                                </div>
                                <div class="mb-2">
                                    Details:
                                    <input type="text" class="form-control d-inline-block w-auto" value="" readonly style="background-color: #e0e0e0;">
                                </div>
                            </div>
                        </div>

                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>Code</th>
                                    <th>Item Description</th>
                                    <th>Quantity</th>
                                    <th>Unit Price</th>
                                    <th>Amount</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>OFLT-030</td>
                                    <td>C608. TOYOTA OIL/FILTER/DYNAW-JAPAN</td>
                                    <td>1.00</td>
                                    <td>6,300.00</td>
                                    <td>6,300.00</td>
                                </tr>
                            </tbody>
                        </table>

                        <div class="row p-3" style="background-color: #000000; color: #ffffff;">
                            <div class="col-md-6">
                                <label class="form-label">Total Quantity:</label>
                                <input type="text" class="form-control w-auto d-inline-block" value="1.00" readonly style="background-color: #e0e0e0;">
                            </div>
                            <div class="col-md-6 text-end">
                                <label class="form-label">Discount:</label>
                                <input type="text" class="form-control w-auto d-inline-block" value="0.00" readonly style="background-color: #e0e0e0;">
                                <label class="form-label ms-3">Total:</label>
                                <input type="text" class="form-control w-auto d-inline-block" value="6,300.00" readonly style="background-color: #e0e0e0;">
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
</asp:Content>
