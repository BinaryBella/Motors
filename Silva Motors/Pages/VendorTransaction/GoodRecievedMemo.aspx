<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="GoodRecievedMemo.aspx.cs" Inherits="Silva_Motors.Pages.VendorTransaction.GoodRecievedMemo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href='<%= ResolveUrl("~/Content/CustomCSS/VendorTransaction/GoodRecievedMemo.css") %>' />

    <div class="main">
        <div class="container-fluid">
            <div class="row align-items-center">
                <div class="col d-flex justify-content-between align-items-center">
                    <div class="header h4">GOODS RECIEVED MEMO</div>
                    <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#addGRMModal">
                        Add
                    </button>
                </div>
            </div>
        </div>
        <div style="background-color: #f1f1f1; margin-bottom: 10px; padding: 10px;">
            <div class="row">
                <div class="col-md-3">
                    <div class="form-group">
                        <label>Supplier</label>
                        <asp:DropDownList ID="ddlsupplier" CssClass="form-control" runat="server">
                            <asp:ListItem Text="Select Supplier" Value="" />
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="row">
                        <div class="col-12 mb-2">
                            <asp:TextBox ID="txt1" CssClass="form-control" runat="server" />
                        </div>
                        <div class="col-12 mb-2">
                            <asp:TextBox ID="txt2" CssClass="form-control" runat="server" />
                        </div>
                        <div class="col-12 mb-2">
                            <asp:TextBox ID="txt3" CssClass="form-control" runat="server" />
                        </div>
                        <div class="col-12">
                            <asp:TextBox ID="txt4" CssClass="form-control" runat="server" />
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="row">
                        <div class="col-12 mb-2">
                            <label>Mode</label>
                            <asp:DropDownList ID="DropDownList2" CssClass="form-control" runat="server">
                                <asp:ListItem Text="Select Mode" Value="" />
                            </asp:DropDownList>
                        </div>
                        <div class="col-12 mb-2">
                            <asp:TextBox ID="billno" CssClass="form-control" runat="server" Placeholder="Bill Number" />
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row mt-3">
            <div class="col-12">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>CODE</th>
                            <th>ITEM-DESC</th>
                            <th>QTY</th>
                            <th>UNIT PRICE</th>
                            <th>AMOUNT</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>
                                <input type="text" class="form-control" value="A001" /></td>
                            <td>
                                <input type="text" class="form-control" value="Item 1" /></td>
                            <td>
                                <input type="number" class="form-control" value="2" /></td>
                            <td>
                                <input type="number" class="form-control" step="0.01" value="50.00" /></td>
                            <td>
                                <input type="text" class="form-control" value="95.00" readonly /></td>
                        </tr>
                        <tr>
                            <td>
                                <input type="text" class="form-control" value="A002" /></td>
                            <td>
                                <input type="text" class="form-control" value="Item 2" /></td>
                            <td>
                                <input type="number" class="form-control" value="1" /></td>
                            <td>
                                <input type="number" class="form-control" step="0.01" value="30.00" /></td>
                            <td>
                                <input type="text" class="form-control" value="27.00" readonly /></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <%--Table Grid View--%>
        <%--                <div class="row mt-3">
            <div class="col-12">
                <asp:GridView ID="gvGood-returnItems" runat="server" CssClass="table table-bordered"
                    AutoGenerateColumns="false">
                    <Columns>
                        <asp:TemplateField HeaderText="CODE">
                            <ItemTemplate>
                                <asp:TextBox ID="txtCode" runat="server" CssClass="form-control" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ITEM-DESC">
                            <ItemTemplate>
                                <asp:TextBox ID="txtItemDesc" runat="server" CssClass="form-control" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="QTY">
                            <ItemTemplate>
                                <asp:TextBox ID="txtQty" runat="server" CssClass="form-control" TextMode="Number" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="UNIT PRICE">
                            <ItemTemplate>
                                <asp:TextBox ID="txtUnitPrice" runat="server" CssClass="form-control" TextMode="Number" step="0.01" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="AMOUNT">
                            <ItemTemplate>
                                <asp:TextBox ID="txtAmount" runat="server" CssClass="form-control" ReadOnly="true" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>--%>

        <div style="background-color: #f1f1f1; margin-bottom: 10px; padding: 10px;">
            <div class="row mt-3">
                <div class="col-md-2">
                    <div class="form-group">
                        <label>Total Quantity</label>
                        <asp:TextBox ID="txtTotalQUantity" CssClass="form-control" runat="server" />
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label>Total Cost</label>
                        <asp:TextBox ID="txtTotalCost" CssClass="form-control" runat="server" />
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label>Grand Total Rs.</label>
                        <asp:TextBox ID="TextGrandTotal" CssClass="form-control" runat="server" />
                    </div>
                </div>
            </div>
        </div>
        <!-- Add New Good Received Memo Modal -->
        <div class="modal fade" id="addGRMModal" tabindex="-1" aria-labelledby="addGRMModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-xl" style="max-width: 80%; width: 80%;">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addGRMModalLabel">Add New Good Received Memo</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <!-- Add New Item Form -->
                        <!-- Section 1 -->
                        <div class="row mb-3">
                            <h6 class="fw-bold">Item Details</h6>
                            <div class="col-md-2">
                                <div class="mb-2">
                                    <input type="text" class="form-control" id="itemCode" name="itemCode" placeholder="Item Code">
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="mb-2">
                                    <input type="text" class="form-control" id="partNumber" name="partNumber" placeholder="Part Number">
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="mb-2">
                                    <input type="text" class="form-control" id="brand" name="brand" placeholder="Brand">
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="mb-2">
                                    <input type="text" class="form-control" id="oldName" name="oldName" placeholder="Old Name">
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="mb-2">
                                    <input type="text" class="form-control" id="category" name="category" placeholder="Category">
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="mb-2">
                                    <input type="text" class="form-control" id="model" name="model" placeholder="Model">
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="mb-2">
                                    <input type="text" class="form-control" id="description" name="description" placeholder="Description">
                                </div>
                            </div>
                        </div>

                        <!-- Grid View Table -->
                        <div class="table-responsive mb-4">
                            <table class="table table-bordered table-hover" id="grmItemsTable">
                                <thead class="table-light">
                                    <tr>
                                        <th>Code</th>
                                        <th>Part</th>
                                        <th>Brand</th>
                                        <th>Category</th>
                                        <th>Model</th>
                                        <th>Description</th>
                                        <th>Qty</th>
                                        <th>Price</th>
                                        <th>Old Name</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <!-- Table data will be populated dynamically -->
                                </tbody>
                            </table>
                        </div>

                        <!-- Section 2 -->
                        <div class="row mb-3">
                            <h6 class="fw-bold">Quantity and Price</h6>
                            <div class="col-md-4">
                                <div class="mb-2">
                                    <label for="qty" class="form-label">Qty</label>
                                    <input type="number" class="form-control" id="qty" name="qty" min="1" value="1">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="mb-2">
                                    <label for="price" class="form-label">Price</label>
                                    <input type="number" step="0.01" class="form-control" id="price" name="price">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="mb-2">
                                    <label for="amount" class="form-label">Amount</label>
                                    <input type="number" step="0.01" class="form-control" id="amount" name="amount" readonly>
                                </div>
                            </div>
                        </div>

                        <!-- Section 3 -->
                        <div class="row">
                            <h6 class="fw-bold">Pricing Information</h6>
                            <div class="col-md-3">
                                <div class="mb-2">
                                    <label for="wholeSalePrice" class="form-label">Whole Sale Price</label>
                                    <input type="number" step="0.01" class="form-control" id="wholeSalePrice" name="wholeSalePrice">
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="mb-2">
                                    <label for="retailPrice" class="form-label">Retail Price</label>
                                    <input type="number" step="0.01" class="form-control" id="retailPrice" name="retailPrice">
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="mb-2">
                                    <label for="supplierDiscount" class="form-label">Supplier Discount</label>
                                    <input type="number" step="0.01" class="form-control" id="supplierDiscount" name="supplierDiscount" value="0">
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="mb-2">
                                    <label for="sellMargin" class="form-label">Sell Margin</label>
                                    <input type="number" step="0.01" class="form-control" id="sellMargin" name="sellMargin" value="0">
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
</asp:Content>