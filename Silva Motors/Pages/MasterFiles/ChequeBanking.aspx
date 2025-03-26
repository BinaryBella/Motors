<%@ Page Title="Retail branchs" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="Silva_Motors.Pages.MasterFiles.ChequeBanking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

    <link rel="stylesheet" href='<%= ResolveUrl("~/Content/CustomCSS/MasterFiles/ChequeBankingCSS.css") %>' />
    <div class="container-fluid main">
        <div class="header">CUSTOMER CHEQUE BANKING</div>

        <div class="filtering-section">
            <!-- Filtering Section -->
            <div class="row filter-section mb-3">
                <div class="col-md-3">
                    <select class="form-control" id="ddlAccountNumber">
                        <option value="">Select Account Number</option>
                        <option value="1">Account 1001</option>
                        <option value="2">Account 1002</option>
                        <option value="3">Account 1003</option>
                    </select>
                </div>
                <div class="col-md-3">
                    <input type="text" class="form-control" id="txtAccountName" placeholder="Account Name">
                </div>
                <div class="col-md-3">
                    <select class="form-control" id="ddlBankName">
                        <option value="">Select Bank Name</option>
                        <option value="1">Bank A</option>
                        <option value="2">Bank B</option>
                        <option value="3">Bank C</option>
                    </select>
                </div>
                <div class="col-md-3">
                    <select class="form-control" id="ddlBranch">
                        <option value="">Select Branch</option>
                        <option value="1">Main Branch</option>
                        <option value="2">Downtown Branch</option>
                        <option value="3">Suburb Branch</option>
                    </select>
                </div>
            </div>

            <div class="row filter-section mb-3">
                <div class="col-md-3">
                    <input type="date" class="form-control" id="txtFromDate" placeholder="From Date">
                </div>
                <div class="col-md-3">
                    <input type="date" class="form-control" id="txtToDate" placeholder="To Date">
                </div>
                <div class="col-md-3">
                    <input type="number" class="form-control" id="txtMinAmount" placeholder="Minimum Amount">
                </div>
                <div class="col-md-3">
                    <input type="number" class="form-control" id="txtMaxAmount" placeholder="Maximum Amount">
                </div>
            </div>

            <div class="row mb-3">
                <div class="col-md-12">
                    <button id="btnApplyFilter" class="btn text-white" style="background-color: #dc3545;">Apply Filter</button>
                    <button id="btnClearFilter" class="btn text-white" style="background-color: #929292;">Clear Filter</button>
                </div>
            </div>

            <!-- Totals Section -->
            <div class="row mb-3">
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <h6 class="card-title">Total Cheques</h6>
                            <div class="row">
                                <div class="col-md-6">
                                    <strong>Total Amount:</strong>
                                    <span id="lblTotalChequeAmount">0.00</span>
                                </div>
                                <div class="col-md-6">
                                    <strong>Total Count:</strong>
                                    <span id="lblTotalChequeCount">0</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <h6 class="card-title">Selected Cheques</h6>
                            <div class="row">
                                <div class="col-md-6">
                                    <strong>Selected Amount:</strong>
                                    <span id="lblSelectedChequeAmount">0.00</span>
                                </div>
                                <div class="col-md-6">
                                    <strong>Selected Count:</strong>
                                    <span id="lblSelectedChequeCount">0</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="table-responsive">
            <asp:GridView ID="gvbranchs" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered cheque-banking-table" Width="100%">
                <Columns>
                    <asp:BoundField DataField="BankName" HeaderText="BANK NAME" />
                    <asp:BoundField DataField="Branch" HeaderText="BRANCH" />
                    <asp:BoundField DataField="ChequeId" HeaderText="CHEQUE ID" />
                    <asp:BoundField DataField="Amount" HeaderText="AMOUNT" />
                    <asp:BoundField DataField="ReceiptId" HeaderText="RECEIPT ID" />
                    <asp:BoundField DataField="Account" HeaderText="ACCOUNT" />
                    <asp:BoundField DataField="ChequeNo" HeaderText="CHEQUE NO" />
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

        <div class="d-flex justify-content-between mt-3">
            <div class="pagination">
                <a href="#">1</a>
                <a href="#" class="active">2</a>
                <a href="#">3</a>
                <a href="#">4</a>
                <a href="#">5</a>
            </div>
        </div>
    </div>

    <script>
        $(document).ready(function () {
            // Select All Checkbox
            $('#chkSelectAll').change(function () {
                $('.chkSelect').prop('checked', $(this).prop('checked'));
                updateSelectedTotals();
            });

            // Individual Checkbox
            $('.chkSelect').change(function () {
                $('#chkSelectAll').prop('checked', $('.chkSelect:checked').length === $('.chkSelect').length);
                updateSelectedTotals();
            });

            // Apply Filter
            $('#btnApplyFilter').click(function () {
                filterTable();
            });

            // Clear Filter
            $('#btnClearFilter').click(function () {
                clearFilters();
            });

            function filterTable() {
                var accountNumber = $('#ddlAccountNumber').val();
                var accountName = $('#txtAccountName').val().toLowerCase();
                var bankName = $('#ddlBankName').val();
                var branch = $('#ddlBranch').val();
                var fromDate = $('#txtFromDate').val();
                var toDate = $('#txtToDate').val();
                var minAmount = $('#txtMinAmount').val();
                var maxAmount = $('#txtMaxAmount').val();

                var totalAmount = 0;
                var totalCount = 0;

                $('#gvbranchs tbody tr').each(function () {
                    var show = true;
                    var amount = parseFloat($(this).find('td:eq(4)').text());
                    var rowAccountNumber = $(this).find('td:eq(6)').text();
                    var rowAccountName = $(this).find('td:eq(0)').text().toLowerCase();
                    var rowBankName = $(this).find('td:eq(0)').text();
                    var rowBranch = $(this).find('td:eq(1)').text();

                    // Apply filters
                    if (accountNumber && rowAccountNumber !== accountNumber) show = false;
                    if (accountName && !rowAccountName.includes(accountName)) show = false;
                    if (bankName && rowBankName !== bankName) show = false;
                    if (branch && rowBranch !== branch) show = false;

                    // Amount filter
                    if (minAmount && amount < parseFloat(minAmount)) show = false;
                    if (maxAmount && amount > parseFloat(maxAmount)) show = false;

                    if (show) {
                        $(this).show();
                        totalAmount += amount;
                        totalCount++;
                    } else {
                        $(this).hide();
                    }
                });

                // Update totals
                $('#lblTotalChequeAmount').text(totalAmount.toFixed(2));
                $('#lblTotalChequeCount').text(totalCount);
            }

            function clearFilters() {
                $('#ddlAccountNumber').val('');
                $('#txtAccountName').val('');
                $('#ddlBankName').val('');
                $('#ddlBranch').val('');
                $('#txtFromDate').val('');
                $('#txtToDate').val('');
                $('#txtMinAmount').val('');
                $('#txtMaxAmount').val('');

                $('#gvbranchs tbody tr').show();

                // Reset totals
                var totalAmount = 0;
                var totalCount = 0;
                $('#gvbranchs tbody tr').each(function () {
                    var amount = parseFloat($(this).find('td:eq(4)').text());
                    totalAmount += amount;
                    totalCount++;
                });

                $('#lblTotalChequeAmount').text(totalAmount.toFixed(2));
                $('#lblTotalChequeCount').text(totalCount);
            }

            function updateSelectedTotals() {
                var selectedAmount = 0;
                var selectedCount = 0;

                $('.chkSelect:checked').each(function () {
                    var amount = parseFloat($(this).closest('tr').find('td:eq(4)').text());
                    selectedAmount += amount;
                    selectedCount++;
                });

                $('#lblSelectedChequeAmount').text(selectedAmount.toFixed(2));
                $('#lblSelectedChequeCount').text(selectedCount);
            }

            // Initial total calculation
            var initialTotalAmount = 0;
            $('#gvbranchs tbody tr').each(function () {
                initialTotalAmount += parseFloat($(this).find('td:eq(4)').text());
            });
            $('#lblTotalChequeAmount').text(initialTotalAmount.toFixed(2));
            $('#lblTotalChequeCount').text($('#gvbranchs tbody tr').length);
        });
    </script>
</asp:Content>
