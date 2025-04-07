<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VendorCreditNote.aspx.cs" Inherits="Silva_Motors.Pages.VendorTransaction.VendorCreditNote" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href='<%= ResolveUrl("~/Content/CustomCSS/VendorTransaction/VendorCreditNote.css") %>' />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/select2-bootstrap-5-theme@1.3.0/dist/select2-bootstrap-5-theme.min.css" rel="stylesheet" />
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
                                <asp:Label AssociatedControlID="txt_SearchVenderId" runat="server" CssClass="form-label" Text="Select Vendor" />
                                <asp:DropDownList ID="txt_SearchVenderId" CssClass="form-control select-vendor" runat="server"
                                    AutoPostBack="true">
                                </asp:DropDownList>
                            </div>
                            <div class="vendor-info">
                                <div class="form-group mb-2">
                                    <asp:Label AssociatedControlID="txt_VendorName" runat="server" CssClass="form-label" Text="Vendor Name" />
                                    <asp:TextBox ID="txt_VendorName" runat="server" CssClass="form-control" ReadOnly="true" />
                                </div>
                                <div class="form-group mb-2">
                                    <asp:Label AssociatedControlID="txt_VendorAdd1" runat="server" CssClass="form-label" Text="Address" />
                                    <asp:TextBox ID="txt_VendorAdd1" runat="server" CssClass="form-control" ReadOnly="true" />
                                </div>
                                <div class="form-group mb-2">
                                    <asp:Label AssociatedControlID="txt_Contact1" runat="server" CssClass="form-label" Text="Contact" />
                                    <asp:TextBox ID="txt_Contact1" runat="server" CssClass="form-control" ReadOnly="true" />
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group mb-3">
                                <asp:Label AssociatedControlID="TextBox4" runat="server" CssClass="form-label" Text="Total Due Amount" />
                                <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control" ReadOnly="true" />
                            </div>
                            <div class="vendor-info">
                                <div class="form-group mb-2">
                                    <asp:Label AssociatedControlID="TextBox1" runat="server" CssClass="form-label" Text="Remaining Balance" />
                                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" ReadOnly="true" />
                                </div>
                                <div class="form-group mb-2">
                                    <asp:Label AssociatedControlID="date" runat="server" CssClass="form-label" Text="Date" />
                                    <asp:TextBox ID="date" runat="server" CssClass="form-control" ReadOnly="true" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row mt-4">
                        <div class="col-md-6">
                            <div class="form-group mb-3">
                                <asp:Label AssociatedControlID="txt_Description" runat="server" CssClass="form-label" Text="Description" />
                                <asp:TextBox ID="txt_Description" runat="server" CssClass="form-control" Placeholder="Description..."
                                    onkeydown="handleDescriptionKeyDown(event)" />
                            </div>
                            <asp:Label ID="descriptionError" runat="server" ForeColor="Red" Style="font-size: 12px;"></asp:Label>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group mb-3">
                                <asp:Label AssociatedControlID="txt_Amount" runat="server" CssClass="form-label" Text="Amount" />
                                <asp:TextBox ID="txt_Amount" runat="server" CssClass="form-control" Placeholder="Enter amount..."
                                    oninput="calculateNewBalance()" onkeydown="handleAmountKeyDown(event)" />
                            </div>
                            <asp:Label ID="amountError" runat="server" ForeColor="Red" Style="font-size: 12px;"></asp:Label>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group mb-3 mt-5">
                                <asp:CheckBox ID="chkReturnCash" runat="server" CssClass="form-check-input" />
                                <asp:Label AssociatedControlID="chkReturnCash" runat="server" CssClass="form-check-label" Text="Return Money As Cash" />
                            </div>
                        </div>
                    </div>

                    <div class="action-buttons mt-4">
                        <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary"
                            Style="background-color: #B71D1D; border-color: #B71D1D; color: white;" />
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn"
                            Style="background-color: #D9D9D9;" UseSubmitBehavior="false" CausesValidation="false" />
                    </div>
                </div>
            </div>
        </div>
    </div>

    <asp:HiddenField ID="hdnSaveStatus" runat="server" />
    <asp:HiddenField ID="hdnSaveMessage" runat="server" />

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</asp:Content>
