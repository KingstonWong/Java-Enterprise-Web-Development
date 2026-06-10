<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ page import="java.util.List" %>
        <%@ page import="Models.Book" %>
            <%@ page import="Models.Member" %>
                <jsp:include page="Layout/header.jsp" />

                <!-- Select2 CSS -->
                <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css"
                    rel="stylesheet" />

                <style>
                    /* Custom Select2 Styling to match existing UI */
                    .select2-container--default .select2-selection--single {
                        height: 50px;
                        padding: 10px 16px;
                        border-radius: 12px;
                        border: 1.5px solid #eef2f6;
                        background-color: #f8fafc;
                        font-size: 1rem;
                        display: flex;
                        align-items: center;
                        outline: none;
                    }

                    .select2-container--default .select2-selection--single .select2-selection__arrow {
                        height: 48px;
                        right: 12px;
                    }

                    .select2-container--default .select2-selection--single .select2-selection__rendered {
                        line-height: normal;
                        color: #4b5563;
                        padding-left: 0;
                    }

                    .select2-container--default.select2-container--open .select2-selection--single {
                        border-color: #1877f2;
                        background: white;
                        box-shadow: 0 0 0 4px rgba(24, 119, 242, 0.1);
                    }

                    .select2-dropdown {
                        border: 1.5px solid #eef2f6;
                        border-radius: 12px;
                        box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
                        overflow: hidden;
                    }

                    .select2-container--default .select2-search--dropdown .select2-search__field {
                        border: 1.5px solid #eef2f6;
                        border-radius: 8px;
                        padding: 8px 12px;
                        outline: none;
                    }

                    .select2-container--default .select2-search--dropdown .select2-search__field:focus {
                        border-color: #1877f2;
                    }

                    .select2-container--default .select2-results__option--highlighted.select2-results__option--selectable {
                        background-color: #f0f7ff;
                        color: #1877f2;
                    }
                </style>

                <div class="page-header" style="margin-bottom: 32px;">
                    <div class="page-title">
                        <h1 style="font-size: 2.25rem; font-weight: 800; color: #1c1e21;">New Walk-in Borrowing</h1>
                        <p style="color: #65676b; font-size: 1.125rem;">Create a manual borrowing record for a walk-in
                            member.</p>
                    </div>
                </div>

                <div class="card"
                    style="border: none; box-shadow: 0 10px 30px rgba(0,0,0,0.06); border-radius: 20px; background: white; padding: 32px; max-width: 800px; margin: 0 auto;">
                    <form action="Borrow" method="get">
                        <input type="hidden" name="action" value="insertWalkin">

                        <div class="form-grid" style="display: grid; grid-template-columns: 1fr; gap: 24px;">
                            <div class="form-group">
                                <label class="form-label"
                                    style="font-weight: 700; display: block; margin-bottom: 8px; color: #4b5563;">Select
                                    Member</label>
                                <div style="display: flex; gap: 8px;">
                                    <select name="member_id" id="member_select" required
                                        style="flex: 1; padding: 12px 16px; border-radius: 12px; border: 1.5px solid #eef2f6; background: #f8fafc; font-size: 1rem; outline: none;">
                                        <option value="">-- Choose Member --</option>
                                        <% List<Member> members = (List<Member>) request.getAttribute("members");
                                                if (members != null) {
                                                for (Member m : members) { %>
                                                <option value="<%= m.getMember_id() %>"
                                                    data-membership-id="<%= m.getMembership_id() %>">
                                                    <%= m.getMember_name() %> (ID: <%= m.getMember_id() %>)
                                                </option>
                                                <% } } %>
                                    </select>
                                    <button type="button" onclick="startScan('member')" title="Scan Member QR"
                                        style="width:50px; border-radius:12px; border:none; background:#e7f3ff; color:#1877f2; cursor:pointer; display:flex; align-items:center; justify-content:center;">
                                        <span class="material-symbols-outlined">qr_code_scanner</span>
                                    </button>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="form-label"
                                    style="font-weight: 700; display: block; margin-bottom: 8px; color: #4b5563;">Select
                                    Book</label>
                                <div style="display: flex; gap: 8px;">
                                    <select name="book_id" id="book_select" required
                                        style="flex: 1; padding: 12px 16px; border-radius: 12px; border: 1.5px solid #eef2f6; background: #f8fafc; font-size: 1rem; outline: none;">
                                        <option value="">-- Choose Book --</option>
                                        <% List<Book> books = (List<Book>) request.getAttribute("books");
                                                if (books != null) {
                                                for (Book b : books) {
                                                if (b.getAvailable_copies() > 0) { %>
                                                <option value="<%= b.getBook_id() %>">
                                                    <%= b.getTitle() %> (ID: <%= b.getBook_id() %>) - <%=
                                                                b.getAvailable_copies() %> available
                                                </option>
                                                <% } } } %>
                                    </select>
                                    <button type="button" onclick="startScan('book')" title="Scan Book QR"
                                        style="width:50px; border-radius:12px; border:none; background:#e7f3ff; color:#1877f2; cursor:pointer; display:flex; align-items:center; justify-content:center;">
                                        <span class="material-symbols-outlined">qr_code_scanner</span>
                                    </button>
                                </div>
                            </div>
                        </div>

                        <div
                            style="margin-top: 40px; display: flex; gap: 16px; padding-top: 32px; border-top: 2px solid #f8fafc;">
                            <button type="submit" class="btn-primary"
                                style="flex: 1; padding: 14px; border-radius: 12px; font-weight: 700; background: var(--primary-gradient); border: none; color: white; cursor: pointer; display: flex; align-items: center; justify-content: center; gap: 8px; box-shadow: 0 4px 12px rgba(24, 119, 242, 0.2);">
                                <span class="material-symbols-outlined">check_circle</span>
                                Confirm Borrowing
                            </button>
                            <a href="Borrow?action=list" class="btn-secondary"
                                style="flex: 1; padding: 14px; border-radius: 12px; font-weight: 700; background: #f1f5f9; color: #4b5563; text-decoration: none; text-align: center; border: none; display: flex; align-items: center; justify-content: center; gap: 8px;">
                                <span class="material-symbols-outlined">close</span>
                                Cancel
                            </a>
                        </div>
                    </form>
                </div>

                <!-- jQuery and Select2 JS -->
                <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
                <!-- HTML5 QR Code Scanner JS and SweetAlert2 -->
                <script src="https://unpkg.com/html5-qrcode" type="text/javascript"></script>
                <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

                <script>
                    $(document).ready(function () {
                        $('#member_select').select2({
                            placeholder: "Search for a member...",
                            allowClear: true,
                            width: '100%'
                        });

                        $('#book_select').select2({
                            placeholder: "Search for a book...",
                            allowClear: true,
                            width: '100%'
                        });
                    });

                    let html5QrcodeScanner = null;

                    function startScan(target) {
                        Swal.fire({
                            title: 'Scan QR Code',
                            html: '<div id="reader" style="width: 100%; max-width: 500px; margin: 0 auto;"></div>',
                            showCancelButton: true,
                            showConfirmButton: false,
                            cancelButtonText: 'Cancel',
                            didOpen: () => {
                                function onScanSuccess(decodedText, decodedResult) {
                                    console.log(`Scan result: ${decodedText}`);
                                    html5QrcodeScanner.clear(); // stop scanning
                                    Swal.close();

                                    if (target === 'member') {
                                        // Find option with matching data-membership-id
                                        let found = false;
                                        $('#member_select option').each(function () {
                                            if ($(this).data('membership-id') === decodedText) {
                                                $('#member_select').val($(this).val()).trigger('change');
                                                found = true;
                                                return false; // break loop
                                            }
                                        });

                                        if (!found) {
                                            Swal.fire('Error', 'Member ID ' + decodedText + ' not found!', 'error');
                                        } else {
                                            Swal.fire('Success', 'Member selected successfully!', 'success');
                                        }
                                    } else if (target === 'book') {
                                        // Find option with matching direct value (Book ID)
                                        let optionVal = decodedText;
                                        if ($("#book_select option[value='" + optionVal + "']").length > 0) {
                                            $('#book_select').val(optionVal).trigger('change');
                                            Swal.fire('Success', 'Book selected successfully!', 'success');
                                        } else {
                                            Swal.fire('Error', 'Book ID ' + decodedText + ' not found or unavailable!', 'error');
                                        }
                                    }
                                }

                                function onScanFailure(error) {
                                    // handle scan failure, usually better to ignore and keep scanning.
                                }

                                html5QrcodeScanner = new Html5QrcodeScanner(
                                    "reader",
                                    { fps: 10, qrbox: { width: 250, height: 250 } },
                                    /* verbose= */ false);
                                html5QrcodeScanner.render(onScanSuccess, onScanFailure);
                            },
                            willClose: () => {
                                if (html5QrcodeScanner) {
                                    html5QrcodeScanner.clear().catch(error => {
                                        console.error("Failed to clear html5QrcodeScanner. ", error);
                                    });
                                }
                            }
                        });
                    }
                </script>

                <jsp:include page="Layout/footer.jsp" />