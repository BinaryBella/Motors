<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Transaction-Advance.aspx.cs" Inherits="Silva_Motors.Pages.View.Transaction_Advance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

    <link rel="stylesheet" href='<%= ResolveUrl("~/Content/CustomCSS/View/TransactionCSS.css") %>' />

    <div class="main">
        <div class="header">ADVANCE TRANSACTIONS</div>

        <div class="container-fluid px-4">
            <div class="card shadow-sm mb-4">
                <div class="card-body" style="background-color: #f0f0f0;">
                    <div class="row">
                        <!-- Date Range Section -->
                        <div class="col-md-6 mb-3">
                            <div class="card h-100">
                                <div class="card-header">
                                    <i class="bi bi-calendar me-2"></i>Date Range
                                </div>
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-6 mb-3">
                                            <label asp-for="StartDate" class="form-label">Start Date</label>
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="bi bi-calendar-check"></i></span>
                                                <input asp-for="StartDate" type="date" class="form-control">
                                            </div>
                                        </div>
                                        <div class="col-md-6 mb-3">
                                            <label asp-for="EndDate" class="form-label">End Date</label>
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="bi bi-calendar-check"></i></span>
                                                <input asp-for="EndDate" type="date" class="form-control">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- View Options Section -->
                        <div class="col-md-6 mb-3">
                            <div class="card h-100">
                                <div class="card-header">
                                    <i class="bi bi-eye me-2"></i>View Options
                                </div>
                                <div class="card-body">
                                    <div class="row mb-3">
                                        <div class="col-md-6">
                                            <div class="form-check">
                                                <input asp-for="ViewOption" type="radio" value="all" class="form-check-input" checked>
                                                <label class="form-check-label" for="ViewOption">
                                                    View All Transactions
                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-check">
                                                <input asp-for="ViewOption" type="radio" value="due" class="form-check-input">
                                                <label class="form-check-label" for="ViewOption">
                                                    View All Due
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-md-6">
                                            <div class="form-check">
                                                <input asp-for="ViewOption" type="radio" value="refNo" class="form-check-input">
                                                <label class="form-check-label" for="ViewOption">
                                                    View Selected Ref/No
                                                </label>
                                                <input asp-for="RefNo" type="text" class="form-control mt-2" placeholder="Enter Ref/No">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

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
