<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Transaction-Advance.aspx.cs" Inherits="Silva_Motors.Pages.View.Transaction_Advance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href='<%= ResolveUrl("~/Content/CustomCSS/View/TransactionCSS.css") %>' />

    <div class="main">
        <asp:Label ID="lblHeader" runat="server" Text="ADVANCE TRANSACTIONS" CssClass="header"></asp:Label>

        <div class="container-fluid px-4">
            <div class="card shadow-sm mb-4">
                <div class="card-body" style="background-color: #f0f0f0;">
                    <div class="row">
                        <!-- Date Range Section -->
                        <div class="col-md-6 mb-3">
                            <div class="card h-100">
                                <div class="card-header">
                                    <asp:Label runat="server" Text="Date Range"></asp:Label>
                                </div>
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-6 mb-3">
                                            <asp:Label ID="lblStartDate" runat="server" Text="Start Date" CssClass="form-label"></asp:Label>
                                            <asp:TextBox ID="txtStartDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                                        </div>
                                        <div class="col-md-6 mb-3">
                                            <asp:Label ID="lblEndDate" runat="server" Text="End Date" CssClass="form-label"></asp:Label>
                                            <asp:TextBox ID="txtEndDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- View Options Section -->
                        <div class="col-md-6 mb-3">
                            <div class="card h-100">
                                <div class="card-header">
                                    <asp:Label runat="server" Text="View Options"></asp:Label>
                                </div>
                                <div class="card-body">
                                    <asp:RadioButtonList ID="rblViewOptions" runat="server" CssClass="form-check">
                                        <asp:ListItem Text="View All Transactions" Value="all" Selected="True"></asp:ListItem>
                                        <asp:ListItem Text="View All Due" Value="due"></asp:ListItem>
                                        <asp:ListItem Text="View Selected Ref/No" Value="refNo"></asp:ListItem>
                                    </asp:RadioButtonList>
                                    <asp:TextBox ID="txtRefNo" runat="server" CssClass="form-control mt-2" Placeholder="Enter Ref/No"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Table -->
            <div class="table-responsive">
                <asp:GridView ID="gvCustomers" runat="server" AutoGenerateColumns="false"
                    CssClass="table table-bordered customers-table" Width="100%">
                    <Columns>
                        <asp:BoundField DataField="Date" HeaderText="DATE" />
                        <asp:BoundField DataField="RefNo" HeaderText="REF/NO" />
                        <asp:BoundField DataField="Description" HeaderText="DESCRIPTION" />
                        <asp:BoundField DataField="Customer" HeaderText="CUSTOMER" />
                        <asp:BoundField DataField="Advance" HeaderText="ADVANCE" />
                        <asp:BoundField DataField="User" HeaderText="USER" />
                    </Columns>
                    <HeaderStyle BackColor="Black" ForeColor="White" />
                    <RowStyle BackColor="#e0e0e0" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
