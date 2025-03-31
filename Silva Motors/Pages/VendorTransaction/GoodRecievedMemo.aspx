<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="GoodRecievedMemo.aspx.cs" Inherits="Silva_Motors.Pages.VendorTransaction.GoodRecievedMemo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href='<%= ResolveUrl("~/Content/CustomCSS/VendorTransaction/GoodRecievedMemo.css") %>' />

    <div class="main">
        <div class="container-fluid">
            <div class="row align-items-center">
                <div class="col d-flex justify-content-between align-items-center">
                    <div class="header h4">GOODS RECIEVED MEMO</div>
                    <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#addCommissionModal">
                        Add
                    </button>
                </div>
            </div>
        </div>
        <div style="background-color: #f1f1f1; margin-bottom: 10px; padding: 10px;">
            <div class="row">
                <div class="col-md-3">
                    <div class="form-group">
                        <label>Supplier</label>
                        <asp:DropDownList ID="ddlsupplier" CssClass="form-control" runat="server">
                            <asp:ListItem Text="Select Supplier" Value="" />
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="row">
                        <div class="col-12 mb-2">
                            <asp:TextBox ID="txt1" CssClass="form-control" runat="server" />
                        </div>
                        <div class="col-12 mb-2">
                            <asp:TextBox ID="txt2" CssClass="form-control" runat="server" />
                        </div>
                        <div class="col-12 mb-2">
                            <asp:TextBox ID="txt3" CssClass="form-control" runat="server" />
                        </div>
                        <div class="col-12">
                            <asp:TextBox ID="txt4" CssClass="form-control" runat="server" />
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="row">
                        <div class="col-12 mb-2">
                            <label>Mode</label>
                            <asp:DropDownList ID="DropDownList2" CssClass="form-control" runat="server">
                                <asp:ListItem Text="Select Mode" Value="" />
                            </asp:DropDownList>
                        </div>
                        <div class="col-12 mb-2">
                            <asp:TextBox ID="billno" CssClass="form-control" runat="server" Placeholder="Bill Number" />
                        </div>
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
                                <input type="text" class="form-control" value="27.00" readonly /></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <%--Table Grid View--%>
        <%--                <div class="row mt-3">
            <div class="col-12">
                <asp:GridView ID="gvGood-returnItems" runat="server" CssClass="table table-bordered"
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
                <div class="col-md-2">
                    <div class="form-group">
                        <label>Total Quantity</label>
                        <asp:TextBox ID="txtTotalQUantity" CssClass="form-control" runat="server" />
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label>Total Cost</label>
                        <asp:TextBox ID="txtTotalCost" CssClass="form-control" runat="server" />
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label>Grand Total Rs.</label>
                        <asp:TextBox ID="TextGrandTotal" CssClass="form-control" runat="server" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
