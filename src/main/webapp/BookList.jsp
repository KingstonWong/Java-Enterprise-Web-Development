<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ page import="java.util.List" %>
        <%@ page import="Models.Book" %>

            <jsp:include page="Layout/header.jsp" />

            <div class="page-header" style="margin-bottom: 32px;">
                <div class="page-title">
                    <h1 style="font-size: 2.25rem; font-weight: 800; letter-spacing: -0.02em; color: #1c1e21;">
                        Book Inventory
                    </h1>
                    <p style="color: #65676b; font-size: 1.125rem; margin-top: 4px;">
                        Manage, track, and organize the library's collection.
                    </p>
                </div>

                <a href="Books?action=new" class="btn-primary" style="padding: 12px 24px; border-radius: 12px; font-weight: 700;
       background: var(--primary-gradient);
       box-shadow: 0 4px 12px rgba(24, 119, 242, 0.2);">

                    <span class="material-symbols-outlined">add</span>
                    <span>Add New Book</span>
                </a>
            </div>


            <div class="search-container" style="margin-bottom: 32px;">

                <form action="Books" method="get" style="display: flex; gap: 12px; align-items: center;
background: white; padding: 16px; border-radius: 20px;
box-shadow: 0 10px 30px rgba(0,0,0,0.06);">

                    <input type="hidden" name="action" value="list">

                    <div style="position: relative; flex: 1; max-width: 500px;">

                        <span class="material-symbols-outlined" style="position: absolute; left: 16px; top: 50%;
transform: translateY(-50%); color: #65676b;">
                            search
                        </span>

                        <input type="text" name="search" placeholder="Search by title, author, ISBN or category..."
                            value="<%= request.getAttribute(" searchQuery") !=null ? request.getAttribute("searchQuery")
                            : "" %>"

                        style="width: 100%; padding: 14px 16px 14px 48px;
                        border-radius: 14px; border: 1.5px solid #eef2f6;
                        background: #f8fafc; font-size: 1rem; transition: all 0.2s; outline: none;"

                        onfocus="this.style.borderColor='#1877f2'; this.style.background='white';
                        this.style.boxShadow='0 0 0 4px rgba(24,119,242,0.1)';"

                        onblur="this.style.borderColor='#eef2f6'; this.style.background='#f8fafc';
                        this.style.boxShadow='none';">

                    </div>

                    <button type="submit" class="btn-primary" style="padding: 14px 28px; border-radius: 14px; font-weight: 700;
background: var(--primary-gradient); border: none; color: white;
cursor: pointer; display: flex; align-items: center; gap: 8px;
box-shadow: 0 4px 12px rgba(24,119,242,0.2);">

                        <span class="material-symbols-outlined" style="font-size: 20px;">search</span>
                        <span>Find Book</span>

                    </button>

                    <% if (request.getAttribute("searchQuery") !=null) { %>

                        <a href="Books?action=list" style="color: #65676b; text-decoration: none; font-weight: 700;
font-size: 0.875rem; margin-left: 12px; display: flex;
align-items: center; gap: 4px; padding: 12px 16px;
border-radius: 12px; transition: all 0.2s;" onmouseover="this.style.background='#f1f5f9'; this.style.color='#1c1e21'"
                            onmouseout="this.style.background='transparent'; this.style.color='#65676b'">

                            <span class="material-symbols-outlined" style="font-size: 18px;">close</span>
                            Clear

                        </a>

                        <% } %>

                </form>
            </div>


            <div class="card" style="border: none; box-shadow: 0 10px 30px rgba(0,0,0,0.06);
