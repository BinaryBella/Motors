<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CustomerLedger.aspx.cs" Inherits="Silva_Motors.Pages.View.CustomerLedger1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href='<%= ResolveUrl("~/Content/CustomCSS/View/CustomerLedgerCSS.css") %>' />

    <div class="main-container">
        <!-- Page Title -->
        <asp:Label ID="lblHeader" runat="server" Text="CUSTOMER LEDGER" CssClass="header"></asp:Label>

        <!-- Customer Info Card -->
        <div class="custom-card">
            <div class="info-section">
                <div class="customer-info">
                    <div>
                        <asp:DropDownList ID="txtCustomerName" runat="server" AutoPostBack="true" CssClass="form-control"></asp:DropDownList>
                    </div>
                    <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" ReadOnly="true" />
                    <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" ReadOnly="true" />
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" ReadOnly="true" />
                    <asp:TextBox ID="txtNIC" runat="server" CssClass="form-control" ReadOnly="true" />
                </div>

                <div class="due-amount">
                    <div style="margin-bottom: 10px;">
                        <asp:Label ID="lblTotalDue" runat="server" Text="Total Due Amount"></asp:Label>
                        <asp:TextBox ID="txtTotalDueAmount" runat="server" CssClass="form-control" ReadOnly="true" />
                    </div>

                    <!-- Outstanding Age Analysis -->
                    <div style="margin-top: 20px;">
                        <asp:Label ID="lblAgeHeader" runat="server" Text="Outstanding Age Analysis" CssClass="age-analysis-header"></asp:Label>
                        <div class="age-analysis-content">
                            <div class="age-box">
                                <asp:Label ID="lblOver30Label" runat="server" Text="Over 30 Days"></asp:Label>
                                <asp:Label ID="lblOver30" runat="server" Text="0.00"></asp:Label>
                            </div>
                            <div class="age-box">
                                <asp:Label ID="lblOver60Label" runat="server" Text="Over 60 Days"></asp:Label>
                                <asp:Label ID="lblOver60" runat="server" Text="0.00"></asp:Label>
                            </div>
                            <div class="age-box">
                                <asp:Label ID="lblOver90Label" runat="server" Text="Over 90 Days"></asp:Label>
                                <asp:Label ID="lblOver90" runat="server" Text="0.00"></asp:Label>
                            </div>
                            <div class="age-box">
                                <asp:Label ID="lblCurrentMonthLabel" runat="server" Text="Current Month"></asp:Label>
                                <asp:Label ID="lblCurrentMonth" runat="server" Text="0.00"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Table Section -->
        <div class="table-container">
            <asp:GridView ID="CustomerLedgerGridView" runat="server" CssClass="custom-table" AutoGenerateColumns="False">
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
                <asp:Button ID="btnCustomerLedger" runat="server" Text="Customer Ledger" CssClass="tab-button" />
                <asp:Button ID="btnOutstandings" runat="server" Text="Outstandings" CssClass="tab-button" />
                <asp:Button ID="btnDetailLedger" runat="server" Text="Detail Ledger" CssClass="tab-button" />
            </div>
            <div class="action-buttons">
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="cancel-btn" />
                <asp:Button ID="btnPrint" runat="server" Text="Print" CssClass="print-btn" />
            </div>
        </div>
    </div>
</asp:Content>
