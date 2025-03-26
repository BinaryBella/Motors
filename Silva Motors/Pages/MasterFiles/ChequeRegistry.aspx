<%@ Page Title="Retail branchs" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="Silva_Motors.Pages.MasterFiles.ChequeRegistry" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

    <link rel="stylesheet" href='<%= ResolveUrl("~/Content/CustomCSS/MasterFiles/ChequeRegistryCSS.css") %>' />
    <div class="container-fluid main">
        <div class="header">CUSTOMER CHEQUE REGISTRY</div>

        <div class="d-flex justify-content-between mb-3">
            <asp:Button ID="btnFilters" runat="server" Text="Filters" CssClass="filters-button" />
        </div>

        <div class="table-responsive">
            <asp:GridView ID="gvbranchs" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered bank-table" Width="100%">
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
</asp:Content>