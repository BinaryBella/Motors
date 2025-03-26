<%@ Page Title="Retail branchs" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="Silva_Motors.Pages.MasterFiles.BankBranch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

    <link rel="stylesheet" href='<%= ResolveUrl("~/Content/CustomCSS/MasterFiles/BranchCSS.css") %>' />
    <div class="container-fluid main">
        <div class="header">BRANCHES OF THE BANKS</div>

        <div class="d-flex justify-content-between mb-3">
            <asp:Button ID="btnFilters" runat="server" Text="Filters" CssClass="filters-button" />
            <asp:Button ID="btnAdd" runat="server" Text=" ADD" CssClass="add-button" />
        </div>

        <div class="table-responsive">
            <asp:GridView ID="gvbranchs" runat="server" AutoGenerateColumns="false"
                CssClass="table table-bordered branch-table" Width="100%">
                <Columns>
                    <asp:BoundField DataField="BankBranchNo" HeaderText="BRANCH & BANK NO" />
                    <asp:BoundField DataField="BranchName" HeaderText="BRANCH NAME" />
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

    <%-- Modal Markup --%>
    <div class="modal fade" id="branchModal" tabindex="-1" role="dialog" aria-labelledby="branchModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="branchModalLabel">Add branch</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group row">
                        <label for="BankBranchNo" class="col-sm-3 col-form-label">Bank & Branch No</label>
                        <div class="col-sm-9">
                            <asp:TextBox ID="BankBranchNo" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="branchName" class="col-sm-3 col-form-label">Branch Name</label>
                        <div class="col-sm-9">
                            <asp:TextBox ID="branchName" runat="server" CssClass="form-control"></asp:TextBox>
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
    <script type="text/javascript">
        $(document).ready(function () {
            // Attach click event to the Add button
            $("#<%= btnAdd.ClientID %>").click(function (e) {
                e.preventDefault();
                $("#branchModal").modal("show");
            });

            // Handle save button click
            $("#<%= btnSave.ClientID %>").click(function (e) {
                // Prevent postback for this example - in real application you'll handle server-side validation
                e.preventDefault();

                // Validate form
                if (validateForm()) {
                    // Here you would typically make an AJAX call or allow postback to server
                    // For demo purposes, we'll just close the modal and show success message
                    $("#customerModal").modal("hide");
                    alert("Customer data saved successfully!");
                }
            });
        });
    </script>
</asp:Content>