<%@ Page Title="Brand Management" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Brand.aspx.cs" Inherits="Silva_Motors.Pages.MasterFiles.Brand" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href='<%= ResolveUrl("~/Content/CustomCSS/MasterFiles/BrandCSS.css") %>' />

    <!-- Add Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">

    <!-- Add SweetAlert2 CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/11.7.3/sweetalert2.min.css" />

    <div class="main">
        <asp:Label ID="lblHeader" runat="server" Text="ITEM BRAND" CssClass="header"></asp:Label>

        <asp:Panel CssClass="d-flex justify-content-between mb-3" runat="server">
            <asp:Button ID="btnFilters" runat="server" Text="Filters" CssClass="filters-button" OnClick="btnFilters_Click" />
            <asp:Button ID="btnAddBrand" runat="server" Text="ADD" CssClass="add-button" OnClientClick="prepareAddModal(); return false;" />
        </asp:Panel>

        <asp:UpdatePanel ID="upBrands" runat="server">
            <ContentTemplate>
                <asp:GridView ID="gvbrands" runat="server" AutoGenerateColumns="false"
                    CssClass="table table-bordered brand-table" Width="100%"
                    OnRowCommand="gvbrands_RowCommand" DataKeyNames="Id">
                    <Columns>
                        <asp:BoundField DataField="Code" HeaderText="CODE" />
                        <asp:BoundField DataField="Name" HeaderText="NAME" />
                        <asp:TemplateField HeaderText="STATUS">
                            <ItemTemplate>
                                <asp:Label ID="lblStatus" runat="server" CssClass='<%# Convert.ToBoolean(Eval("ActiveState")) ? "status-badge status-active" : "status-badge status-inactive" %>'
                                    Text='<%# Convert.ToBoolean(Eval("ActiveState")) ? "Active" : "Inactive" %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ACTIONS">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbtnEdit" runat="server" CssClass="btn btn-warning btn-sm"
                                    OnClientClick='<%# "prepareEditModal(" + Eval("Id") + ", \"" + Eval("Code") + "\", \"" + Eval("Name") + "\", " + Eval("ActiveState").ToString().ToLower() + "); return false;" %>'>
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
                        <div class="text-center p-3">No brand records found.</div>
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
        <div class="modal fade" id="brandModal" tabindex="-1" role="dialog" aria-labelledby="brandModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="brandModalLabel">Add Brand</h5>
                        <button type="button" class="close" style="border:none;" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <asp:UpdatePanel ID="upModal" runat="server">
                            <ContentTemplate>
                                <asp:HiddenField ID="hfBrandId" runat="server" Value="0" />
                                <div class="form-group row mb-3">
                                    <asp:Label ID="lblCode" runat="server" Text="Code" CssClass="col-sm-3 col-form-label"></asp:Label>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="txtCode" runat="server" CssClass="form-control" MaxLength="20"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvCode" runat="server"
                                            ControlToValidate="txtCode" Display="Dynamic"
                                            ErrorMessage="Code is required." CssClass="text-danger"
                                            ValidationGroup="BrandValidation"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="form-group row mb-3">
                                    <asp:Label ID="lblName" runat="server" Text="Name" CssClass="col-sm-3 col-form-label"></asp:Label>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control" MaxLength="100"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvName" runat="server"
                                            ControlToValidate="txtName" Display="Dynamic"
                                            ErrorMessage="Name is required." CssClass="text-danger"
                                            ValidationGroup="BrandValidation"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                        <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary add-button"
                            OnClientClick="return validateForm();" OnClick="btnSave_Click" ValidationGroup="BrandValidation" UseSubmitBehavior="false" />
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

        <%--<!-- Add UpdatePanel Trigger -->
        <asp:AsyncPostBackTrigger ControlID="btnSave" EventName="Click" />
        <asp:AsyncPostBackTrigger ControlID="btnConfirmDelete" EventName="Click" />--%>
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
            if (Page_ClientValidate('BrandValidation')) {
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

        // Function to prepare the modal for adding a new brand
        function prepareAddModal() {
            document.getElementById('<%= hfBrandId.ClientID %>').value = '0';
            document.getElementById('<%= txtCode.ClientID %>').value = '';
            document.getElementById('<%= txtName.ClientID %>').value = '';
            document.getElementById('brandModalLabel').innerText = 'Add Brand';
            $('#brandModal').modal('show');
        }

        // Function to prepare the modal for editing an existing brand
        function prepareEditModal(id, code, name, active) {
            document.getElementById('<%= hfBrandId.ClientID %>').value = id;
            document.getElementById('<%= txtCode.ClientID %>').value = code;
            document.getElementById('<%= txtName.ClientID %>').value = name;
            document.getElementById('brandModalLabel').innerText = 'Edit Brand';
            $('#brandModal').modal('show');
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
