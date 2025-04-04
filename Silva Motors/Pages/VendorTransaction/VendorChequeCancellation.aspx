<%@ Page Title="" Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="VendorChequeCancellation.aspx.cs" Inherits="Silva_Motors.Pages.VendorTransaction.VendorChequeCancellation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

    <link rel="stylesheet" href='<%= ResolveUrl("~/Content/CustomCSS/CustomerTransaction/CustomerPaymentReciept.css") %>' />

    <div class="main">
        <div class="header">VENDOR CHEQUE CANCELLATION</div>

        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Select Vendor</label>
                                        <asp:DropDownList ID="txt_SearchVendorId" CssClass="form-control select-customer" runat="server" AutoPostBack="true">
                                        </asp:DropDownList>
                                    </div>
                                    <div class="form-group mb-6">
                                        <asp:TextBox ID="txt_VendorName" runat="server" CssClass="form-control mb-2" ReadOnly="true"></asp:TextBox>
                                        <asp:TextBox ID="txt_VendorAdd1" runat="server" CssClass="form-control mb-2" ReadOnly="true"></asp:TextBox>
                                        <asp:TextBox ID="txt_Contact1" runat="server" CssClass="form-control mb-2" ReadOnly="true"></asp:TextBox>
                                        <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control mb-2" ReadOnly="true"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="col-md-6 mt-4">
                                    <div class="form-group d-flex justify-content-end">
                                        <asp:Label ID="lblDate" runat="server" Text="Date" CssClass="me-2"></asp:Label>
                                        <asp:TextBox ID="txt_Date" runat="server" CssClass="form-control" ReadOnly="true" Width="50%"></asp:TextBox>
                                    </div>
                                    <div class="form-group d-flex justify-content-end mt-2">
                                        <asp:Label ID="lblTime" runat="server" Text="Time" CssClass="me-2"></asp:Label>
                                        <asp:TextBox ID="txt_Time" runat="server" CssClass="form-control" ReadOnly="true" Width="50%"></asp:TextBox>
                                    </div>
                                </div>


                                <div class="col-md-12">
                                    <div class="form-group d-flex flex-wrap align-items-center gap-3">
                                        <div class="d-flex align-items-center">
                                            <asp:Label ID="lblChequeNo" runat="server" Text="Cheque No" CssClass="me-2"></asp:Label>
                                            <asp:TextBox ID="txt_ChequeNo" runat="server" CssClass="form-control" Width="350px"></asp:TextBox>
                                        </div>
                                        <div class="d-flex align-items-center">
                                            <asp:Label ID="lblVendorName" runat="server" Text="Vendor Name" CssClass="me-2"></asp:Label>
                                            <asp:TextBox ID="txt_VendorsName" runat="server" CssClass="form-control" Width="350px"></asp:TextBox>
                                        </div>
                                        <div class="d-flex align-items-center">
                                            <asp:Label ID="lblAmount" runat="server" Text="Amount" CssClass="me-2"></asp:Label>
                                            <asp:TextBox ID="txt_Amount" runat="server" CssClass="form-control" Width="350px"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="text-right mb-3">
                                    <asp:Button ID="btnPrint" runat="server" Text="Print" CssClass="btn btn-primary" Style="background-color: #B71D1D; border-color: #B71D1D; color: white;" />
                                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn" data-dismiss="modal" BackColor="#D9D9D9" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
