<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ page import="Models.Member" %>
        <jsp:include page="Layout/header.jsp" />

        <% Object userObj=session.getAttribute("user"); String role=(String) session.getAttribute("role"); String
            name="Guest" ; boolean isAdminCheck="admin" .equals(role); if (userObj !=null) { if (userObj instanceof
            Models.Member) { name=((Models.Member) userObj).getMember_name(); } else { name=(String) userObj; } }
            Integer totalMembers=(Integer) request.getAttribute("totalMembers"); Integer booksLent=(Integer)
            request.getAttribute("booksLent"); Integer overdueCount=(Integer) request.getAttribute("overdueCount");
            String displayMembers=(totalMembers !=null) ? String.format("%,d", totalMembers) : "0" ; String
            displayLent=(booksLent !=null) ? String.format("%,d", booksLent) : "0" ; String displayOverdue=(overdueCount
            !=null) ? String.format("%,d", overdueCount) : "0" ; %>

            <div class="page-header" style="margin-bottom: 40px;">
                <div class="page-title">
                    <h1 style="font-size: 2.5rem; font-weight: 800; letter-spacing: -0.02em; color: #1c1e21;">Welcome
                        back, <%= name %>!</h1>
                    <p style="font-size: 1.125rem; color: #65676b; margin-top: 8px;">Here's an overview of your
                        library's status today.</p>
                </div>
            </div>

            <div
                style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 32px; margin-bottom: 48px;">
                <div class="card" onclick="location.href='Members?action=list'"
                    style="padding: 32px; border: none; box-shadow: 0 10px 25px rgba(0,0,0,0.05); transition: all 0.3s ease; cursor: pointer;"
                    onmouseover="this.style.transform='translateY(-5px)'; this.style.boxShadow='0 15px 30px rgba(24, 119, 242, 0.1)';"
                    onmouseout="this.style.transform='translateY(0)'; this.style.boxShadow='0 10px 25px rgba(0,0,0,0.05)';">
                    <div
                        style="display: flex; justify-content: space-between; align-items: flex-start; margin-bottom: 24px;">
                        <div
                            style="width: 60px; height: 60px; background: #e7f3ff; color: #1877f2; border-radius: 16px; display: flex; align-items: center; justify-content: center;">
                            <span class="material-symbols-outlined" style="font-size: 32px;">group</span>
                        </div>
                        <span class="material-symbols-outlined" style="color: #65676b;">arrow_forward</span>
                    </div>
                    <div>
                        <div style="font-size: 1rem; color: #65676b; font-weight: 600; margin-bottom: 8px;">Total
                            Members</div>
                        <div style="font-size: 2.25rem; font-weight: 800; color: #1c1e21;">
                            <%= displayMembers %>
                        </div>
                    </div>
                </div>

                <div class="card" onclick="location.href='Borrow?action=list'"
                    style="padding: 32px; border: none; box-shadow: 0 10px 25px rgba(0,0,0,0.05); transition: all 0.3s ease; cursor: pointer;"
                    onmouseover="this.style.transform='translateY(-5px)'; this.style.boxShadow='0 15px 30px rgba(46, 125, 50, 0.1)';"
                    onmouseout="this.style.transform='translateY(0)'; this.style.boxShadow='0 10px 25px rgba(0,0,0,0.05)';">
                    <div
                        style="display: flex; justify-content: space-between; align-items: flex-start; margin-bottom: 24px;">
                        <div
                            style="width: 60px; height: 60px; background: #e8f5e9; color: #2e7d32; border-radius: 16px; display: flex; align-items: center; justify-content: center;">
                            <span class="material-symbols-outlined" style="font-size: 32px;">book</span>
                        </div>
                        <span class="material-symbols-outlined" style="color: #65676b;">arrow_forward</span>
                    </div>
                    <div>
                        <div style="font-size: 1rem; color: #65676b; font-weight: 600; margin-bottom: 8px;">Books Lent
                        </div>
                        <div style="font-size: 2.25rem; font-weight: 800; color: #1c1e21;">
                            <%= displayLent %>
                        </div>
                    </div>
                </div>

                <div class="card" onclick="location.href='Borrow?action=list&status=OVERDUE'"
                    style="padding: 32px; border: none; box-shadow: 0 10px 25px rgba(0,0,0,0.05); transition: all 0.3s ease; cursor: pointer;"
                    onmouseover="this.style.transform='translateY(-5px)'; this.style.boxShadow='0 15px 30px rgba(239, 108, 0, 0.1)';"
                    onmouseout="this.style.transform='translateY(0)'; this.style.boxShadow='0 10px 25px rgba(0,0,0,0.05)';">
                    <div
                        style="display: flex; justify-content: space-between; align-items: flex-start; margin-bottom: 24px;">
                        <div
                            style="width: 60px; height: 60px; background: #fff3e0; color: #ef6c00; border-radius: 16px; display: flex; align-items: center; justify-content: center;">
                            <span class="material-symbols-outlined" style="font-size: 32px;">pending_actions</span>
                        </div>
                        <span class="material-symbols-outlined" style="color: #65676b;">arrow_forward</span>
                    </div>
                    <div>
                        <div style="font-size: 1rem; color: #65676b; font-weight: 600; margin-bottom: 8px;">Overdue
                        </div>
                        <div style="font-size: 2.25rem; font-weight: 800; color: #1c1e21;">
                            <%= displayOverdue %>
                        </div>
                    </div>
                </div>
            </div>

            <div class="card"
                style="padding: 60px; text-align: center; border: none; box-shadow: 0 20px 40px rgba(0,0,0,0.08); background: white; border-radius: 24px;">
                <div
                    style="display: inline-flex; width: 100px; height: 100px; background: var(--primary-gradient); border-radius: 30px; align-items: center; justify-content: center; margin-bottom: 32px; box-shadow: 0 15px 30px rgba(24, 119, 242, 0.3);">
                    <span class="material-symbols-outlined" style="font-size: 48px; color: white;">auto_stories</span>
                </div>
                <h2 style="font-size: 2rem; font-weight: 800; color: #1c1e21; margin-bottom: 16px;">Central Management
                    Hub</h2>
                <p
                    style="color: #65676b; max-width: 600px; margin: 0 auto 40px; font-size: 1.125rem; line-height: 1.6;">
                    Take full control of your library's ecosystem. Seamlessly manage memberships, track book movements,
                    and analyze real-time data from a single unified workspace.
                </p>
                <% if (isAdminCheck) { %>
                    <div style="display: flex; gap: 16px; justify-content: center; flex-wrap: wrap;">
                        <a href="Members?action=list" class="btn-primary"
                            style="padding: 16px 32px; font-size: 1rem; border-radius: 16px; background: var(--primary-gradient);">
                            <span>Members</span>
                            <span class="material-symbols-outlined">group</span>
                        </a>
                        <a href="Books?action=list" class="btn-primary"
                            style="padding: 16px 32px; font-size: 1rem; border-radius: 16px; background: var(--primary-gradient);">
                            <span>Inventory</span>
                            <span class="material-symbols-outlined">library_books</span>
                        </a>
                        <a href="Borrow?action=pending" class="btn-primary"
                            style="padding: 16px 32px; font-size: 1rem; border-radius: 16px; background: var(--primary-gradient);">
                            <span>Requests</span>
                            <span class="material-symbols-outlined">pending_actions</span>
                        </a>
                    </div>
                    <% } %>
            </div>

            <jsp:include page="Layout/footer.jsp" />