<%@ Page Title="Goods Received Memo" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="GoodReceivedMemo.aspx.cs" Inherits="Silva_Motors.Pages.VendorTransaction.GoodReceivedMemo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href='<%= ResolveUrl("~/Content/CustomCSS/VendorTransaction/GoodRecievedMemo.css") %>' />

    <div class="main">
        <div class="container-fluid">
            <div class="row align-items-center">
                <div class="col d-flex justify-content-between align-items-center">
                    <div class="header h4">GOODS RECEIVED MEMO</div>
                    <asp:Button ID="btnOpenModal" runat="server" Text="Add" 
                        CssClass="btn btn-danger" 
                        OnClientClick="$('#pnlGRMModal').modal('show'); return false;" />
                </div>
            </div>
        </div>
        <div style="background-color: #f1f1f1; margin-bottom: 10px; padding: 10px;">
            <div class="row">
                <div class="col-md-3">
                    <div class="form-group">
                        <asp:Label ID="lblSupplier" runat="server" Text="Supplier" AssociatedControlID="ddlSupplier"></asp:Label>
                        <asp:DropDownList ID="ddlSupplier" CssClass="form-control" runat="server">
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
                            <asp:Label ID="lblMode" runat="server" Text="Mode" AssociatedControlID="ddlMode"></asp:Label>
                            <asp:DropDownList ID="ddlMode" CssClass="form-control" runat="server">
                                <asp:ListItem Text="Select Mode" Value="" />
                            </asp:DropDownList>
                        </div>
                        <div class="col-12 mb-2">
                            <asp:TextBox ID="txtBillNo" CssClass="form-control" runat="server" placeholder="Bill Number" />
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%--Table Grid View--%>
        <div class="row mt-3">
            <div class="col-12">
                <asp:GridView ID="gvGoodReceivedItems" runat="server" CssClass="table table-bordered good-return-items-table"
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
        </div>

        <div style="background-color: #f1f1f1; margin-bottom: 10px; padding: 10px;">
            <div class="row mt-3">
                <div class="col-md-2">
                    <div class="form-group">
                        <asp:Label ID="lblTotalQuantity" runat="server" Text="Total Quantity" AssociatedControlID="txtTotalQuantity"></asp:Label>
                        <asp:TextBox ID="txtTotalQuantity" CssClass="form-control" runat="server" ReadOnly="true" />
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <asp:Label ID="lblTotalCost" runat="server" Text="Total Cost" AssociatedControlID="txtTotalCost"></asp:Label>
                        <asp:TextBox ID="txtTotalCost" CssClass="form-control" runat="server" ReadOnly="true" />
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <asp:Label ID="lblGrandTotal" runat="server" Text="Grand Total Rs." AssociatedControlID="txtGrandTotal"></asp:Label>
                        <asp:TextBox ID="txtGrandTotal" CssClass="form-control" runat="server" ReadOnly="true" />
                    </div>
                </div>
            </div>
        </div>

        <!-- Add New Good Received Memo Modal -->
        <asp:Panel ID="pnlGRMModal" runat="server" CssClass="modal fade" ClientIDMode="Static">
            <div class="modal-dialog modal-xl" style="max-width: 80%; width: 80%;">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addGRMModalLabel">Add New Good Received Memo</h5>
                        <asp:Button ID="btnCloseModal" runat="server" CssClass="btn-close" OnClientClick="$('#yourModalId').modal('hide'); return false;" UseSubmitBehavior="false" />
                    </div>
                    <div class="modal-body">
                        <!-- Add New Item Form -->
                        <!-- Section 1 -->
                        <div class="row mb-3">
                            <h6 class="fw-bold">Item Details</h6>
                            <div class="col-md-2">
                                <div class="mb-2">
                                    <asp:TextBox ID="txtItemCode" runat="server" CssClass="form-control" placeholder="Item Code"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="mb-2">
                                    <asp:TextBox ID="txtPartNumber" runat="server" CssClass="form-control" placeholder="Part Number"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="mb-2">
                                    <asp:TextBox ID="txtBrand" runat="server" CssClass="form-control" placeholder="Brand"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="mb-2">
                                    <asp:TextBox ID="txtOldName" runat="server" CssClass="form-control" placeholder="Old Name"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="mb-2">
                                    <asp:TextBox ID="txtCategory" runat="server" CssClass="form-control" placeholder="Category"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="mb-2">
                                    <asp:TextBox ID="txtModel" runat="server" CssClass="form-control" placeholder="Model"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="mb-2">
                                    <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" placeholder="Description"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <!-- Grid View Table -->
                        <div class="table-responsive mb-4">
                            <asp:GridView ID="gvModalItems" runat="server" CssClass="table table-bordered table-hover" AutoGenerateColumns="false">
                                <Columns>
                                    <asp:BoundField DataField="Code" HeaderText="Code" />
                                    <asp:BoundField DataField="Part" HeaderText="Part" />
                                    <asp:BoundField DataField="Brand" HeaderText="Brand" />
                                    <asp:BoundField DataField="Category" HeaderText="Category" />
                                    <asp:BoundField DataField="Model" HeaderText="Model" />
                                    <asp:BoundField DataField="Description" HeaderText="Description" />
                                    <asp:BoundField DataField="Qty" HeaderText="Qty" />
                                    <asp:BoundField DataField="Price" HeaderText="Price" />
                                    <asp:BoundField DataField="OldName" HeaderText="Old Name" />
                                </Columns>
                            </asp:GridView>
                        </div>

                        <!-- Section 2 -->
                        <div class="row mb-3">
                            <h6 class="fw-bold">Quantity and Price</h6>
                            <div class="col-md-4">
                                <div class="mb-2">
                                    <asp:Label ID="lblQty" runat="server" Text="Qty" AssociatedControlID="txtQty"></asp:Label>
                                    <asp:TextBox ID="txtQty" runat="server" CssClass="form-control" TextMode="Number" min="1" Text="1"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="mb-2">
                                    <asp:Label ID="lblPrice" runat="server" Text="Price" AssociatedControlID="txtPrice"></asp:Label>
                                    <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control" TextMode="Number" step="0.01" AutoPostBack="true" ></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="mb-2">
                                    <asp:Label ID="lblAmount" runat="server" Text="Amount" AssociatedControlID="txtAmount"></asp:Label>
                                    <asp:TextBox ID="txtAmount" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <!-- Section 3 -->
                        <div class="row">
                            <h6 class="fw-bold">Pricing Information</h6>
                            <div class="col-md-3">
                                <div class="mb-2">
                                    <asp:Label ID="lblWholesalePrice" runat="server" Text="Whole Sale Price" AssociatedControlID="txtWholesalePrice"></asp:Label>
                                    <asp:TextBox ID="txtWholesalePrice" runat="server" CssClass="form-control" TextMode="Number" step="0.01"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="mb-2">
                                    <asp:Label ID="lblRetailPrice" runat="server" Text="Retail Price" AssociatedControlID="txtRetailPrice"></asp:Label>
                                    <asp:TextBox ID="txtRetailPrice" runat="server" CssClass="form-control" TextMode="Number" step="0.01"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="mb-2">
                                    <asp:Label ID="lblSupplierDiscount" runat="server" Text="Supplier Discount" AssociatedControlID="txtSupplierDiscount"></asp:Label>
                                    <asp:TextBox ID="txtSupplierDiscount" runat="server" CssClass="form-control" TextMode="Number" step="0.01" Text="0"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="mb-2">
                                    <asp:Label ID="lblSellMargin" runat="server" Text="Sell Margin" AssociatedControlID="txtSellMargin"></asp:Label>
                                    <asp:TextBox ID="txtSellMargin" runat="server" CssClass="form-control" TextMode="Number" step="0.01" Text="0"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary" Style="background-color: #B71D1D; border-color: #B71D1D;" />
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn" Style="background-color: #D9D9D9;" OnClientClick="$('#addGRMModal').modal('hide'); return false;" />
                    </div>
                </div>
            </div>
        </asp:Panel>
    </div>

    <asp:HiddenField ID="hdnShowModal" runat="server" Value="" />

    <script type="text/javascript">
        $(document).ready(function () {
            // Calculate amount when quantity or price changes
            $("#<%= txtQty.ClientID %>").on("change", function () {
                calculateAmount();
            });

            $("#<%= txtPrice.ClientID %>").on("change", function () {
                calculateAmount();
            });

            // Function to calculate amount
            function calculateAmount() {
                var qty = parseFloat($("#<%= txtQty.ClientID %>").val()) || 0;
                var price = parseFloat($("#<%= txtPrice.ClientID %>").val()) || 0;
                var amount = qty * price;
                $("#<%= txtAmount.ClientID %>").val(amount.toFixed(2));
            }

            // Show modal if needed (e.g., after postback with validation errors)
            var showModal = $("#<%= hdnShowModal.ClientID %>").val();
            if (showModal === "1") {
                $("#addGRMModal").modal("show");
            }
        });
    </script>
</asp:Content>