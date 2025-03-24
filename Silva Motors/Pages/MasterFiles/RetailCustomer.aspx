<%@ Page Title="Retail Customers" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="Silva_Motors.Pages.MasterFiles.RetailCustomer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

    <style>
        .main {
            padding: 30px;
        }

        .header {
            color: #c22;
            font-weight: bold;
            margin-bottom: 20px;
            font-size: 24px;
        }

        .filters-button, .add-button {
            background-color: #c22;
            color: white;
            border: none;
            padding: 8px 30px;
            font-weight: normal;
        }

            .add-button i {
                margin-right: 5px;
            }

        .customers-table th {
            background-color: #000;
            color: white;
            font-weight: normal;
            text-align: left;
        }

        .customers-table tr:nth-child(odd) td {
            background-color: #e0e0e0;
        }

        .customers-table tr:nth-child(even) td {
            background-color: #fff;
        }

        .pagination {
            display: flex;
        }

            .pagination a {
                color: white;
                background-color: #000;
                padding: 8px 12px;
                text-decoration: none;
                margin-right: 2px;
            }

                .pagination a.active {
                    background-color: #c22;
                }

        .total-outstanding {
            background-color: #000;
            color: white;
            padding: 8px 12px;
            display: inline-block;
            font-weight: bold;
        }

        .total-value {
            background-color: white;
            border: 2px solid #000;
            padding: 8px 12px;
            display: inline-block;
            min-width: 80px;
            text-align: center;
        }

        .checkbox-container {
            display: flex;
            justify-content: flex-end;
            gap: 15px;
            margin-top: 10px;
        }
    </style>

    <div class="container-fluid main">
        <div class="header">RETAIL CUSTOMERS</div>

        <div class="d-flex justify-content-between mb-3">
            <asp:Button ID="btnFilters" runat="server" Text="Filters" CssClass="filters-button" />
            <asp:Button ID="btnAdd" runat="server" Text=" ADD" CssClass="add-button" />
        </div>

        <div class="table-responsive">
            <table class="table table-bordered customers-table" width="100%">
                <thead>
                    <tr>
                        <th>CODE</th>
                        <th>NAME</th>
                        <th>ADDRESS</th>
                        <th>TELEPHONE</th>
                        <th>CREDIT LIMIT</th>
                        <th>OUTSTANDING</th>
                        <th>ACTIONS</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>C001</td>
                        <td>John Doe</td>
                        <td>123 Main St</td>
                        <td>0771234567</td>
                        <td>5000</td>
                        <td>1200</td>
                        <td class="action-buttons">
                            <button class="btn btn-sm btn-primary"><i class="fas fa-edit"></i></button>
                            <button class="btn btn-sm btn-danger"><i class="fas fa-trash"></i></button>
                        </td>
                    </tr>
                    <tr>
                        <td>C002</td>
                        <td>Jane Smith</td>
                        <td>456 Elm St</td>
                        <td>0769876543</td>
                        <td>7000</td>
                        <td>2500</td>
                        <td class="action-buttons">
                            <button class="btn btn-sm btn-primary"><i class="fas fa-edit"></i></button>
                            <button class="btn btn-sm btn-danger"><i class="fas fa-trash"></i></button>
                        </td>
                    </tr>
                    <tr>
                        <td>C003</td>
                        <td>Michael Brown</td>
                        <td>789 Pine St</td>
                        <td>0756543210</td>
                        <td>6000</td>
                        <td>1800</td>
                        <td class="action-buttons">
                            <button class="btn btn-sm btn-primary"><i class="fas fa-edit"></i></button>
                            <button class="btn btn-sm btn-danger"><i class="fas fa-trash"></i></button>
                        </td>
                    </tr>
                    <tr>
                        <td>C004</td>
                        <td>Sarah Johnson</td>
                        <td>321 Oak St</td>
                        <td>0712345678</td>
                        <td>8000</td>
                        <td>3000</td>
                        <td class="action-buttons">
                            <button class="btn btn-sm btn-primary"><i class="fas fa-edit"></i></button>
                            <button class="btn btn-sm btn-danger"><i class="fas fa-trash"></i></button>
                        </td>
                    </tr>
                    <tr>
                        <td>C005</td>
                        <td>David Lee</td>
                        <td>654 Maple St</td>
                        <td>0708765432</td>
                        <td>5500</td>
                        <td>1000</td>
                        <td class="action-buttons">
                            <button class="btn btn-sm btn-primary"><i class="fas fa-edit"></i></button>
                            <button class="btn btn-sm btn-danger"><i class="fas fa-trash"></i></button>
                        </td>
                    </tr>
                </tbody>
            </table>
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

        <div>
            <span class="total-outstanding">TOTAL OUTSTANDING</span>
            <span class="total-value">
                <asp:Literal ID="litTotalOutstanding" runat="server"></asp:Literal>
            </span>
        </div>
    </div>

    <div class="checkbox-container">
        <asp:CheckBox ID="chkShowDebtor" runat="server" Text="Show Debtor" CssClass="checkbox-label" />
        <asp:CheckBox ID="chkShowCreditor" runat="server" Text="Show Creditor" CssClass="checkbox-label" />
    </div>
    </div>

    <script type="text/javascript">
        // Add icon to ADD button
        document.addEventListener("DOMContentLoaded", function () {
            const addButton = document.getElementById('<%= btnAdd.ClientID %>');
            if (addButton) {
                addButton.innerHTML = '<i class="fas fa-plus-circle"></i> ADD';
            }
        });
    </script>
</asp:Content>
