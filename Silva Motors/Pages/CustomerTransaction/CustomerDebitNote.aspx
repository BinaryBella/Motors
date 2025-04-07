<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CustomerDebitNote.aspx.cs" Inherits="Silva_Motors.Pages.CustomerTransaction.CustomerDebitNote" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href='<%= ResolveUrl("~/Content/CustomCSS/CustomerTransaction/CustomerDebitNote.css") %>' />
    <!-- Select2 CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" rel="stylesheet" />
    <!-- Custom Select2 Bootstrap Theme -->
    <link href="https://cdn.jsdelivr.net/npm/select2-bootstrap-5-theme@1.3.0/dist/select2-bootstrap-5-theme.min.css" rel="stylesheet" />
    <!-- SweetAlert2 -->
    <link href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <div class="main">
        <div class="header">CUSTOMER DEBIT NOTE</div>

        <div class="row">
            <div class="col-12">
                <div class="content-container">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group mb-3">
                                  <asp:Label runat="server" CssClass="form-label" AssociatedControlID="txt_SearchCustomerId">Select Customer</asp:Label>
                                <asp:DropDownList ID="txt_SearchCustomerId" CssClass="form-control select-customer" runat="server"
                                    AutoPostBack="true">
                                </asp:DropDownList>
                            </div>
                            <div class="customer-info">
                                <div class="form-group mb-2">
                                    <asp:Label runat="server" CssClass="form-label" AssociatedControlID="txt_CustomerName">Customer Name</asp:Label>
                                    <asp:TextBox ID="txt_CustomerName" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                </div>
                                <div class="form-group mb-2">
                                   <asp:Label runat="server" CssClass="form-label" AssociatedControlID="txt_CustomerAdd1">Address</asp:Label>
                                    <asp:TextBox ID="txt_CustomerAdd1" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                </div>
                                <div class="form-group mb-2">
                                    <asp:Label runat="server" CssClass="form-label" AssociatedControlID="txt_Contact1">Contact</asp:Label>
                                    <asp:TextBox ID="txt_Contact1" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group mb-3">
                                <asp:Label runat="server" CssClass="form-label" AssociatedControlID="TextBox4">Total Due Amount</asp:Label>
                                <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                            </div>
                            <div class="customer-info">
                                <div class="form-group mb-2">
                                    <asp:Label runat="server" CssClass="form-label" AssociatedControlID="TextBox1">Remaining Balance</asp:Label>
                                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                </div>
                                <div class="form-group mb-2">
                                    <asp:Label runat="server" CssClass="form-label" AssociatedControlID="date">Date</asp:Label>
                                    <asp:TextBox ID="date" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row mt-4">
                        <div class="col-md-6">
                            <div class="form-group mb-3">
                               <asp:Label runat="server" CssClass="form-label" AssociatedControlID="txt_Description">Description</asp:Label>
                                <asp:TextBox ID="txt_Description" runat="server" CssClass="form-control" placeholder="Description..."
                                    onkeydown="handleDescriptionKeyDown(event)"></asp:TextBox>
                            </div>
                            <span id="descriptionError" style="color: red; font-size: 12px;"></span>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group mb-3">
                                <asp:Label runat="server" CssClass="form-label" AssociatedControlID="txt_Amount">Amount</asp:Label>
                                <asp:TextBox ID="txt_Amount" runat="server" CssClass="form-control" placeholder="Enter amount..."
                                    oninput="calculateNewBalance()" onkeydown="handleAmountKeyDown(event)"></asp:TextBox>
                            </div>
                            <span id="amountError" style="color: red; font-size: 12px;"></span>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group mb-3 mt-5">
                                 <asp:CheckBox ID="returnCash" runat="server" CssClass="form-check-input" />
                                <asp:Label runat="server" AssociatedControlID="returnCash" CssClass="form-check-label">Return Money As Cash</asp:Label>
                            </div>
                        </div>
                    </div>

                    <div class="action-buttons mt-4">
                        <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary" Style="background-color: #B71D1D; border-color: #B71D1D; color: white;" />
                       <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn" Style="background-color: #D9D9D9;" OnClientClick="return false;" data-dismiss="modal" />
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Hidden field to store success/failure message from server -->
    <asp:HiddenField ID="hdnSaveStatus" runat="server" />
    <asp:HiddenField ID="hdnSaveMessage" runat="server" />

    <!-- jQuery and Select2 scripts -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>
    <!-- SweetAlert2 -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <script>
        $(document).ready(function () {
            // Initialize Select2 on the customer dropdown
            $("#<%= txt_SearchCustomerId.ClientID %>").select2({
                theme: "bootstrap-5",
                width: '100%',
                placeholder: "Select a customer",
                allowClear: true
            }).focus(); // Set initial focus on the customer dropdown

            // Reinitialize Select2 after asynchronous postback
            var prm = Sys.WebForms.PageRequestManager.getInstance();
            if (prm != null) {
                prm.add_endRequest(function (sender, e) {
                    $("#<%= txt_SearchCustomerId.ClientID %>").select2({
                        theme: "bootstrap-5",
                        width: '100%',
                        placeholder: "Select a customer",
                        allowClear: true
                    });

                    // After postback, check if customer is selected and focus description
                    if ($("#<%= txt_SearchCustomerId.ClientID %>").val() !== "" &&
                        $("#<%= txt_SearchCustomerId.ClientID %>").val() !== null) {
                        $("#<%= txt_Description.ClientID %>").focus();
                    } else {
                        $("#<%= txt_SearchCustomerId.ClientID %>").focus();
                    }

                    // Check for save status message after postback
                    checkSaveStatus();
                });
            }

            // Handle Enter key on Select2 dropdown - move to description
            $(".select2").on("keydown", function (e) {
                if (e.which === 13) { // Enter key
                    e.preventDefault();
                    $("#<%= txt_Description.ClientID %>").focus();
                }
            });

            // Custom key handler for Select2
            $("#<%= txt_SearchCustomerId.ClientID %>").on("select2:select", function (e) {
                setTimeout(function () {
                    $("#<%= txt_Description.ClientID %>").focus();
                }, 100);
            });

            // Check for save status on initial page load
            checkSaveStatus();
        });

        // Check save status and display appropriate SweetAlert
        function checkSaveStatus() {
            var status = $("#<%= hdnSaveStatus.ClientID %>").val();
            var message = $("#<%= hdnSaveMessage.ClientID %>").val();

            if (status === "success") {
                Swal.fire({
                    title: 'Success!',
                    text: message || 'Debit note has been saved successfully.',
                    icon: 'success',
                    confirmButtonColor: '#f0ad4e'
                }).then((result) => {
                    // Reset the form after successful save
                    clearForm();
                });
                // Clear the status to prevent showing again on next postback
                $("#<%= hdnSaveStatus.ClientID %>").val("");
            }
            else if (status === "error") {
                Swal.fire({
                    title: 'Error!',
                    text: message || 'There was an error saving the debit note.',
                    icon: 'error',
                    confirmButtonColor: '#dc3545'
                });
                // Clear the status to prevent showing again on next postback
                $("#<%= hdnSaveStatus.ClientID %>").val("");
            }
        }

        // Validate form before submitting
        function validateForm() {
            var isValid = true;

            // Clear previous errors
            $("#descriptionError").text("");
            $("#amountError").text("");
            $("#<%= txt_Description.ClientID %>").removeClass("input-error");
            $("#<%= txt_Amount.ClientID %>").removeClass("input-error");

            // Get values
            var description = $("#<%= txt_Description.ClientID %>").val().trim();
            var amountText = $("#<%= txt_Amount.ClientID %>").val().trim();

            // Regex to check valid decimal number (allows integers or numbers with up to 2 decimal places)
            var amountRegex = /^\d+(\.\d{1,2})?$/;

            // Validate description
            if (description === "") {
                $("#descriptionError").text("Description is required.");
                $("#<%= txt_Description.ClientID %>").addClass("input-error");
                isValid = false;
            }

            // Validate amount
            if (amountText === "") {
                $("#amountError").text("Amount is required.");
                $("#<%= txt_Amount.ClientID %>").addClass("input-error");
                isValid = false;
            } else if (!amountRegex.test(amountText)) {
                $("#amountError").text("Amount must be a valid number (e.g., 100 or 100.50).");
                $("#<%= txt_Amount.ClientID %>").addClass("input-error");
                isValid = false;
            } else if (parseFloat(amountText) <= 0) {
                $("#amountError").text("Amount must be greater than zero.");
                $("#<%= txt_Amount.ClientID %>").addClass("input-error");
                isValid = false;
            }

            return isValid;
        }

        // Add real-time validation for description field
        $(document).ready(function () {
            // Existing document.ready code...

            // Add blur event for description validation
            $("#<%= txt_Description.ClientID %>").blur(function () {
                var description = $(this).val().trim();
                if (description === "") {
                    $("#descriptionError").text("Description is required.");
                    $(this).addClass("input-error");
                } else {
                    $("#descriptionError").text("");
                    $(this).removeClass("input-error");
                }
            });

            // Add input event for amount validation
            $("#<%= txt_Amount.ClientID %>").on("input blur", function () {
                var amountText = $(this).val().trim();
                var amountRegex = /^\d+(\.\d{1,2})?$/;

                if (amountText === "") {
                    $("#amountError").text("Amount is required.");
                    $(this).addClass("input-error");
                } else if (!amountRegex.test(amountText)) {
                    $("#amountError").text("Amount must be a valid number (e.g., 100 or 100.50).");
                    $(this).addClass("input-error");
                } else if (parseFloat(amountText) <= 0) {
                    $("#amountError").text("Amount must be greater than zero.");
                    $(this).addClass("input-error");
                } else {
                    $("#amountError").text("");
                    $(this).removeClass("input-error");
                }

                // Update save button state based on validation
                updateSaveButtonState();
            });
        });

        // Update save button state based on form validation
        function updateSaveButtonState() {
            var description = $("#<%= txt_Description.ClientID %>").val().trim();
            var amountText = $("#<%= txt_Amount.ClientID %>").val().trim();
            var amountRegex = /^\d+(\.\d{1,2})?$/;

            if (description !== "" && amountText !== "" && amountRegex.test(amountText) && parseFloat(amountText) > 0) {
                enableSaveButton();
            } else {
                disableSaveButton();
            }
        }


        // Handle Enter key in description box - move to amount
        function handleDescriptionKeyDown(e) {
            if (e.keyCode === 13) { // Enter key
                e.preventDefault();
                document.getElementById('<%= txt_Amount.ClientID %>').focus();
            }
        }

  
        }

        // Clear form function
        function clearForm() {
            document.getElementById('<%= txt_Description.ClientID %>').value = '';
            document.getElementById('<%= txt_Amount.ClientID %>').value = '';
            $("#<%= txt_SearchCustomerId.ClientID %>").val('').trigger('change');
            disableSaveButton();

            // Set focus back to customer dropdown
            $("#<%= txt_SearchCustomerId.ClientID %>").focus();
        }
    </script>
</asp:Content>
