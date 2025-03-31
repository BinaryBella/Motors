<%@ Page Title="Customer Goods Return" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CustomerGoodsReturn.aspx.cs" Inherits="Silva_Motors.Pages.CustomerTransaction.CustomerGoodsReturn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href='<%= ResolveUrl("~/Content/CustomCSS/CustomerTransaction/CustomerGoodsReturn.css") %>' />

    <div class="main">
        <div class="container-fluid">
            <div class="row align-items-center">
                <div class="col d-flex justify-content-between align-items-center">
                    <div class="header h4">CUSTOMER GOODS RETURN</div>
                    <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#addGrnModal">
                        Add
                    </button>
                </div>
            </div>
        </div>
        <div style="background-color: #f1f1f1; margin-bottom: 10px; padding: 10px;">
            <div class="row">
                <div class="col-md-3">
                    <div class="form-group">
                        <label>Invoice To</label>
                        <asp:DropDownList ID="ddlgoodsreturnTo" CssClass="form-control" runat="server">
                            <asp:ListItem Text="Select Customer" Value="" />
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="row">
                        <div class="col-12 mb-2">
                            <asp:TextBox ID="txtCustomerName" CssClass="form-control" runat="server" Placeholder="Customer Name" />
                        </div>
                        <div class="col-12 mb-2">
                            <asp:TextBox ID="txtAddress" CssClass="form-control" runat="server" Placeholder="Address" />
                        </div>
                        <div class="col-12 mb-2">
                            <asp:TextBox ID="txtContact" CssClass="form-control" runat="server" Placeholder="Contact" />
                        </div>
                        <div class="col-12">
                            <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server" Placeholder="Email" />
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="row">
                        <div class="col-12 mb-2">
                            <asp:TextBox ID="salesRep1" CssClass="form-control" runat="server" Placeholder="sales Rep 1" />
                        </div>
                        <div class="col-12 mb-2">
                            <asp:TextBox ID="salesRep2" CssClass="form-control" runat="server" Placeholder="sales Rep 2" />
                        </div>
                        <div class="col-12">
                            <asp:TextBox ID="salesRep3" CssClass="form-control" runat="server" Placeholder="sales Rep 3" />
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group mb-2">
                        <asp:DropDownList ID="ddlMode" CssClass="form-control" runat="server">
                            <asp:ListItem Text="Invoice No" Value="" />
                        </asp:DropDownList>
                    </div>
                    <div class="form-group mb-2">
                        <asp:TextBox ID="txtInvoiceDate" CssClass="form-control" runat="server" TextMode="Date" Placeholder="Date" />
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server" TextMode="Date" Placeholder="Date" />
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
                <div class="col-md-2">
                    <div class="form-group">
                        <label>Discount</label>
                        <asp:TextBox ID="txtDiscount" CssClass="form-control" runat="server" />
                    </div>
                </div>
                <div class="col-md-2">
                    <div class="form-group">
                        <label>Disc. Amount</label>
                        <asp:TextBox ID="txtDiscAmount" CssClass="form-control" runat="server" />
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label>Total</label>
                        <asp:TextBox ID="txtTotal" CssClass="form-control" runat="server" />
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
    </div>

    <!-- Add New GRN Modal -->
    <div class="modal fade" id="addGrnModal" tabindex="-1" aria-labelledby="addGrnModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-xl" style="max-width: 80%; width: 80%;">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addGrnModalLabel">Add New GRN</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <!-- Add New Item Form -->
                    <!-- Section 1 -->
                    <div class="row mb-3">
                        <h6 class="fw-bold">Item Details</h6>
                        <div class="col-md-4">
                            <div class="mb-2">
                                <input type="text" class="form-control" id="itemCode" name="itemCode" placeholder="Item Code">
                            </div>
                        </div>
                        <div class="col-md-8">
                            <div class="mb-2">
                                <input class="form-control" id="description" name="description" rows="2" placeholder="Description">
                            </div>
                        </div>
                        <div class="table-responsive mb-4">
                            <table class="table table-bordered table-hover" id="grnItemsTable">
                                <thead class="table-light">
                                    <tr>
                                        <th>Code</th>
                                        <th>Description</th>
                                        <th>Qty</th>
                                        <th>Price</th>
                                        <th>Amount</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <!-- Table data will be populated dynamically -->
                                </tbody>
                            </table>
                        </div>
                        <div class="col-md-4">
                            <div class="mb-2">
                                <label for="quentity" class="form-label">Quantity</label>
                                <input type="text" class="form-control" id="quentity" name="quentity">
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="mb-2">
                                <label for="unitPrice" class="form-label">Unit Price</label>
                                <input type="text" class="form-control" id="unitPrice" name="unitPrice">
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="mb-2">
                                <label for="amount" class="form-label">Amount</label>
                                <input type="text" class="form-control" id="amount" name="amount">
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
</asp:Content>