<%@ Page Title="Stock Bin Card" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BinCard.aspx.cs" Inherits="Silva_Motors.Pages.View.BinCard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .main{
            padding: 30px;
        }
        .bin-card-container {
            background-color: #e3e1e1;
            padding: 20px;
        }
        .header {
            color: #c22;
            font-weight: bold;
            margin-bottom: 20px;
            font-size: 24px;
        }
        .input-row {
            display: flex;
            gap: 10px;
            margin-bottom: 15px;
        }
        .input-row .form-group {
            flex: 1;
        }
        .input-row input {
            width: 100%;
            border: 1px solid #ddd;
            height: 30px;
            padding: 0 5px;
            border-radius:8px;
        }
        .data-table {
            width: 100%;
            border-collapse: collapse;
        }
        .data-table th {
            background-color: black;
            color: white;
            padding: 8px;
            text-align: left;
        }
        .data-table td {
            border: 1px solid #ddd;
            padding: 8px;
        }
    </style>
    <div class="main">
        <div class="header">STOCK BIN CARD</div>
    <div class="bin-card-container">


                <label>Find by Item Code</label>
                <asp:TextBox ID="txtItemCode" runat="server" placeholder="Enter Item Code"></asp:TextBox>

        <div class="input-row">
            <div class="form-group">
                <label>Code</label>
                <asp:TextBox ID="txtCode" runat="server" ReadOnly="true"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>Category</label>
                <asp:TextBox ID="txtCategory" runat="server" ReadOnly="true"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>Part No</label>
                <asp:TextBox ID="txtPartNo" runat="server" ReadOnly="true"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>Description</label>
                <asp:TextBox ID="txtDescription" runat="server" ReadOnly="true"></asp:TextBox>
            </div>
        </div>

        <div class="input-row">
            <div class="form-group">
                <label>Brand</label>
                <asp:TextBox ID="txtBrand" runat="server" ReadOnly="true"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>Price</label>
                <asp:TextBox ID="txtPrice" runat="server" ReadOnly="true"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>Make</label>
                <asp:TextBox ID="txtMake" runat="server" ReadOnly="true"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>Quantity</label>
                <asp:TextBox ID="txtQuantity" runat="server" ReadOnly="true"></asp:TextBox>
            </div>
        </div>

        <asp:GridView ID="gvTransactions" runat="server" CssClass="data-table" 
            AutoGenerateColumns="false" ShowHeader="true">
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
    </div>
        </div>
</asp:Content>