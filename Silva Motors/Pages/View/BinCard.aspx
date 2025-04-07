<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BinCard.aspx.cs" Inherits="Silva_Motors.Pages.View.BinCard1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href='<%= ResolveUrl("~/Content/CustomCSS/View/BinCard.css") %>' />

    <asp:Panel CssClass="main" runat="server">
        <asp:Label ID="lblHeader" runat="server" CssClass="header" Text="STOCK BIN CARD"></asp:Label>

        <asp:Panel CssClass="bin-card-container" runat="server">

            <asp:Label ID="lblFindByItemCode" runat="server" Text="Find by Item Code"></asp:Label><br />
            <asp:TextBox ID="txtItemCode" runat="server" CssClass="form-control" placeholder="Enter Item Code"></asp:TextBox><br />
            <br />

            <div class="input-row">
                <div class="form-group">
                    <asp:Label ID="lblCode" runat="server" Text="Code"></asp:Label>
                    <asp:TextBox ID="txtCode" runat="server" ReadOnly="true"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="lblCategory" runat="server" Text="Category"></asp:Label>
                    <asp:TextBox ID="txtCategory" runat="server" ReadOnly="true"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="lblPartNo" runat="server" Text="Part No"></asp:Label>
                    <asp:TextBox ID="txtPartNo" runat="server" ReadOnly="true"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="lblDescription" runat="server" Text="Description"></asp:Label>
                    <asp:TextBox ID="txtDescription" runat="server" ReadOnly="true"></asp:TextBox>
                </div>
            </div>

            <div class="input-row">
                <div class="form-group">
                    <asp:Label ID="lblBrand" runat="server" Text="Brand"></asp:Label>
                    <asp:TextBox ID="txtBrand" runat="server" ReadOnly="true"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="lblPrice" runat="server" Text="Price"></asp:Label>
                    <asp:TextBox ID="txtPrice" runat="server" ReadOnly="true"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="lblMake" runat="server" Text="Make"></asp:Label>
                    <asp:TextBox ID="txtMake" runat="server" ReadOnly="true"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="lblQuantity" runat="server" Text="Quantity"></asp:Label>
                    <asp:TextBox ID="txtQuantity" runat="server" ReadOnly="true"></asp:TextBox>
                </div>
            </div>
        </asp:Panel>
        <asp:GridView ID="gvTransactions" runat="server" CssClass="data-table" AutoGenerateColumns="False" ShowHeader="True">
            <Columns>
                <asp:BoundField DataField="Date" HeaderText="DATE" />
                <asp:BoundField DataField="TrxID" HeaderText="TRX-ID" />
                <asp:BoundField DataField="Particulars" HeaderText="PARTICULARS" />
                <asp:BoundField DataField="User" HeaderText="USER" />
                <asp:BoundField DataField="In" HeaderText="IN" />
                <asp:BoundField DataField="Out" HeaderText="OUT" />
                <asp:BoundField DataField="Balance" HeaderText="BALANCE" />
                <asp:BoundField DataField="SellPrice" HeaderText="SELL PRICE" />
            </Columns>
        </asp:GridView>
    </asp:Panel>
</asp:Content>
