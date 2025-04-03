<%@ Page Title="" Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="VendorChequeRegistry.aspx.cs" Inherits="Silva_Motors.Pages.VendorTransaction.VendorChequeRegistry" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

    <link rel="stylesheet" href='<%= ResolveUrl("~/Content/CustomCSS/MasterFiles/ChequeRegistryCSS.css") %>' />

    <div class="main">
        <div class="header">VENDOR CHEQUE REGISTRY</div>

        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <div class="container-fluid">  
                            <div class="row"> 
                                <div class="col-md-6">
                                    <div class="form-group mb-4">
                                        <div class="form-check mb-4">
                                            <asp:RadioButton ID="rbAllCheque" runat="server" GroupName="radioOptions" Checked="true" />
                                            <label class="form-check-label ml-4" for="<%= rbAllCheque.ClientID %>">All Cheques</label>
                                        </div>
                                        <div class="form-check mb-4">
                                            <asp:RadioButton ID="rbChequeInHand" runat="server" GroupName="radioOptions" />
                                            <label class="form-check-label ml-4" for="<%= rbChequeInHand.ClientID %>">Cheque In Hand</label>
                                        </div>
                                        <div class="form-check mb-4">
                                            <asp:RadioButton ID="rbChequeRealized" runat="server" GroupName="radioOptions" />
                                            <label class="form-check-label ml-4" for="<%= rbChequeRealized.ClientID %>">Cheque Realized</label>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="col-md-6">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtChequeNo" runat="server" CssClass="form-control"  placeholder="Cheque No"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtVendor" runat="server" CssClass="form-control" placeholder="Vendor Name"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtAmount" runat="server" CssClass="form-control" placeholder="Amount"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="table-responsive">
                                <asp:GridView ID="gvbranchs" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered bank-table" Width="100%">
                                    <Columns>
                                        <asp:BoundField DataField="BankName" HeaderText="BANK NAME" />
                                        <asp:BoundField DataField="Branch" HeaderText="BRANCH" />
                                        <asp:BoundField DataField="ChequeId" HeaderText="CHEQUE ID" />
                                        <asp:BoundField DataField="Amount" HeaderText="AMOUNT" />
                                        <asp:BoundField DataField="ReceiptId" HeaderText="RECEIPT ID" />
                                        <asp:BoundField DataField="Account" HeaderText="ACCOUNT" />
                                        <asp:BoundField DataField="ChequeNo" HeaderText="CHEQUE NO" />
                                        <asp:TemplateField HeaderText="STATUS">
                                            <HeaderTemplate>
                                                Status
                                                <select id="statusFilter" class="filter-input" onchange="filterTable()">
                                                    <option value="">All</option>
                                                    <option value="active">Active</option>
                                                    <option value="inactive">Inactive</option>
                                                </select>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <span class='<%# Convert.ToBoolean(Eval("ActiveState")) ? "status-badge status-active" : "status-badge status-inactive" %>'>
                                                    <i class='<%# Convert.ToBoolean(Eval("ActiveState")) ? "bi bi-check-circle-fill" : "bi bi-x-circle-fill" %> me-1'></i>
                                                    <%# Convert.ToBoolean(Eval("ActiveState")) ? "Active" : "Inactive" %>
                                                </span>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="ACTIONS">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="btnEdit" runat="server" CssClass="btn btn-warning btn-sm"
                                                    CommandName="EditRecord" CommandArgument='<%# Eval("Id") %>'>
                                                    <i class="bi bi-pencil-fill"></i>
                                                </asp:LinkButton>
                                                <asp:LinkButton ID="btnDelete" runat="server"
                                                    CssClass='<%# Convert.ToBoolean(Eval("ActiveState")) ? "btn btn-danger btn-sm" : "btn btn-success btn-sm" %>'
                                                    OnClientClick='<%# "return confirmDelete(" + Eval("Id") + ");" %>'>
                                                    <i class='<%# Convert.ToBoolean(Eval("ActiveState")) ? "bi bi-toggle-off" : "bi bi-toggle-on" %>'></i>
                                                </asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <HeaderStyle BackColor="Black" ForeColor="White" />
                                    <RowStyle BackColor="#e0e0e0" />
                                    <AlternatingRowStyle BackColor="White" />
                                </asp:GridView>
                                
                                <div class="text-right mb-3">
                                    <asp:Button ID="btnPrint" runat="server" Text="Print" CssClass="btn btn-primary" Style="background-color: #B71D1D; border-color: #B71D1D; color: white;" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="d-flex justify-content-between mt-3">
                    <div class="pagination">
                        <a href="#">1</a>
                        <a href="#" class="active">2</a>
                        <a href="#">3</a>
                        <a href="#">4</a>
                        <a href="#">5</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>