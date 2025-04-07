<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="GRMReturn.aspx.cs" Inherits="Silva_Motors.Pages.VendorTransaction.GRMReturn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href='<%= ResolveUrl("~/Content/CustomCSS/CustomerTransaction/CustomerGoodsReturn.css") %>' />

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Bootstrap JS (requires Popper.js) -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <div class="main">
        <div class="container-fluid">
            <div class="row align-items-center">
                <div class="col d-flex justify-content-between align-items-center">
                    <div class="header h4">GRM RETURN</div>
                    <asp:Button ID="btnAdd" runat="server" Text="Add" 
                        CssClass="btn btn-danger" 
                        OnClientClick="$('#addGrmReturnModal').modal('show'); return false;" />
                </div>
                </div>
            </div>
        </div>
        <div style="background-color: #f1f1f1; margin-bottom: 10px; padding: 10px;">
            <div class="row">
                <div class="col-md-3">
                    <div class="form-group">
                        <label for="ddlVendor">Vendor</label>
                        <asp:DropDownList ID="ddlVendor" CssClass="form-control" runat="server">
                            <asp:ListItem Text="Select Vendor" Value="" />
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="row">
                        <div class="col-12 mb-2">
                            <asp:TextBox ID="txtCustomerName" CssClass="form-control" runat="server" Placeholder="Customer Name" />
                        </div>
                        <div class="col-12 mb-2">
                            <asp:TextBox ID="txt1" CssClass="form-control" runat="server" />
                        </div>
                        <div class="col-12 mb-2">
                            <asp:TextBox ID="txt2" CssClass="form-control" runat="server" />
                        </div>
                        <div class="col-12">
                            <asp:TextBox ID="txt3" CssClass="form-control" runat="server" />
                        </div>
                        <div class="col-12">
                            <asp:TextBox ID="txt4" CssClass="form-control" runat="server" />
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group mb-2">
                        <asp:DropDownList ID="ddlGRMCode" CssClass="form-control" runat="server">
                            <asp:ListItem Text="GRM/Item Code" Value="" />
                        </asp:DropDownList>
                    </div>
                    <div class="form-group mb-2">
                        <asp:TextBox ID="txtGRMDate" CssClass="form-control" runat="server" TextMode="Date" Placeholder="GRM Date" />
                    </div>
                </div>
            </div>
        </div>
  <div class="row mt-3">
            <div class="col-12">
                <asp:GridView ID="gvItems" runat="server" CssClass="good-return-items-table table-bordered">
                    <Columns>
                        <asp:TemplateField HeaderText="CODE">
                            <ItemTemplate>
                                <asp:TextBox ID="txtCode" runat="server" CssClass="form-control" Text="A001" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ITEM-DESC">
                            <ItemTemplate>
                                <asp:TextBox ID="txtItemDesc" runat="server" CssClass="form-control" Text="Item 1" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="QTY">
                            <ItemTemplate>
                                <asp:TextBox ID="txtQty" runat="server" CssClass="form-control" TextMode="Number" Text="2" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="UNIT PRICE">
                            <ItemTemplate>
                                <asp:TextBox ID="txtUnitPrice" runat="server" CssClass="form-control" TextMode="Number" Step="0.01" Text="50.00" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="AMOUNT">
                            <ItemTemplate>
                                <asp:TextBox ID="txtAmount" runat="server" CssClass="form-control" ReadOnly="true" Text="95.00" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>

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

    <!-- Add New GRN Modal -->
    <div class="modal fade" id="addGrmReturnModal" tabindex="-1" aria-labelledby="addGrmReturnModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-xl" style="max-width: 80%; width: 80%;">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addGrmReturnModalLabel">Add New GRM Return</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row mb-3">
                        <h6 class="fw-bold">Item Details</h6>
                        <div class="col-md-4">
                            <div class="mb-2">
                                <asp:TextBox ID="itemCode" runat="server" CssClass="form-control" Placeholder="Item Code" />
                            </div>
                        </div>
                        <div class="col-md-8">
                            <div class="mb-2">
                                <asp:TextBox ID="description" runat="server" CssClass="form-control" TextMode="MultiLine" Placeholder="Description" />
                            </div>
                        </div>
                    </div>
                    <div class="table-responsive mb-4">
                        <asp:GridView ID="gvModalTable" runat="server" CssClass="good-return-items-table table-bordered table-hover">
                            <Columns>
                                <asp:TemplateField HeaderText="Code">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txtModalCode" runat="server" CssClass="form-control" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Description">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txtModalDesc" runat="server" CssClass="form-control" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Qty">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txtModalQty" runat="server" CssClass="form-control" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Price">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txtModalPrice" runat="server" CssClass="form-control" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <div class="mb-2">
                                <label for="quantity" class="form-label">Quantity</label>
                                <asp:TextBox ID="quentity" runat="server" CssClass="form-control" />
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="mb-2">
                                <label for="unitPrice" class="form-label">Unit Price</label>
                                <asp:TextBox ID="unitPrice" runat="server" CssClass="form-control" />
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="mb-2">
                                <label for="amount" class="form-label">Amount</label>
                                <asp:TextBox ID="amount" runat="server" CssClass="form-control" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary" OnClientClick="return validateForm();" />
                    <button type="button" class="btn" data-bs-dismiss="modal" style="background-color: #D9D9D9;">Cancel</button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
