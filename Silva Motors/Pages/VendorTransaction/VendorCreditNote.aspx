<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VendorCreditNote.aspx.cs" Inherits="Silva_Motors.Pages.VendorTransaction.VendorCreditNote" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href='<%= ResolveUrl("~/Content/CustomCSS/VendorTransaction/VendorCreditNote.css") %>' />
    <!-- Select2 CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" rel="stylesheet" />
    <!-- Custom Select2 Bootstrap Theme -->
    <link href="https://cdn.jsdelivr.net/npm/select2-bootstrap-5-theme@1.3.0/dist/select2-bootstrap-5-theme.min.css" rel="stylesheet" />
    <!-- SweetAlert2 -->
    <link href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <div class="main">
        <div class="header">VENDOR CREDIT NOTE</div>

        <div class="row">
            <div class="col-12">
                <div class="content-container">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group mb-3">
                                <label class="form-label">Select Vendor</label>
                                <asp:DropDownList ID="txt_SearchVenderId" CssClass="form-control select-vendor" runat="server"
                                    AutoPostBack="true">
                                </asp:DropDownList>
                            </div>
                            <div class="vendor-info">
                                <div class="form-group mb-2">
                                    <label class="form-label">Vendor Name</label>
                                    <asp:TextBox ID="txt_VendorName" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                </div>
                                <div class="form-group mb-2">
                                    <label class="form-label">Address</label>
                                    <asp:TextBox ID="txt_VendorAdd1" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                </div>
                                <div class="form-group mb-2">
                                    <label class="form-label">Contact</label>
                                    <asp:TextBox ID="txt_Contact1" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group mb-3">
                                <label class="form-label">Total Due Amount</label>
                                <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                            </div>
                            <div class="vendor-info">
                                <div class="form-group mb-2">
                                    <label class="form-label">Remaining Balance</label>
                                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                </div>
                                <div class="form-group mb-2">
                                    <label class="form-label">Date</label>
                                    <asp:TextBox ID="date" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row mt-4">
                        <div class="col-md-6">
                            <div class="form-group mb-3">
                                <label class="form-label">Description</label>
                                <asp:TextBox ID="txt_Description" runat="server" CssClass="form-control" placeholder="Description..."
                                    onkeydown="handleDescriptionKeyDown(event)"></asp:TextBox>
                            </div>
                            <span id="descriptionError" style="color: red; font-size: 12px;"></span>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group mb-3">
                                <label class="form-label">Amount</label>
                                <asp:TextBox ID="txt_Amount" runat="server" CssClass="form-control" placeholder="Enter amount..."
                                    oninput="calculateNewBalance()" onkeydown="handleAmountKeyDown(event)"></asp:TextBox>
                            </div>
                            <span id="amountError" style="color: red; font-size: 12px;"></span>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group mb-3 mt-5">
                                <input type="checkbox" id="returnCash" class="form-check-input">
                                <label for="returnCash" class="form-check-label">Return Money As Cash</label>
                            </div>
                        </div>
                    </div>

                    <div class="action-buttons mt-4">
                        <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary" Style="background-color: #B71D1D; border-color: #B71D1D; color: white;" />
                        <button type="button" class="btn" data-dismiss="modal" style="background-color: #D9D9D9;">Cancel</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Hidden field to store success/failure message from server -->
    <asp:HiddenField ID="hdnSaveStatus" runat="server" />
    <asp:HiddenField ID="hdnSaveMessage" runat="server" />

    <!-- jQuery and Select2 scripts -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>
    <!-- SweetAlert2 -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

</asp:Content>