<%@ Page Title="Retail Customers" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="Silva_Motors.Pages.MasterFiles.RetailCustomer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

    <link rel="stylesheet" href='<%= ResolveUrl("~/Content/CustomCSS/MasterFiles/StockItemCSS.css") %>' />
    <div class="container-fluid main">
        <div class="header">STOCK ITEMS</div>

        <div class="d-flex justify-content-between align-items-center mb-3">
            <asp:Button ID="btnFilters" runat="server" Text="Filters" CssClass="filters-button" />
            <asp:Button ID="Button1" runat="server" Text="LOAD BIN CARD" CssClass="bin-button" />
            <asp:Button ID="btnAdd" runat="server" Text="ADD" CssClass="add-button" />
        </div>

        <div class="table-responsive">
            <asp:GridView ID="gvStockItems" runat="server" AutoGenerateColumns="false"
                CssClass="table table-bordered Items-table" Width="100%">
                <Columns>
                    <asp:BoundField DataField="Code" HeaderText="CODE" />
                    <asp:BoundField DataField="PartNumber" HeaderText="PART NUMBER" />
                    <asp:BoundField DataField="BrandName" HeaderText="BRAND NAME" />
                    <asp:BoundField DataField="Catagory" HeaderText="CATAGORY" />
                    <asp:BoundField DataField="Rack" HeaderText="RACK" />
                    <asp:BoundField DataField="Make" HeaderText="MAKE" />
                    <asp:BoundField DataField="ItemDescription" HeaderText="ITEM DESCRIPTION" />
                    <asp:BoundField DataField="Qty" HeaderText="QTY" />
                    <asp:BoundField DataField="Price" HeaderText="PRICE" />
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

        <!-- Modal for Adding New Item -->
        <div class="modal fade" id="addItemModal" tabindex="-1" role="dialog" aria-labelledby="addItemModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header text-black">
                        <h5 class="modal-title" id="addItemModalLabel">Add Item</h5>
                        <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <!-- Nav tabs for different sections -->
                        <ul class="nav nav-tabs" id="itemDetailTabs" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" id="main-details-tab" data-toggle="tab" href="#mainDetails" role="tab">Main Details</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="other-details-tab" data-toggle="tab" href="#otherDetails" role="tab">Other Details</a>
                            </li>
                        </ul>

                        <!-- Tab Content -->
                        <div class="tab-content mt-3">
                            <!-- Main Details Tab -->
                            <div class="tab-pane fade show active" id="mainDetails" role="tabpanel">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="txtItemCode">Item Code</label>
                                            <asp:TextBox ID="txtItemCode" runat="server" CssClass="form-control" placeholder="Enter Item Code"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="ddlCategory">Category</label>
                                            <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-control">
                                                <asp:ListItem Text="Select Category" Value=""></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="txtPartNumber">Part Number</label>
                                            <asp:TextBox ID="txtPartNumber" runat="server" CssClass="form-control" placeholder="Enter Part Number"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="ddlBrand">Brand</label>
                                            <asp:DropDownList ID="ddlBrand" runat="server" CssClass="form-control">
                                                <asp:ListItem Text="Select Brand" Value=""></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="txtDescription">Description / Country</label>
                                            <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" placeholder="Enter Description"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="txtAvailableQty">Available Qty</label>
                                            <asp:TextBox ID="txtAvailableQty" runat="server" CssClass="form-control" TextMode="Number" placeholder="Enter Available Quantity"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="txtCostPrice">Cost Price</label>
                                            <asp:TextBox ID="txtCostPrice" runat="server" CssClass="form-control" TextMode="Number" step="0.01" placeholder="Enter Cost Price"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="txtRetailPrice">Retail Price</label>
                                            <asp:TextBox ID="txtRetailPrice" runat="server" CssClass="form-control" TextMode="Number" step="0.01" placeholder="Enter Retail Price"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="txtWholesalePrice">Wholesale Price</label>
                                            <asp:TextBox ID="txtWholesalePrice" runat="server" CssClass="form-control" TextMode="Number" step="0.01" placeholder="Enter Wholesale Price"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="txtRackNo">Rack No.</label>
                                            <asp:TextBox ID="txtRackNo" runat="server" CssClass="form-control" placeholder="Enter Rack Number"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Other Details Tab -->
                            <div class="tab-pane fade" id="otherDetails" role="tabpanel">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="txtLastOrderDate">Last Order Date</label>
                                            <asp:TextBox ID="txtLastOrderDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="txtLastOrderQty">Last Order Qty</label>
                                            <asp:TextBox ID="txtLastOrderQty" runat="server" CssClass="form-control" TextMode="Number" placeholder="Enter Last Order Quantity"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="txtLastOrderCost">Last Order Cost</label>
                                            <asp:TextBox ID="txtLastOrderCost" runat="server" CssClass="form-control" TextMode="Number" step="0.01" placeholder="Enter Last Order Cost"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="txtLastOrderVendor">Last Order Vendor</label>
                                            <asp:TextBox ID="txtLastOrderVendor" runat="server" CssClass="form-control" placeholder="Enter Last Order Vendor"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="txtReOrderLevel">Re-Order Level</label>
                                            <asp:TextBox ID="txtReOrderLevel" runat="server" CssClass="form-control" TextMode="Number" placeholder="Enter Re-Order Level"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="txtReOrderQty">Re-Order Qty</label>
                                            <asp:TextBox ID="txtReOrderQty" runat="server" CssClass="form-control" TextMode="Number" placeholder="Enter Re-Order Quantity"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="txtLastInvDate">Last Inv. Date</label>
                                            <asp:TextBox ID="txtLastInvDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="txtLastInvQuantity">Last Inv. Quantity</label>
                                            <asp:TextBox ID="txtLastInvQuantity" runat="server" CssClass="form-control" TextMode="Number" placeholder="Enter Last Inventory Quantity"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="fileAttachImages">Attach Images</label>
                                            <asp:FileUpload ID="fileAttachImages" runat="server" CssClass="form-control-file" AllowMultiple="true" />
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <asp:CheckBox ID="chkReconditionItem" runat="server" CssClass="form-check-input" Text="Recondition Item" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                <div class="modal-footer">
                    <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary" Style="background-color: #B71D1D; border-color: #B71D1D;" />
                    <button type="button" class="btn" data-dismiss="modal" style="background-color: #D9D9D9;">Cancel</button>
                </div>
                </div>
            </div>
        </div>

        <!-- Script to handle modal interactions -->
        <script type="text/javascript">
            $(document).ready(function () {
                // Trigger modal on Add button click
                $("#<%= btnAdd.ClientID %>").click(function (e) {
                    e.preventDefault();
                    $("#addItemModal").modal("show");
                });

                // Validation function
                function validateItemForm() {
                    let isValid = true;

                    // Validate Item Code
                    if ($("#<%= txtItemCode.ClientID %>").val().trim() === "") {
                alert("Item Code is required");
                isValid = false;
            }

            // Validate Category
            if ($("#<%= ddlCategory.ClientID %>").val() === "") {
                alert("Please select a Category");
                isValid = false;
            }

            // Validate Part Number
            if ($("#<%= txtPartNumber.ClientID %>").val().trim() === "") {
                        alert("Part Number is required");
                        isValid = false;
                    }

                    // Add more validations as needed

                    return isValid;
                }
            });
        </script>
</asp:Content>
