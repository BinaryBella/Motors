<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CustomerLedger.aspx.cs" Inherits="Silva_Motors.Pages.View.CustomerLedger1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href='<%= ResolveUrl("~/Content/CustomCSS/View/CustomerLedgerCSS.css") %>' />

    <div class="main-container">
        <!-- Page Title -->
        <h2 class="header">CUSTOMER LEDGER</h2>

        <!-- Customer Info Card -->
        <div class="custom-card">
            <div class="info-section">
                <div class="customer-info">
                    <div>
                        <asp:DropDownList ID="txtCustomerName" runat="server" AutoPostBack="true" class="form-control" ref="CustomerSelect">
                        </asp:DropDownList>
                    </div>
                    <input type="text" class="form-control" readonly>
                    <input type="text" class="form-control" readonly>
                    <input type="text" class="form-control" readonly>
                    <input type="text" class="form-control" readonly>
                </div>
                <div class="due-amount">
                    <div style="margin-bottom: 10px;">
                        <label>Total Due Amount</label>
                        <input type="text" class="form-control" readonly>
                    </div>

                    <!-- Outstanding Age Analysis -->
                    <div style="margin-top: 20px;">
                        <div class="age-analysis-header">
                            Outstanding Age Analysis
                        </div>
                        <div class="age-analysis-content">
                            <div class="age-box">
                                <div>Over 30 Days</div>
                                <div>0.00</div>
                            </div>
                            <div class="age-box">
                                <div>Over 60 Days</div>
                                <div>0.00</div>
                            </div>
                            <div class="age-box">
                                <div>Over 90 Days</div>
                                <div>0.00</div>
                            </div>
                            <div class="age-box">
                                <div>Current Month</div>
                                <div>0.00</div>
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
                <button class="tab-button">Customer Ledger</button>
                <button class="tab-button">Outstandings</button>
                <button class="tab-button">Detail Ledger</button>
            </div>
            <div class="action-buttons">
                <button class="cancel-btn">Cancel</button>
                <button class="print-btn">Print</button>
            </div>
        </div>
    </div>
</asp:Content>