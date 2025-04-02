<%@ Page Language="C#" AutoEventWireup="true" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Silva Motors - Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" />
    <style>
        :root {
            --primary-color: #dc3545;
        }

        /* Top red bar */
        .top-red-bar {
            height: 5px;
            background-color: var(--primary-color);
            width: 100%;
        }

        /* Base Navbar Styles */
        .navbar {
            background-color: #ffffff;
            padding: 0.5rem 1rem;
            position: relative;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

            /* Container styles */
            .navbar .container-fluid {
                display: flex;
                align-items: center;
            }

        .navbar-brand {
            font-weight: bold;
            color: var(--primary-color) !important;
            font-size: 1.2rem;
            margin-right: 2rem;
        }

        .nav-link {
            color: #212529 !important;
            font-weight: 500;
            padding: 8px 15px !important;
            text-transform: uppercase;
        }

            .nav-link:hover {
                color: var(--primary-color) !important;
            }

        .logout-btn {
            color: var(--primary-color) !important;
            font-weight: bold;
            text-decoration: none;
            text-transform: uppercase;
        }

        /* Dropdown Styles */
        .dropdown-menu {
            background-color: #ffffff;
            border: 1px solid #e9ecef;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }

        .dropdown-item {
            color: #212529 !important;
        }

            .dropdown-item:hover {
                background-color: #f8f9fa !important;
                color: var(--primary-color) !important;
            }

        .module-card {
            background-color: #f0f0f0;
            border-radius: 8px;
            padding: 15px;
            text-align: center;
            transition: all 0.3s ease;
            height: 100%;
            width: 100%;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
            cursor: pointer;
            margin: 0 auto;
        }

            .module-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            }

            .module-card img {
                max-width: 80px;
                height: 80px;
                margin-bottom: 10px;
            }

            .module-card h3 {
                font-size: 1.25rem;
                font-weight: 600;
                margin-bottom: 0;
            }

        .modules-row {
            margin-bottom: 20px;
            margin-left: 0px;
            margin-right: 0px;
        }

        .modules-container {
            padding: 0 15px;
        }

        .banner {
            background-color: #000;
            color: white;
            border-radius: 8px;
            padding: 20px;
            margin-top: 40px;
            background-image: url('/Content/src/banner-background.jpg');
            background-size: cover;
            background-position: center;
            position: relative;
            overflow: hidden;
            height: 400px;
            width: 100%;
            display: flex;
            align-items: center;
        }

            .banner::before {
                content: '';
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: rgba(0, 0, 0, 0.5);
                z-index: 1;
            }

        .banner-content {
            position: relative;
            z-index: 2;
        }

        .banner h1 {
            font-size: 3.8rem;
            font-weight: bold;
            margin-bottom: 15px;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
            letter-spacing: 1px;
        }

        .banner h2 {
            font-size: 2.8rem;
            font-weight: bold;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
            letter-spacing: 0.5px;
        }

        /* Module spacing fixes */
        .col-lg-2 {
            padding: 0 10px;
        }

        .footer {
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #000000;
            color: #fff;
            font-size: 14px;
            position: fixed;
            bottom: 0;
            width: 100%;
            height: 50px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Top red bar -->
        <div class="top-red-bar"></div>

        <!-- Main navigation bar -->
        <nav class="navbar navbar-expand-lg navbar-light">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">
                    <i class="bi bi-gear me-2"></i>SILVA MOTORS
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav me-auto">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="filesDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">FILES
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="filesDropdown">
                                <li><a class="dropdown-item" runat="server" href="~/Pages/MasterFiles/Customer">Customer Master File</a></li>
                                <li><a class="dropdown-item" runat="server" href="~/Pages/MasterFiles/Broker">Broker Master File</a></li>
                                <li><a class="dropdown-item" runat="server" href="~/Pages/MasterFiles/Vendor">Vendor Master File</a></li>
                                <li><a class="dropdown-item" runat="server" href="~/Pages/MasterFiles/StockItem">Stock Item Master File</a></li>
                                <li><a class="dropdown-item" runat="server" href="~/Pages/MasterFiles/Category">Category Master File</a></li>
                                <li><a class="dropdown-item" runat="server" href="~/Pages/MasterFiles/Brand">Brand Master File</a></li>
                                <li><a class="dropdown-item" runat="server" href="~/Pages/MasterFiles/Model">Model Master File</a></li>
                                <li><a class="dropdown-item" runat="server" href="~/Pages/MasterFiles/Rack">Rack Master File</a></li>
                                <li><a class="dropdown-item" runat="server" href="~/Pages/MasterFiles/Bank">Bank Master File</a></li>
                                <li><a class="dropdown-item" runat="server" href="~/Pages/MasterFiles/BankBranch">Bank Branch Master File</a></li>
                                <li><a class="dropdown-item" runat="server" href="~/Pages/MasterFiles/BankAccount">Bank Account Master File</a></li>
                                <li><a class="dropdown-item" runat="server" href="~/Pages/MasterFiles/ChequeRegistry">Customer Cheque Registry</a></li>
                                <li><a class="dropdown-item" runat="server" href="~/Pages/MasterFiles/ChequeBanking">Customer Cheque Banking</a></li>
                            </ul>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="viewDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">VIEW
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="viewDropdown">
                                <li><a class="dropdown-item" runat="server" href="~/Pages/View/CustomerLedger">Customer Ledger</a></li>
                                <li><a class="dropdown-item" runat="server" href="~/Pages/View/RepCommision">Sales Rep Commision</a></li>
                                <li><a class="dropdown-item" runat="server" href="~/Pages/View/BinCard">Bin Card</a></li>
                                <li><a class="dropdown-item" runat="server" href="~/Pages/View/StockValuation-StockWise">Stock Valuation-Stock Wise</a></li>
                                <li><a class="dropdown-item" runat="server" href="~/Pages/View/StockValuation-ItemWise">Stock Valuation-Item Wise</a></li>
                                <li><a class="dropdown-item" runat="server" href="~/Pages/View/Transaction-Customer">Transaction-Customer</a></li>
                                <li><a class="dropdown-item" runat="server" href="~/Pages/View/Transaction-Vendor">Transaction-Internal</a></li>
                                <li><a class="dropdown-item" runat="server" href="~/Pages/View/Transaction-Commision">Transaction-Commision</a></li>
                                <li><a class="dropdown-item" runat="server" href="~/Pages/View/Transaction-Advance">Advance-Commision</a></li>
                            </ul>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="customerDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">CUSTOMER'S TRANSACTIONS
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="customerDropdown">
                                <li><a class="dropdown-item" runat="server" href="~/Pages/CustomerTransaction/CustomerCreditNote">Customer Credit Note</a></li>
                                <li><a class="dropdown-item" runat="server" href="~/Pages/CustomerTransaction/CustomerDebitNote">Customer Debit Note</a></li>
                                <li><a class="dropdown-item" runat="server" href="~/Pages/CustomerTransaction/CustomerGoodsReturn">Customer Goods Return</a></li>
                                <li><a class="dropdown-item" runat="server" href="~/Pages/CustomerTransaction/CustomerPaymentReciept">Customer Payment Reciept</a></li>
                                <li><a class="dropdown-item" runat="server" href="~/Pages/CustomerTransaction/Invoice">Invoice</a></li>
                            </ul>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="vendorDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">VENDOR'S TRANSACTIONS
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="vendorDropdown">
                                <li><a class="dropdown-item" runat="server" href="~/Pages/VendorTransaction/VendorCreditNote">Vendor Credit Note</a></li>
                                <li><a class="dropdown-item" runat="server" href="~/Pages/VendorTransaction/VendorDebitNote">Vendor Debit Note</a></li>
                                <li><a class="dropdown-item" runat="server" href="~/Pages/VendorTransaction/GoodRecievedMemo">Good Recieved Memo</a></li>
                                <li><a class="dropdown-item" runat="server" href="~/Pages/VendorTransaction/VendorChequeIssue">Vendor Cheque Issue</a></li>
                                <li><a class="dropdown-item" runat="server" href="~/Pages/VendorTransaction/GRMReturn">Good Recieved Memo Return</a></li>
                            </ul>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="reportDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">REPORT
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="reportDropdown">
                                <li><a class="dropdown-item" href="#">Option 1</a></li>
                                <li><a class="dropdown-item" href="#">Option 2</a></li>
                            </ul>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="itemDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">ITEM
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="itemDropdown">
                                <li><a class="dropdown-item" href="#">Option 1</a></li>
                                <li><a class="dropdown-item" href="#">Option 2</a></li>
                            </ul>
                        </li>
                    </ul>
                    <a href="#" class="logout-btn">LOGOUT</a>
                </div>
            </div>
        </nav>
        <div class="container mt-4 modules-container">
            <!-- First row of modules -->
            <div class="row g-4 modules-row">
                <div class="col-md-4 col-lg-2 offset-lg-1">
                    <div class="module-card">
                        <img src="~/Content/src/customer-icon.png" alt="Customers" runat="server" />
                        <h3>Customers</h3>
                    </div>
                </div>
                <div class="col-md-4 col-lg-2">
                    <div class="module-card">
                        <img src="~/Content/src/items-icon.png" alt="Items" runat="server" />
                        <h3>Items</h3>
                    </div>
                </div>
                <div class="col-md-4 col-lg-2">
                    <div class="module-card">
                        <img src="~/Content/src/vendors-icon.png" alt="Vendors" runat="server" />
                        <h3>Vendors</h3>
                    </div>
                </div>
                <div class="col-md-4 col-lg-2">
                    <div class="module-card">
                        <img src="~/Content/src/invoice-icon.png" alt="Invoice" runat="server" />
                        <h3>Invoice</h3>
                    </div>
                </div>
                <div class="col-md-4 col-lg-2">
                    <div class="module-card">
                        <img src="~/Content/src/grn-icon.png" alt="GRN" runat="server" />
                        <h3>GRN</h3>
                    </div>
                </div>
            </div>

            <!-- Second row of modules -->
            <div class="row g-4 modules-row">
                <div class="col-md-4 col-lg-2 offset-lg-1">
                    <div class="module-card">
                        <img src="~/Content/src/receipt-icon.png" alt="Receipt" runat="server" />
                        <h3>Receipt</h3>
                    </div>
                </div>
                <div class="col-md-4 col-lg-2">
                    <div class="module-card">
                        <img src="~/Content/src/ledger-icon.png" alt="Ledger" runat="server" />
                        <h3>Ledger</h3>
                    </div>
                </div>
                <div class="col-md-4 col-lg-2">
                    <div class="module-card">
                        <img src="~/Content/src/crm-icon.png" alt="GRM" runat="server" />
                        <h3>GRM</h3>
                    </div>
                </div>
                <div class="col-md-4 col-lg-2">
                    <div class="module-card">
                        <img src="~/Content/src/cashier-icon.png" alt="Cashier" runat="server" />
                        <h3>Cashier</h3>
                    </div>
                </div>
                <div class="col-md-4 col-lg-2">
                    <div class="module-card">
                        <img src="~/Content/src/quotation-icon.png" alt="Quotation" runat="server" />
                        <h3>Quotation</h3>
                    </div>
                </div>
            </div>

            <!-- Banner -->
            <div class="banner">
                <div class="banner-content">
                    <h1>New Top Product</h1>
                    <h2>High Quality</h2>
                </div>
            </div>
        </div>
        <footer class="footer">
            <p>&copy; <%: DateTime.Now.Year %> - Developed by G3 Technologies (Pvt) Ltd</p>
        </footer>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