border-radius: 20px; overflow: hidden; background: white;">

                <table class="data-table" style="border-collapse: separate; border-spacing: 0;">

                    <thead>
                        <tr style="background: #f8fafc;">
                            <th style="padding: 20px 24px; font-size: 0.875rem; color: #4b5563; font-weight: 700;">
                                TITLE / AUTHOR
                            </th>

                            <th style="padding: 20px 24px; font-size: 0.875rem; color: #4b5563; font-weight: 700;">
                                ISBN
                            </th>

                            <th style="padding: 20px 24px; font-size: 0.875rem; color: #4b5563; font-weight: 700;">
                                CATEGORY
                            </th>

                            <th style="padding: 20px 24px; font-size: 0.875rem; color: #4b5563; font-weight: 700;">
                                COPIES
                            </th>

                            <th
                                style="padding: 20px 24px; font-size: 0.875rem; color: #4b5563; font-weight: 700; text-align:right;">
                                ACTIONS
                            </th>

                        </tr>
                    </thead>


                    <tbody>

                        <% List<Book> listBooks = (List<Book>) request.getAttribute("listBooks");

                                if (listBooks != null && !listBooks.isEmpty()) {

                                for (Book book : listBooks) {
                                %>

                                <tr style="transition: all 0.2s;" onmouseover="this.style.background='#f1f5f9'"
                                    onmouseout="this.style.background='white'">

                                    <td style="padding: 20px 24px;">

                                        <div style="display:flex; align-items:center; gap:16px;">

                                            <div style="width:48px; height:64px; background:#e2e8f0;
border-radius:8px; display:flex; align-items:center;
justify-content:center; overflow:hidden;">

                                                <% if (book.getCover_image() !=null && !book.getCover_image().isEmpty())
                                                    { %>

                                                    <img src="<%= book.getCover_image() %>"
                                                        style="width:100%; height:100%; object-fit:cover;">

                                                    <% } else { %>

                                                        <span class="material-symbols-outlined">auto_stories</span>

                                                        <% } %>

                                            </div>

                                            <div style="display:flex; flex-direction:column; gap:4px;">

                                                <span style="font-weight:700; color:#1c1e21;">
                                                    <%= book.getTitle() %>
                                                </span>

                                                <span style="color:#65676b; font-size:0.875rem;">
                                                    <%= book.getAuthor() %>
                                                </span>

                                            </div>

                                        </div>

                                    </td>


                                    <td style="padding:20px 24px;">
                                        <span style="font-family:monospace; font-weight:600;
color:#1877f2; background:#e7f3ff;
padding:4px 12px; border-radius:8px; font-size:0.875rem;">

                                            <%= book.getIsbn() %>

                                        </span>
                                    </td>


                                    <td style="padding:20px 24px; color:#4b5563;">
                                        <%= book.getCategory() %>
                                    </td>


                                    <td style="padding:20px 24px;">

                                        <%
                                        int avail = book.getAvailable_copies();

                                        String badgeBg = "#e8f5e9";   // Green
                                        String badgeColor = "#2e7d32";

                                        if (avail == 0) {
                                            badgeBg = "#fef2f2";      // Red
                                            badgeColor = "#d32f2f";
                                        }
                                        else if (avail <= 5) {
                                            badgeBg = "#fffadb";      // Yellow / Amber
                                            badgeColor = "#856404";
                                        }
                                        %>

                                            <span style="background:<%= badgeBg %>;
color:<%= badgeColor %>;
padding:6px 14px;
border-radius:9999px;
font-size:0.75rem;
font-weight:700;">

                                                <%= avail %> / <%= book.getTotal_copies() %>

                                            </span>

                                    </td>


                                    <td style="padding:20px 24px; text-align:right;">

                                        <div style="display:flex; justify-content:flex-end; gap:12px;">

                                            <a href="Books?action=view&id=<%= book.getBook_id() %>" title="View Details"
                                                style="width:36px;height:36px;border-radius:10px;
background:#e7f3ff;color:#1877f2;
display:flex;align-items:center;justify-content:center;
text-decoration:none;">

                                                <span class="material-symbols-outlined">visibility</span>

                                            </a>

                                            <button type="button"
                                                onclick="showBookQR('<%= book.getBook_id() %>', '<%= book.getTitle().replace("'", "\\'") %>')"
                                                title="Show QR Code" style="width:36px;height:36px;border-radius:10px;
background:#f3e8ff;color:#9333ea;
border:none; cursor:pointer;
display:flex;align-items:center;justify-content:center;
text-decoration:none;">

                                                <span class="material-symbols-outlined">qr_code_2</span>

                                            </button>


                                            <a href="Books?action=edit&id=<%= book.getBook_id() %>" title="Edit Book"
                                                style="width:36px;height:36px;border-radius:10px;
background:#f1f5f9;color:#1877f2;
display:flex;align-items:center;justify-content:center;
text-decoration:none;">

                                                <span class="material-symbols-outlined">edit</span>

                                            </a>


                                            <a href="Books?action=delete&id=<%= book.getBook_id() %>"
                                                title="Delete Book"
                                                onclick="return confirm('Permanent action: delete this book?')" style="width:36px;height:36px;border-radius:10px;
background:#fef2f2;color:#d32f2f;
display:flex;align-items:center;justify-content:center;
text-decoration:none;">

                                                <span class="material-symbols-outlined">delete</span>

                                            </a>

                                        </div>

                                    </td>

                                </tr>

                                <% } } else { %>

                                    <tr>
                                        <td colspan="5" style="text-align:center; padding:80px 40px; color:#65676b;">

                                            <span class="material-symbols-outlined"
                                                style="font-size:64px;color:#cbd5e1;">
                                                library_books
                                            </span>

                                            <div
                                                style="font-size:1.25rem;font-weight:700;color:#475569;margin-top:16px;">
                                                No Books Found
                                            </div>

                                        </td>
                                    </tr>

                                    <% } %>

                    </tbody>
                </table>
            </div>


            <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/qrcodejs/1.0.0/qrcode.min.js"></script>

            <script>
                function showBookQR(bookId, bookTitle) {
                    Swal.fire({
                        title: bookTitle,
                        html: '<div id="qrcode" style="display: flex; justify-content: center; margin: 20px 0;"></div>',
                        showConfirmButton: true,
                        confirmButtonText: 'Done',
                        confirmButtonColor: '#1877f2',
                        didOpen: () => {
                            new QRCode(document.getElementById("qrcode"), {
                                text: bookId.toString(),
                                width: 256,
                                height: 256,
                                colorDark: "#000000",
                                colorLight: "#ffffff",
                                correctLevel: QRCode.CorrectLevel.H
                            });
                        }
                    });
                }
            </script>

            <% String alertMessage=(String) session.getAttribute("alertMessage"); String alertType=(String)
                session.getAttribute("alertType"); if (alertMessage !=null) { %>

                <script>
                    document.addEventListener("DOMContentLoaded", function () {

                        Swal.fire({
                            title: '<%= "success".equals(alertType) ? "Success!" : "Notice" %>',
                            text: '<%= alertMessage %>',
                            icon: '<%= alertType != null ? alertType : "info" %>',
                            confirmButtonText: 'OK',
                            confirmButtonColor: '#1877f2'
                        });

                    });
                </script>

                <% session.removeAttribute("alertMessage"); session.removeAttribute("alertType"); } %>

                    <jsp:include page="Layout/footer.jsp" />