<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ page import="java.util.List" %>
        <%@ page import="Models.Member" %>
            <jsp:include page="Layout/header.jsp" />

            <div class="page-header" style="margin-bottom: 32px;">
                <div class="page-title">
                    <h1 style="font-size: 2.25rem; font-weight: 800; letter-spacing: -0.02em; color: #1c1e21;">Member
                        Registry</h1>
                    <p style="color: #65676b; font-size: 1.125rem; margin-top: 4px;">View, register, search, edit,
                        manage library member accounts.</p>
                </div>
                <a href="Members?action=new" class="btn-primary"
                    style="padding: 12px 24px; border-radius: 12px; font-weight: 700; background: var(--primary-gradient); box-shadow: 0 4px 12px rgba(24, 119, 242, 0.2);">
                    <span class="material-symbols-outlined">person_add</span>
                    <span>Register New Member</span>
                </a>
            </div>

            <div class="search-container" style="margin-bottom: 32px;">
                <% if ("borrowing".equals(request.getParameter("error"))) { %>
                    <div
                        style="background: #fef2f2; border: 1px solid #fee2e2; border-radius: 12px; padding: 16px; margin-bottom: 24px; display: flex; align-items: center; gap: 12px; color: #d32f2f; animation: slideIn 0.3s ease-out;">
                        <span class="material-symbols-outlined" style="font-size: 24px;">error</span>
                        <div style="font-weight: 600;">This member still borrowing book, cannot be delete.</div>
                    </div>
                    <style>
                        @keyframes slideIn {
                            from {
                                opacity: 0;
                                transform: translateY(-10px);
                            }

                            to {
                                opacity: 1;
                                transform: translateY(0);
                            }
                        }
                    </style>
                    <% } %>
                        <form action="Members" method="get"
                            style="display: flex; gap: 12px; align-items: center; background: white; padding: 16px; border-radius: 20px; box-shadow: 0 10px 30px rgba(0,0,0,0.06);">
                            <input type="hidden" name="action" value="list">
                            <div style="position: relative; flex: 1; max-width: 500px;">
                                <span class="material-symbols-outlined"
                                    style="position: absolute; left: 16px; top: 50%; transform: translateY(-50%); color: #65676b;">search</span>
                                <input type="text" name="search" placeholder="Search by name, email, ID or phone..."
                                    value="<%= request.getAttribute(" searchQuery") !=null ?
                                    request.getAttribute("searchQuery") : "" %>"
                                style="width: 100%; padding: 14px 16px 14px 48px; border-radius: 14px; border: 1.5px
                                solid
                                #eef2f6; background: #f8fafc; font-size: 1rem; transition: all 0.2s; outline: none;"
                                onfocus="this.style.borderColor='#1877f2'; this.style.background='white';
                                this.style.boxShadow='0 0 0 4px rgba(24, 119, 242, 0.1)';"
                                onblur="this.style.borderColor='#eef2f6'; this.style.background='#f8fafc';
                                this.style.boxShadow='none';">
                            </div>
                            <button type="submit" class="btn-primary"
                                style="padding: 14px 28px; border-radius: 14px; font-weight: 700; background: var(--primary-gradient); border: none; color: white; cursor: pointer; display: flex; align-items: center; gap: 8px; box-shadow: 0 4px 12px rgba(24, 119, 242, 0.2);">
                                <span class="material-symbols-outlined" style="font-size: 20px;">search</span>
                                <span>Find Member</span>
                            </button>
                            <% if (request.getAttribute("searchQuery") !=null) { %>
                                <a href="Members?action=list"
                                    style="color: #65676b; text-decoration: none; font-weight: 700; font-size: 0.875rem; margin-left: 12px; display: flex; align-items: center; gap: 4px; padding: 12px 16px; border-radius: 12px; transition: all 0.2s;"
                                    onmouseover="this.style.background='#f1f5f9'; this.style.color='#1c1e21'"
                                    onmouseout="this.style.background='transparent'; this.style.color='#65676b'">
                                    <span class="material-symbols-outlined" style="font-size: 18px;">close</span>
                                    Clear
                                </a>
                                <% } %>
                        </form>
            </div>

            <div class="card"
                style="border: none; box-shadow: 0 10px 30px rgba(0,0,0,0.06); border-radius: 20px; overflow: hidden; background: white;">
                <table class="data-table" style="border-collapse: separate; border-spacing: 0;">
                    <thead>
                        <tr style="background: #f8fafc;">
                            <th
                                style="padding: 20px 24px; font-size: 0.875rem; color: #4b5563; font-weight: 700; border-bottom: 2px solid #e5e7eb;">
                                NAME / EMAIL</th>
                            <th
                                style="padding: 20px 24px; font-size: 0.875rem; color: #4b5563; font-weight: 700; border-bottom: 2px solid #e5e7eb;">
                                MEMBERSHIP ID</th>
                            <th
                                style="padding: 20px 24px; font-size: 0.875rem; color: #4b5563; font-weight: 700; border-bottom: 2px solid #e5e7eb;">
                                CONTACT</th>
                            <th
                                style="padding: 20px 24px; font-size: 0.875rem; color: #4b5563; font-weight: 700; border-bottom: 2px solid #e5e7eb;">
                                STATUS</th>
                            <th
                                style="padding: 20px 24px; font-size: 0.875rem; color: #4b5563; font-weight: 700; border-bottom: 2px solid #e5e7eb; text-align: right;">
                                ACTIONS</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% List<Member> listMember = (List<Member>) request.getAttribute("listMember");
                                if (listMember != null && !listMember.isEmpty()) {
                                for (Member member : listMember) {
                                String initials = "";
                                if (member.getMember_name() != null && !member.getMember_name().isEmpty()) {
                                initials = String.valueOf(member.getMember_name().charAt(0)).toUpperCase();
                                }
                                %>
                                <tr style="transition: all 0.2s;" onmouseover="this.style.background='#f1f5f9'"
                                    onmouseout="this.style.background='white'">
                                    <td style="padding: 20px 24px; border-bottom: 1px solid #f1f5f9;">
                                        <div class="user-cell" style="display: flex; align-items: center; gap: 16px;">
                                            <div
                                                style="width: 48px; height: 48px; background: var(--primary-gradient); color: white; border-radius: 14px; display: flex; align-items: center; justify-content: center; font-weight: 800; font-size: 1rem; box-shadow: 0 4px 10px rgba(24, 119, 242, 0.15);">
                                                <%= initials %>
                                            </div>
                                            <div class="user-info"
                                                style="display: flex; flex-direction: column; gap: 4px;">
                                                <span class="user-name"
                                                    style="font-weight: 700; color: #1c1e21; font-size: 1rem;">
                                                    <%= member.getMember_name() %>
                                                </span>
                                                <span class="user-email" style="color: #65676b; font-size: 0.875rem;">
                                                    <%= member.getEmail() %>
                                                </span>
                                            </div>
                                        </div>
                                    </td>
                                    <td style="padding: 20px 24px; border-bottom: 1px solid #f1f5f9;">
                                        <span
                                            style="font-family: 'Inter', monospace; font-weight: 600; color: #1877f2; background: #e7f3ff; padding: 4px 12px; border-radius: 8px; font-size: 0.875rem;">
                                            <%= member.getMembership_id() %>
                                        </span>
                                    </td>
                                    <td
                                        style="padding: 20px 24px; border-bottom: 1px solid #f1f5f9; color: #4b5563; font-weight: 500;">
                                        <%= member.getPhone_number() %>
                                    </td>
                                    <td style="padding: 20px 24px; border-bottom: 1px solid #f1f5f9;">
                                        <span class="status-badge"
                                            style="background: #e8f5e9; color: #2e7d32; padding: 6px 14px; border-radius: 9999px; font-size: 0.75rem; font-weight: 700; text-transform: uppercase; letter-spacing: 0.05em;">Active</span>
                                    </td>
                                    <td
                                        style="padding: 20px 24px; border-bottom: 1px solid #f1f5f9; text-align: right;">
                                        <div style="display: flex; justify-content: flex-end; gap: 12px;">
                                            <a href="Members?action=edit&id=<%= member.getMember_id() %>"
                                                style="width: 36px; height: 36px; border-radius: 10px; background: #f1f5f9; color: #1877f2; display: flex; align-items: center; justify-content: center; transition: all 0.2s; text-decoration: none;"
                                                title="Edit Member"
                                                onmouseover="this.style.background='#1877f2'; this.style.color='white'"
                                                onmouseout="this.style.background='#f1f5f9'; this.style.color='#1877f2'">
                                                <span class="material-symbols-outlined"
                                                    style="font-size: 20px;">edit</span>
                                            </a>
                                            <a href="Members?action=delete&id=<%= member.getMember_id() %>"
                                                style="width: 36px; height: 36px; border-radius: 10px; background: #fef2f2; color: #d32f2f; display: flex; align-items: center; justify-content: center; transition: all 0.2s; text-decoration: none;"
                                                title="Delete Member"
                                                onmouseover="this.style.background='#d32f2f'; this.style.color='white'"
                                                onmouseout="this.style.background='#fef2f2'; this.style.color='#d32f2f'"
                                                onclick="return confirm('Permanent action: Are you sure you want to delete this member?')">
                                                <span class="material-symbols-outlined"
                                                    style="font-size: 20px;">delete</span>
                                            </a>
                                        </div>
                                    </td>
                                </tr>
                                <% } } else { %>
                                    <tr>
                                        <td colspan="5" style="text-align: center; padding: 80px 40px; color: #65676b;">
                                            <div
                                                style="display: flex; flex-direction: column; align-items: center; gap: 16px;">
                                                <span class="material-symbols-outlined"
                                                    style="font-size: 64px; color: #cbd5e1;">person_off</span>
                                                <div style="font-size: 1.25rem; font-weight: 700; color: #475569;">
                                                    No
                                                    Members Found</div>
                                                <p style="max-width: 300px; margin: 0 auto;">Start by
                                                    registering your
                                                    first library member to see them here.</p>
                                            </div>
                                        </td>
                                    </tr>
                                    <% } %>
                    </tbody>
                </table>
            </div>

            <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

            <% String alertMessage=(String) session.getAttribute("alertMessage"); String alertType=(String)
                session.getAttribute("alertType"); if (alertMessage !=null) { %>
                <script>
                    document.addEventListener("DOMContentLoaded", function () {
                        Swal.fire({
                            title: '<%= "success".equals(alertType) ? "Success!" : "Notice" %>',
                            text: '<%= alertMessage %>',
                            icon: '<%= alertType != null ? alertType : "info" %>',
                            confirmButtonText: 'OK',
                            confirmButtonColor: '#1877f2',
                            background: '#ffffff',
                            customClass: {
                                popup: 'rounded-xl shadow-lg',
                                title: 'text-xl font-bold text-gray-800',
                                confirmButton: 'px-6 py-2 rounded-lg font-semibold'
                            }
                        });
                    });
                </script>
                <% session.removeAttribute("alertMessage"); session.removeAttribute("alertType"); } %>

                    <jsp:include page="Layout/footer.jsp" />