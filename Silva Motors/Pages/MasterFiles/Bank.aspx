<%@ Page Title="Bank Management" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Bank.aspx.cs" Inherits="Silva_Motors.Pages.MasterFiles.Bank" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href='<%= ResolveUrl("~/Content/CustomCSS/MasterFiles/BankCSS.css") %>' />

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">

    <!-- Add Bootstrap Icons -->
    <!-- Add SweetAlert2 CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/11.7.3/sweetalert2.min.css" />

    <div class="main">
        <asp:Label ID="lblHeader" runat="server" Text="BANKS" CssClass="header"></asp:Label>

        <asp:Panel CssClass="d-flex justify-content-between mb-3" runat="server">
            <asp:Button ID="btnFilters" runat="server" Text="Filters" CssClass="filters-button" OnClick="btnFilters_Click" />
            <asp:Button ID="btnAddBank" runat="server" Text="ADD" CssClass="add-button" OnClientClick="prepareAddModal(); return false;" />
        </asp:Panel>

        <asp:UpdatePanel ID="upBanks" runat="server">
            <ContentTemplate>
                <asp:GridView ID="gvbanks" runat="server" AutoGenerateColumns="false"
                    CssClass="table table-bordered bank-table" Width="100%"
                    OnRowCommand="gvbanks_RowCommand" DataKeyNames="Id">
                    <Columns>
                        <asp:BoundField DataField="Code" HeaderText="CODE" />
                        <asp:BoundField DataField="BankId" HeaderText="BANK ID" />
                        <asp:BoundField DataField="BankName" HeaderText="BANK NAME" />
                        <asp:BoundField DataField="User" HeaderText="USER" />
                        <asp:BoundField DataField="Date" HeaderText="DATE" />
                        <asp:TemplateField HeaderText="STATUS">
                            <ItemTemplate>
                                <asp:Label ID="lblStatus" runat="server" CssClass='<%# Convert.ToBoolean(Eval("ActiveState")) ? "status-badge status-active" : "status-badge status-inactive" %>'
                                    Text='<%# Convert.ToBoolean(Eval("ActiveState")) ? "Active" : "Inactive" %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ACTIONS">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbtnEdit" runat="server" CssClass="btn btn-warning btn-sm"
                                    OnClientClick='<%# "prepareEditModal(" + Eval("Id") + ", \"" + Eval("Code") + "\", \"" + Eval("BankId") + "\", \"" + Eval("BankName") + "\", " + Eval("ActiveState").ToString().ToLower() + "); return false;" %>'>
                                    <i class="bi bi-pencil-fill"></i>
                                </asp:LinkButton>
                                <asp:LinkButton ID="lbtnDelete" runat="server" CssClass="btn btn-danger btn-sm"
                                    OnClientClick='<%# "confirmDelete(" + Eval("Id") + "); return false;" %>'>
                                    <i class="bi bi-trash"></i>
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <HeaderStyle BackColor="Black" ForeColor="White" />
                    <RowStyle BackColor="#e0e0e0" />
                    <AlternatingRowStyle BackColor="White" />
                    <EmptyDataTemplate>
                        <div class="text-center p-3">No bank records found.</div>
                    </EmptyDataTemplate>
                </asp:GridView>

                <asp:Panel CssClass="d-flex justify-content-center mt-3" runat="server">
                    <asp:Repeater ID="rptPagination" runat="server" OnItemCommand="rptPagination_ItemCommand">
                        <ItemTemplate>
                            <asp:LinkButton ID="btnPage" runat="server" Text='<%# Eval("PageNumber") %>'
                                CssClass='<%# Convert.ToInt32(Eval("PageNumber")) == CurrentPage ? "pagination-link active" : "pagination-link" %>'
                                CommandName="Page" CommandArgument='<%# Eval("PageNumber") %>'></asp:LinkButton>
                        </ItemTemplate>
                    </asp:Repeater>
                </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>

        <!-- Modal Popup -->
        <div class="modal fade" id="bankModal" tabindex="-1" role="dialog" aria-labelledby="bankModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="bankModalLabel">Add Bank</h5>
                        <asp:Button ID="btnCloseModal" runat="server" CssClass="close" 
                            Style="border:none;" OnClientClick="$('#myModal').modal('hide'); return false;" />
                        <span aria-hidden="true">&times;</span>
                    </div>
                    <div class="modal-body">
                        <asp:UpdatePanel ID="upModal" runat="server">
                            <ContentTemplate>
                                <asp:HiddenField ID="hfBankId" runat="server" Value="0" />
                                <div class="form-group row mb-3">
                                    <asp:Label ID="lblCode" runat="server" Text="Code" CssClass="col-sm-3 col-form-label"></asp:Label>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="txtCode" runat="server" CssClass="form-control" MaxLength="20"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvCode" runat="server"
                                            ControlToValidate="txtCode" Display="Dynamic"
                                            ErrorMessage="Code is required." CssClass="text-danger"
                                            ValidationGroup="BankValidation"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="form-group row mb-3">
                                    <asp:Label ID="lblBankId" runat="server" Text="Bank ID" CssClass="col-sm-3 col-form-label"></asp:Label>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="txtBankId" runat="server" CssClass="form-control" MaxLength="50"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvBankId" runat="server"
                                            ControlToValidate="txtBankId" Display="Dynamic"
                                            ErrorMessage="Bank ID is required." CssClass="text-danger"
                                            ValidationGroup="BankValidation"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="form-group row mb-3">
                                    <asp:Label ID="lblBankName" runat="server" Text="Bank Name" CssClass="col-sm-3 col-form-label"></asp:Label>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="txtBankName" runat="server" CssClass="form-control" MaxLength="100"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvBankName" runat="server"
                                            ControlToValidate="txtBankName" Display="Dynamic"
                                            ErrorMessage="Bank Name is required." CssClass="text-danger"
                                            ValidationGroup="BankValidation"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="btnCancel" runat="server" CssClass="btn btn-secondary" Text="Cancel" OnClick="btnCancel_Click" />
                        <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary add-button"
                            OnClientClick="return validateForm();" OnClick="btnSave_Click" ValidationGroup="BankValidation" UseSubmitBehavior="false" />
                    </div>
                </div>
            </div>
        </div>

        <!-- Hidden fields for SweetAlert callbacks -->
        <asp:HiddenField ID="hfDeleteId" runat="server" />
        <asp:Button ID="btnConfirmDelete" runat="server" Text="Delete" Style="display: none;"
            OnClick="btnConfirmDelete_Click" UseSubmitBehavior="false" />

        <!-- Success message placeholder -->
        <asp:HiddenField ID="hfSuccessMessage" runat="server" />
        <asp:HiddenField ID="hfErrorMessage" runat="server" />
    </div>

    <!-- Add SweetAlert2 JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/11.7.3/sweetalert2.all.min.js"></script>

    <!-- Client-side script for modal handling with SweetAlert2 -->
    <script type="text/javascript">
        // Function to show success message
        function showSuccessMessage(message) {
            Swal.fire({
                title: 'Success!',
                text: message,
                icon: 'success',
                confirmButtonColor: '#3085d6',
                confirmButtonText: 'OK'
            });
        }

        // Function to show error message
        function showErrorMessage(message) {
            Swal.fire({
                title: 'Error!',
                text: message,
                icon: 'error',
                confirmButtonColor: '#d33',
                confirmButtonText: 'OK'
            });
        }

        // Function to validate form before submission
        function validateForm() {
            if (Page_ClientValidate('BankValidation')) {
                // Show loading state
                Swal.fire({
                    title: 'Processing...',
                    text: 'Please wait while we save your data.',
                    allowOutsideClick: false,
                    allowEscapeKey: false,
                    showConfirmButton: false,
                    didOpen: () => {
                        Swal.showLoading();
                    }
                });
                return true;
            }
            return false;
        }

        // Function to prepare the modal for adding a new bank
        function prepareAddModal() {
            document.getElementById('<%= hfBankId.ClientID %>').value = '0';
            document.getElementById('<%= txtCode.ClientID %>').value = '';
            document.getElementById('<%= txtBankId.ClientID %>').value = '';
            document.getElementById('<%= txtBankName.ClientID %>').value = '';
            document.getElementById('bankModalLabel').innerText = 'Add Bank';
            $('#bankModal').modal('show');
        }

        // Function to prepare the modal for editing an existing bank
        function prepareEditModal(id, code, bankId, bankName, active) {
            document.getElementById('<%= hfBankId.ClientID %>').value = id;
            document.getElementById('<%= txtCode.ClientID %>').value = code;
            document.getElementById('<%= txtBankId.ClientID %>').value = bankId;
            document.getElementById('<%= txtBankName.ClientID %>').value = bankName;
            document.getElementById('bankModalLabel').innerText = 'Edit Bank';
            $('#bankModal').modal('show');
        }

        // Function to confirm deletion with SweetAlert2
        function confirmDelete(id) {
            Swal.fire({
                title: 'Are you sure?',
                text: "You won't be able to revert this!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#d33',
                cancelButtonColor: '#3085d6',
                confirmButtonText: 'Yes, delete it!',
                cancelButtonText: 'Cancel'
            }).then((result) => {
                if (result.isConfirmed) {
                    document.getElementById('<%= hfDeleteId.ClientID %>').value = id;
                    // Show loading
                    Swal.fire({
                        title: 'Deleting...',
                        text: 'Please wait while we delete the record.',
                        allowOutsideClick: false,
                        allowEscapeKey: false,
                        showConfirmButton: false,
                        didOpen: () => {
                            Swal.showLoading();
                        }
                    });
                    // Trigger the server-side delete
                    document.getElementById('<%= btnConfirmDelete.ClientID %>').click();
                }
            });
        }

        // Check for success or error messages on page load and after AJAX updates
        function pageLoad() {
            const successMsg = document.getElementById('<%= hfSuccessMessage.ClientID %>').value;
            const errorMsg = document.getElementById('<%= hfErrorMessage.ClientID %>').value;

            if (successMsg && successMsg.length > 0) {
                showSuccessMessage(successMsg);
                document.getElementById('<%= hfSuccessMessage.ClientID %>').value = '';
            }

            if (errorMsg && errorMsg.length > 0) {
                showErrorMessage(errorMsg);
                document.getElementById('<%= hfErrorMessage.ClientID %>').value = '';
            }
        }
    </script>
</asp:Content>