<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VendorLedger.aspx.cs" Inherits="Silva_Motors.Pages.VendorTransaction.VendorLedger" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href='<%= ResolveUrl("~/Content/CustomCSS/View/CustomerLedgerCSS.css") %>' />

    <div class="main-container">
        <h2 class="header">VENDOR LEDGER</h2>
        <div class="custom-card">
            <div class="info-section">
                <div class="customer-info">
                    <div>
                        <asp:DropDownList ID="txtVendorName" runat="server" AutoPostBack="true" CssClass="form-control" ref="VendorSelect">
                        </asp:DropDownList>
                    </div>
                    <asp:TextBox ID="txt_VendorName" runat="server" CssClass="form-control mb-2" ReadOnly="true"></asp:TextBox>
                    <asp:TextBox ID="txt_VendorAdd1" runat="server" CssClass="form-control mb-2" ReadOnly="true"></asp:TextBox>
                    <asp:TextBox ID="txt_VendorAdd2" runat="server" CssClass="form-control mb-2" ReadOnly="true"></asp:TextBox>
                    <asp:TextBox ID="txt_Contact1" runat="server" CssClass="form-control mb-2" ReadOnly="true"></asp:TextBox>
                </div>
                <div class="due-amount">
                    <div style="margin-bottom: 10px;">
                        <asp:Label ID="lblTotalDueAmount" runat="server" Text="Total Due Amount"></asp:Label>
                        <asp:TextBox ID="txtTotalDueAmount" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                    </div>

                    <!-- Outstanding Age Analysis -->
                    <div style="margin-top: 20px;">
                        <div class="age-analysis-header">
                            Outstanding Age Analysis
                        </div>
                        <div class="age-analysis-content">
                            <div class="age-box">
                                <asp:Label ID="lblOver30Days" runat="server" Text="Over 30 Days"></asp:Label>
                                <asp:Label ID="lblOver30DaysValue" runat="server" Text="0.00"></asp:Label>
                            </div>
                            <div class="age-box">
                                <asp:Label ID="lblOver60Days" runat="server" Text="Over 60 Days"></asp:Label>
                                <asp:Label ID="lblOver60DaysValue" runat="server" Text="0.00"></asp:Label>
                            </div>
                            <div class="age-box">
                                <asp:Label ID="lblOver90Days" runat="server" Text="Over 90 Days"></asp:Label>
                                <asp:Label ID="lblOver90DaysValue" runat="server" Text="0.00"></asp:Label>
                            </div>
                            <div class="age-box">
                                <asp:Label ID="lblCurrentMonth" runat="server" Text="Current Month"></asp:Label>
                                <asp:Label ID="lblCurrentMonthValue" runat="server" Text="0.00"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Table Section -->
        <div class="table-container">
            <asp:GridView ID="VendorLedgerGridView" runat="server" CssClass="custom-table" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="Date" HeaderText="Date" />
                    <asp:BoundField DataField="TransactionID" HeaderText="Transaction ID" />
                    <asp:BoundField DataField="Description" HeaderText="Description" />
                    <asp:BoundField DataField="Amount" HeaderText="Amount" DataFormatString="{0:N2}" />
                    <asp:BoundField DataField="Balance" HeaderText="Balance" DataFormatString="{0:N2}" />
                </Columns>
            </asp:GridView>
        </div>

        <!-- Tabs and Action Buttons -->
        <div style="display: flex; justify-content: space-between;">
            <div>
                <asp:Button ID="btnVendorLedger" runat="server" Text="Vendor Ledger" CssClass="tab-button"  />
                <asp:Button ID="btnOutstandings" runat="server" Text="Outstandings" CssClass="tab-button"  />
                <asp:Button ID="btnDetailLedger" runat="server" Text="Detail Ledger" CssClass="tab-button" />
                <asp:Button ID="btnDamageRemovel" runat="server" Text="Pending Damaged Removel" CssClass="tab-button"  />
            </div>
            <div class="action-buttons">
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="cancel-btn"/>
                <asp:Button ID="btnPrint" runat="server" Text="Print" CssClass="print-btn"  />
            </div>
        </div>
    </div>
</asp:Content>