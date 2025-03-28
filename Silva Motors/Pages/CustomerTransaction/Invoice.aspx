<%@ Page Title="Invoice" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Invoice.aspx.cs" Inherits="Silva_Motors.Pages.CustomerTransaction.Invoice" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href='<%= ResolveUrl("~/Content/CustomCSS/CUstomerTransaction/InvoiceCSS.css") %>' />

    <div class="main">
        <div class="header">INVOICE</div>

        <div style="background-color: #f1f1f1; margin-bottom: 10px; padding: 10px;">
            <div class="row">
                <div class="col-md-3">
                    <div class="form-group">
                        <label>Invoice To</label>
                        <asp:DropDownList ID="ddlInvoiceTo" CssClass="form-control" runat="server">
                            <asp:ListItem Text="Select Customer" Value="" />
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="row">
                        <div class="col-12 mb-2">
                            <asp:TextBox ID="txtCustomerName" CssClass="form-control" runat="server" Placeholder="Customer Name" />
                        </div>
                        <div class="col-12 mb-2">
                            <asp:TextBox ID="txtAddress" CssClass="form-control" runat="server" Placeholder="Address" />
                        </div>
                        <div class="col-12 mb-2">
                            <asp:TextBox ID="txtContact" CssClass="form-control" runat="server" Placeholder="Contact" />
                        </div>
                        <div class="col-12">
                            <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server" Placeholder="Email" />
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="row">
                        <div class="col-12 mb-2">
                            <asp:TextBox ID="txtTEC1" CssClass="form-control" runat="server" Placeholder="TEC 1" />
                        </div>
                        <div class="col-12 mb-2">
                            <asp:TextBox ID="txtTEC2" CssClass="form-control" runat="server" Placeholder="TEC 2" />
                        </div>
                        <div class="col-12">
                            <asp:TextBox ID="txtTEC3" CssClass="form-control" runat="server" Placeholder="TEC 3" />
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group mb-2">
                        <asp:DropDownList ID="ddlMode" CssClass="form-control" runat="server">
                            <asp:ListItem Text="Select Mode" Value="" />
                            <asp:ListItem Text="Cash" Value="Cash" />
                            <asp:ListItem Text="Credit" Value="Credit" />
                        </asp:DropDownList>
                    </div>
                    <div class="form-group mb-2">
                        <asp:TextBox ID="txtDescription" CssClass="form-control" runat="server" Placeholder="Description" />
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txtDate" CssClass="form-control" runat="server" TextMode="Date" Placeholder="Date" />
                    </div>
                </div>
            </div>

            <div class="row mt-3">
                <div class="col-md-2">
                    <div class="form-group">
                        <label>Total Balance Due</label>
                        <asp:TextBox ID="txtTotalBalanceDue" CssClass="form-control" runat="server" />
                    </div>
                </div>
                <div class="col-md-2">
                    <div class="form-group">
                        <label>Cheque Balance</label>
                        <asp:TextBox ID="txtChequeBalance" CssClass="form-control" runat="server" />
                    </div>
                </div>
                <div class="col-md-2">
                    <div class="form-group">
                        <label>Available Balance</label>
                        <asp:TextBox ID="txtAvailableBalance" CssClass="form-control" runat="server" />
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label>Credit Period</label>
                        <asp:TextBox ID="txtCreditPeriod" CssClass="form-control" runat="server" />
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label>Credit Limit</label>
                        <asp:TextBox ID="txtCreditLimit" CssClass="form-control" runat="server" />
                    </div>
                </div>
            </div>
        </div>

        <div class="row mt-3">
            <div class="col-12">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>CODE</th>
                            <th>ITEM-DESC</th>
                            <th>QTY</th>
                            <th>UNIT PRICE</th>
                            <th>UNIT DISC</th>
                            <th>AMOUNT</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>
                                <input type="text" class="form-control" value="A001" /></td>
                            <td>
                                <input type="text" class="form-control" value="Item 1" /></td>
                            <td>
                                <input type="number" class="form-control" value="2" /></td>
                            <td>
                                <input type="number" class="form-control" step="0.01" value="50.00" /></td>
                            <td>
                                <input type="number" class="form-control" step="0.01" value="5.00" /></td>
                            <td>
                                <input type="text" class="form-control" value="95.00" readonly /></td>
                        </tr>
                        <tr>
                            <td>
                                <input type="text" class="form-control" value="A002" /></td>
                            <td>
                                <input type="text" class="form-control" value="Item 2" /></td>
                            <td>
                                <input type="number" class="form-control" value="1" /></td>
                            <td>
                                <input type="number" class="form-control" step="0.01" value="30.00" /></td>
                            <td>
                                <input type="number" class="form-control" step="0.01" value="3.00" /></td>
                            <td>
                                <input type="text" class="form-control" value="27.00" readonly /></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <%--Table Grid View--%>
        <%--        <div class="row mt-3">
            <div class="col-12">
                <asp:GridView ID="gvInvoiceItems" runat="server" CssClass="table table-bordered"
                    AutoGenerateColumns="false">
                    <Columns>
                        <asp:TemplateField HeaderText="CODE">
                            <ItemTemplate>
                                <asp:TextBox ID="txtCode" runat="server" CssClass="form-control" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ITEM-DESC">
                            <ItemTemplate>
                                <asp:TextBox ID="txtItemDesc" runat="server" CssClass="form-control" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="QTY">
                            <ItemTemplate>
                                <asp:TextBox ID="txtQty" runat="server" CssClass="form-control" TextMode="Number" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="UNIT PRICE">
                            <ItemTemplate>
                                <asp:TextBox ID="txtUnitPrice" runat="server" CssClass="form-control" TextMode="Number" step="0.01" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="UNIT DISC">
                            <ItemTemplate>
                                <asp:TextBox ID="txtUnitDisc" runat="server" CssClass="form-control" TextMode="Number" step="0.01" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="AMOUNT">
                            <ItemTemplate>
                                <asp:TextBox ID="txtAmount" runat="server" CssClass="form-control" ReadOnly="true" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>--%>

        <div style="background-color: #f1f1f1; margin-bottom: 10px; padding: 10px;">

            <div class="row mt-3">
                <div class="col-md-5">
                    <div class="input-group">
                        <asp:TextBox ID="txtBroker" CssClass="form-control" runat="server" Placeholder="Broker" />
                        <div class="input-group-append" style="margin-left: 20px;">
                            <asp:Button ID="btnAddBroker" runat="server" Text="+" CssClass="btn btn-success" Style="padding-right: 10px;background-color: #dc3545; border:none;" />
                        </div>
                    </div>
                </div>
                <div class="col-md-7">
                    <asp:TextBox ID="txtCommission" CssClass="form-control" runat="server" Placeholder="Commission" TextMode="Number" step="0.01" />
                </div>
            </div>

            <div class="row mt-3">
                <div class="col-md-3">
                    <div class="form-group">
                        <label>Total Qty</label>
                        <asp:TextBox ID="txtTotalQty" CssClass="form-control" runat="server" ReadOnly="true" />
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label>Total</label>
                        <asp:TextBox ID="txtTotal" CssClass="form-control" runat="server" ReadOnly="true" />
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label>Dis. Amount</label>
                        <asp:TextBox ID="txtDiscAmount" CssClass="form-control" runat="server" ReadOnly="true" />
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label>Grand Total</label>
                        <asp:TextBox ID="txtGrandTotal" CssClass="form-control" runat="server" ReadOnly="true" />
                    </div>
                </div>
            </div>

        </div>
    </div>
</asp:Content>
