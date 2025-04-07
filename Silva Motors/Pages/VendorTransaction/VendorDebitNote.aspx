<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VendorDebitNote.aspx.cs" Inherits="Silva_Motors.Pages.VendorTransaction.VendorDebitNote" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href='<%= ResolveUrl("~/Content/CustomCSS/VendorTransaction/VendorDebitNote.css") %>' />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/select2-bootstrap-5-theme@1.3.0/dist/select2-bootstrap-5-theme.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <div class="main">
        <asp:Label ID="lblHeader" runat="server" Text="VENDOR DEBIT NOTE" CssClass="header"></asp:Label>

        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <div class="vendor-info-section">
                            <div class="row">
                                <div class="col-md-6" style="margin-bottom: 20px;">
                                    <div class="vendor-dropdown mb-3">
                                        <asp:DropDownList ID="txt_SearchVendorId" CssClass="form-control select-vendor" runat="server" AutoPostBack="true">
                                            <asp:ListItem Text="Select Vendor" Value="" Selected="True" Disabled="True"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <asp:TextBox ID="txt_VendorName" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                    <asp:TextBox ID="txt_VendorAdd1" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                    <asp:TextBox ID="txt_Contact1" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                </div>

                                <div class="col-md-6">
                                    <div class="amount-fields">
                                        <div class="row mb-2">
                                            <div class="col-md-5">
                                                <asp:Label ID="lblTotalDue" runat="server" Text="Total Due Amount:" />
                                            </div>
                                            <div class="col-md-7">
                                                <asp:TextBox ID="txt_VendorTotalDueBal" runat="server" CssClass="form-control" ReadOnly="true" />
                                            </div>
                                        </div>
                                        <div class="row mb-2">
                                            <div class="col-md-5">
                                                <asp:Label ID="lblRemaining" runat="server" Text="Remaining Balance:" />
                                            </div>
                                            <div class="col-md-7">
                                                <asp:TextBox ID="txt_remaining_balance" runat="server" CssClass="form-control" ReadOnly="true" />
                                            </div>
                                        </div>
                                        <div class="row mb-2">
                                            <div class="col-md-5">
                                                <asp:Label ID="lblCNBalance" runat="server" Text="C/N Balance" />
                                            </div>
                                            <div class="col-md-7">
                                                <asp:TextBox ID="txt_total_checkedBalance" runat="server" CssClass="form-control" ReadOnly="true" />
                                            </div>
                                        </div>
                                        <div class="row mb-2">
                                            <div class="col-md-5">
                                                <asp:Label ID="lblDate" runat="server" Text="Date" />
                                            </div>
                                            <div class="col-md-7">
                                                <asp:TextBox ID="Date" runat="server" CssClass="form-control" ReadOnly="true" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row mt-3">
                                <div class="col-md-6">
                                    <div class="row mb-2">
                                        <div class="col-md-4">
                                            <asp:Label ID="lblDescription" runat="server" Text="Description:" />
                                        </div>
                                        <div class="col-md-8">
                                            <asp:TextBox ID="txt_description" runat="server" CssClass="form-control" placeholder="Description..."
                                                onkeydown="handleDescriptionKeyDown(event)" />
                                            <asp:Label ID="lblDescriptionError" runat="server" ForeColor="Red" Font-Size="Small" />
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="row mb-2">
                                        <div class="col-md-4">
                                            <asp:Label ID="lblAmount" runat="server" Text="Amount:" />
                                        </div>
                                        <div class="col-md-8">
                                            <asp:TextBox ID="txtEnteredAmount" runat="server" CssClass="form-control" placeholder="Enter amount..."
                                                oninput="calculateNewBalance()" onkeydown="handleAmountKeyDown(event)" />
                                            <asp:Label ID="lblAmountError" runat="server" ForeColor="Red" Font-Size="Small" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <asp:GridView ID="gvTransactions" runat="server" CssClass="transaction-table table table-bordered" AutoGenerateColumns="false">
                            <Columns>
                                <asp:BoundField DataField="No" HeaderText="NO" />
                                <asp:BoundField DataField="RefNo" HeaderText="REF/NO" />
                                <asp:BoundField DataField="Date" HeaderText="DATE" DataFormatString="{0:yyyy-MM-dd}" />
                                <asp:BoundField DataField="Partiulars" HeaderText="PARTICULARS" />
                                <asp:BoundField DataField="trxNetAm" HeaderText="TRX AMOUNT" DataFormatString="{0:N2}" />
                                <asp:BoundField DataField="trxDueAm" HeaderText="DUE AMOUNT" DataFormatString="{0:N2}" />
                                <asp:BoundField DataField="Age" HeaderText="AGE" />
                                <asp:BoundField DataField="Amount" HeaderText="AMOUNT" />
                                <asp:TemplateField HeaderText="Select">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkBox" runat="server" onclick="updateCheckedAmount(this)" />
                                        <asp:HiddenField ID="hdnDueAmount" runat="server" Value='<%# Eval("AtrxDueAm") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>

                        <div class="action-buttons mt-4">
                            <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary" Style="background-color: #B71D1D; border-color: #B71D1D; color: white;" />
                            <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn" CausesValidation="false" UseSubmitBehavior="false" OnClientClick="return false;" Style="background-color: #D9D9D9;" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Hidden Fields -->
    <asp:HiddenField ID="hdnSaveStatus" runat="server" />
    <asp:HiddenField ID="hdnSaveMessage" runat="server" />
    <asp:HiddenField ID="txt_Vendor_NEW_DueBal" runat="server" />
    <asp:HiddenField ID="txt_Vendor_OLD_DueBal" runat="server" />

    <!-- Scripts -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</asp:Content>
