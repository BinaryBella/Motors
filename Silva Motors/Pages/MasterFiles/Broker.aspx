﻿<%@ Page Title="Brokers" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="Silva_Motors.Pages.MasterFiles.Broker" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

    <link rel="stylesheet" href='<%= ResolveUrl("~/Content/CustomCSS/MasterFiles/BrokerCSS.css") %>' />
    <div class="container-fluid main">
        <div class="header">BROKERS</div>

        <div class="d-flex justify-content-between mb-3">
            <asp:Button ID="btnFilters" runat="server" Text="Filters" CssClass="filters-button" />
            <asp:Button ID="btnAdd" runat="server" Text=" ADD" CssClass="add-button" />
        </div>

        <div class="table-responsive">
            <asp:GridView ID="gvBrokers" runat="server" AutoGenerateColumns="false"
                CssClass="table table-bordered customers-table" Width="100%">
                <Columns>
                    <asp:BoundField DataField="Code" HeaderText="CODE" />
                    <asp:BoundField DataField="Name" HeaderText="NAME" />
                    <asp:BoundField DataField="Address" HeaderText="ADDRESS" />
                    <asp:BoundField DataField="Telephone" HeaderText="TELEPHONE" />
                    <asp:BoundField DataField="TotalTransactions" HeaderText="TOTAL TRANSACTIONS" />
                    <asp:BoundField DataField="TotalCommison" HeaderText="TOTAL COMMISON" />
                    <asp:BoundField DataField="TotalPaid" HeaderText="TOTAL PAID" />
                    <asp:BoundField DataField="TotalCommisonReturn" HeaderText="TOTAL COMMISON RETURN" />
                    <asp:BoundField DataField="DueAmount" HeaderText="DUE AMOUNT" />
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

    <%-- Modal Markup --%>
    <div class="modal fade" id="brokerModal" tabindex="-1" role="dialog" aria-labelledby="brokerModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="brokerModalLabel">Add Broker</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <%-- Removed the form tag here --%>
                    <div class="form-group row">
                        <label for="txtCode" class="col-sm-3 col-form-label">Code</label>
                        <div class="col-sm-9">
                            <asp:TextBox ID="txtCode" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="txtName" class="col-sm-3 col-form-label">Name</label>
                        <div class="col-sm-9">
                            <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="txtAddress" class="col-sm-3 col-form-label">Address</label>
                        <div class="col-sm-9">
                            <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="txtMobile" class="col-sm-3 col-form-label">Mobile No</label>
                        <div class="col-sm-9">
                            <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="txtAltPhone" class="col-sm-3 col-form-label">Alt. Phone</label>
                        <div class="col-sm-9">
                            <asp:TextBox ID="txtAltPhone" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="nic" class="col-sm-3 col-form-label">NIC</label>
                        <div class="col-sm-9">
                            <asp:TextBox ID="nic" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="txtEmail" class="col-sm-3 col-form-label">E-mail</label>
                        <div class="col-sm-9">
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="txtCompanyContact" class="col-sm-3 col-form-label">If Company Contact Name</label>
                        <div class="col-sm-9">
                            <asp:TextBox ID="txtCompanyContact" runat="server" CssClass="form-control"></asp:TextBox>
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

    <script type="text/javascript">
        $(document).ready(function () {
            // Attach click event to the Add button
            $("#<%= btnAdd.ClientID %>").click(function (e) {
                e.preventDefault();
                $("#brokerModal").modal("show");
            });

            // Handle save button click
            $("#<%= btnSave.ClientID %>").click(function (e) {
                // Prevent postback for this example - in real application you'll handle server-side validation
                e.preventDefault();

                // Validate form
                if (validateForm()) {
                    // Here you would typically make an AJAX call or allow postback to server
                    // For demo purposes, we'll just close the modal and show success message
                    $("#brokerModal").modal("hide");
                    alert("Customer data saved successfully!");
                }
            });
        });

        function validateForm() {
            let isValid = true;

            // Basic validation example - add more as needed
            if ($("#<%= txtName.ClientID %>").val() === "") {
                alert("Customer name is required");
                isValid = false;
            }

            if ($("#<%= txtMobile.ClientID %>").val() === "") {
                alert("Mobile number is required");
                isValid = false;
            }

            return isValid;
        }
    </script>
</asp:Content>
