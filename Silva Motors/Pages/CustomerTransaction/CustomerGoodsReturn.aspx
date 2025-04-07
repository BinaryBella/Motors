<%@ Page Title="Customer Goods Return" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CustomerGoodsReturn.aspx.cs" Inherits="Silva_Motors.Pages.CustomerTransaction.CustomerGoodsReturn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href='<%= ResolveUrl("~/Content/CustomCSS/CustomerTransaction/CustomerGoodsReturn.css") %>' />

    <div class="main">
        <div class="container-fluid">
            <div class="row align-items-center">
                <div class="col-6">
                    <div class="header h4">CUSTOMER GOODS RETURN</div>
                </div>
                <div class="col-6 d-flex justify-content-end">
                    <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-danger me-2" Text="ADD" data-bs-toggle="modal" data-bs-target="#addGrnModal" />
                    <asp:Button ID="btnEndPrint" runat="server" CssClass="btn btn-danger" Text="END PRINT" data-bs-toggle="modal" data-bs-target="#printEndModal" />
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
                <asp:GridView ID="gvGoodreturnItems" runat="server" CssClass="table table-bordered" AutoGenerateColumns="False"
                    ShowFooter="True">
                    <Columns>

                        <asp:TemplateField HeaderText="CODE">
                            <ItemTemplate>
                                <asp:TextBox ID="txtCode" runat="server" CssClass="form-control" Text='<%# Eval("Code") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="ITEM-DESC">
                            <ItemTemplate>
                                <asp:TextBox ID="txtDesc" runat="server" CssClass="form-control" Text='<%# Eval("Description") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="QTY">
                            <ItemTemplate>
                                <asp:TextBox ID="txtQty" runat="server" CssClass="form-control" Text='<%# Eval("Qty") %>' TextMode="Number" />
                            </ItemTemplate>
                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="UNIT PRICE">
                            <ItemTemplate>
                                <asp:TextBox ID="txtUnitPrice" runat="server" CssClass="form-control" Text='<%# Eval("UnitPrice") %>' TextMode="Number" Step="0.01" />
                            </ItemTemplate>
                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="AMOUNT">
                            <ItemTemplate>
                                <asp:TextBox ID="txtAmount" runat="server" CssClass="form-control" Text='<%# Eval("Amount") %>' ReadOnly="True" />
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
                        <asp:Label ID="lblTotalQuantity" runat="server" Text="Total Quantity" AssociatedControlID="txtTotalQUantity" />
                        <asp:TextBox ID="txtTotalQUantity" CssClass="form-control" runat="server" />
                    </div>
                </div>
                <div class="col-md-2">
                    <div class="form-group">
                        <asp:Label ID="lblDiscount" runat="server" Text="Discount" AssociatedControlID="txtDiscount" />
                        <asp:TextBox ID="txtDiscount" CssClass="form-control" runat="server" />
                    </div>
                </div>
                <div class="col-md-2">
                    <div class="form-group">
                        <asp:Label ID="lblDiscAmount" runat="server" Text="Disc. Amount" AssociatedControlID="txtDiscAmount" />
                        <asp:TextBox ID="txtDiscAmount" CssClass="form-control" runat="server" />
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <asp:Label ID="lblTotal" runat="server" Text="Total" AssociatedControlID="txtTotal" />
                        <asp:TextBox ID="txtTotal" CssClass="form-control" runat="server" />
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <asp:Label ID="lblGrandTotal" runat="server" Text="Grand Total Rs." AssociatedControlID="TextGrandTotal" />
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
                                <asp:TextBox ID="txtItemCode" runat="server" CssClass="form-control" Placeholder="Item Code"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-8">
                            <div class="mb-2">
                                <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" Placeholder="Description" TextMode="MultiLine" Rows="2"></asp:TextBox>
                            </div>
                        </div>
                        <div class="table-responsive mb-4">
                            <asp:GridView ID="grnItemsGrid" runat="server" CssClass="table table-bordered table-hover" AutoGenerateColumns="False">
                                <HeaderStyle CssClass="table-light" />
                                <Columns>
                                    <asp:BoundField DataField="Code" HeaderText="Code" />
                                    <asp:BoundField DataField="Description" HeaderText="Description" />
                                    <asp:BoundField DataField="Qty" HeaderText="Qty" />
                                    <asp:BoundField DataField="Price" HeaderText="Price" />
                                    <asp:BoundField DataField="Amount" HeaderText="Amount" />
                                </Columns>
                            </asp:GridView>

                        </div>
                        <div class="col-md-4">
                            <div class="mb-2">
                                <asp:Label ID="lblQuantity" runat="server" Text="Quantity" AssociatedControlID="txtQuantity" CssClass="form-label" />
                                <asp:TextBox ID="txtQuantity" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="mb-2">
                                <asp:Label ID="lblUnitPrice" runat="server" Text="Unit Price" AssociatedControlID="txtUnitPrice" CssClass="form-label" />
                                <asp:TextBox ID="txtUnitPrice" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="mb-2">
                                <asp:Label ID="lblAmount" runat="server" Text="Amount" AssociatedControlID="txtAmount" CssClass="form-label" />
                                <asp:TextBox ID="txtAmount" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary" Style="background-color: #B71D1D; border-color: #B71D1D;" OnClientClick="return validateForm();" />
                   <asp:Button ID="btnCancel" runat="server" CssClass="btn" Text="Cancel" OnClientClick="$('#addInvoiceModal').modal('hide'); return false;" Style="background-color: #D9D9D9;" />
                </div>
            </div>
        </div>


    </div>

    <!-- Print End GRN Modal -->
    <div class="modal fade" id="printEndModal" tabindex="-1" aria-labelledby="printEndModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-xl" style="max-width: 80%; width: 80%;">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="printEndModalLabel">End Print</h5>
                    <asp:LinkButton ID="CloseButton" runat="server" CssClass="btn-close" aria-label="Close" OnClientClick="return false;" data-bs-dismiss="modal"></asp:LinkButton>
                </div>
                <div class="modal-body">
                    <div class="table-responsive mb-4">
                        <asp:Table ID="printTable" runat="server" CssClass="table table-bordered table-hover">
                            <asp:TableHeaderRow CssClass="table-light">
                                <asp:TableHeaderCell>No</asp:TableHeaderCell>
                                <asp:TableHeaderCell>Ref/No</asp:TableHeaderCell>
                                <asp:TableHeaderCell>Date</asp:TableHeaderCell>
                                <asp:TableHeaderCell>Particulars</asp:TableHeaderCell>
                                <asp:TableHeaderCell>Trx Amount</asp:TableHeaderCell>
                                <asp:TableHeaderCell>Due Amount</asp:TableHeaderCell>
                                <asp:TableHeaderCell>Age</asp:TableHeaderCell>
                                <asp:TableHeaderCell>X</asp:TableHeaderCell>
                                <asp:TableHeaderCell>Amount</asp:TableHeaderCell>
                            </asp:TableHeaderRow>
                            <%-- Table data will be populated dynamically --%>
                        </asp:Table>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <div class="mb-2">
                                <asp:Label ID="Label1" runat="server" CssClass="form-label" AssociatedControlID="totaldueamount">Total Due Amount</asp:Label>
                                <asp:TextBox ID="totaldueamount" runat="server" CssClass="form-control" name="TotalDueAmount"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="mb-2">
                                <asp:Label ID="Label2" runat="server" CssClass="form-label" AssociatedControlID="remainingbalance">Remaining Balance</asp:Label>
                                <asp:TextBox ID="remainingbalance" runat="server" CssClass="form-control" name="RemainingBalance"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="mb-2">
                                <asp:Label ID="Label3" runat="server" CssClass="form-label" AssociatedControlID="cnbalance">C/N Balance</asp:Label>
                                <asp:TextBox ID="cnbalance" runat="server" CssClass="form-control" name="CNBalance"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="Button1" runat="server" Text="Save" CssClass="btn btn-primary" Style="background-color: #B71D1D; border-color: #B71D1D;" OnClientClick="return validateForm();" />
                    <asp:Button ID="Button2" runat="server" Text="Cancel" CssClass="btn" Style="background-color: #D9D9D9;" OnClientClick="return false;" data-dismiss="modal" />
                </div>
            </div>
        </div>


    </div>

    <script type="text/javascript">
    $(document).ready(function () {
        // Initialize modal for Add button
        $("#<%= btnAdd.ClientID %>").click(function() {
            $("#addGrnModal").modal("show");
            return false;
        });
        
        // Initialize modal for End Print button
        $("#<%= btnEndPrint.ClientID %>").click(function() {
            $("#printEndModal").modal("show");
            return false;
        });
        
        // Fix the cancel button in the GRN modal
        $("#<%= btnCancel.ClientID %>").click(function() {
            $("#addGrnModal").modal("hide");
            return false;
        });
    });
</script>
</asp:Content>
