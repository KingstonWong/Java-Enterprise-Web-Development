<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ page import="Models.Member" %>
        <jsp:include page="Layout/header.jsp" />

        <% Member member=(Member) request.getAttribute("member"); boolean isEdit=(member !=null); String title=isEdit
            ? "Modify Member Profile" : "New Member Enrollment" ; String description=isEdit
            ? "Update existing account credentials and contact information."
            : "Register a new profile to access library digital resources." ; String actionUrl=isEdit
            ? "Members?action=update" : "Members?action=insert" ; %>

            <div class="page-header" style="margin-bottom: 40px;">
                <div class="page-title">
                    <h1 style="font-size: 2.25rem; font-weight: 800; letter-spacing: -0.02em; color: #1c1e21;">
                        <%= title %>
                    </h1>
                    <p style="color: #65676b; font-size: 1.125rem; margin-top: 4px;">
                        <%= description %>
                    </p>
                </div>
                <a href="Members?action=list" class="btn-secondary"
                    style="padding: 10px 20px; border-radius: 12px; font-weight: 600; background: white; border: 1px solid #dddfe2;">
                    <span class="material-symbols-outlined">arrow_back</span>
                    <span>Cancel and Return</span>
                </a>
            </div>

            <div class="card"
                style="padding: 48px; max-width: 900px; border: none; box-shadow: 0 20px 40px rgba(0,0,0,0.08); border-radius: 24px; background: white;">
                <form action="<%= actionUrl %>" method="post" style="display: flex; flex-direction: column; gap: 32px;">
                    <% if (isEdit) { %>
                        <input type="hidden" name="member_id" value="<%= member.getMember_id() %>">
                        <% } %>

                            <div style="display: flex; flex-direction: column; gap: 24px;">
                                <h3
                                    style="font-size: 1.25rem; font-weight: 700; color: #1c1e21; border-bottom: 2px solid #f0f2f5; padding-bottom: 12px;">
                                    Personal Information</h3>

                                <div class="form-group">
                                    <label class="form-label" style="font-weight: 700;">Full Legal Name</label>
                                    <div style="position: relative;">
                                        <span class="material-symbols-outlined"
                                            style="position: absolute; left: 16px; top: 50%; transform: translateY(-50%); color: #65676b; font-size: 20px;">person</span>
                                        <input type="text" name="member_name" class="form-input"
                                            style="padding-left: 48px; border-radius: 12px; height: 52px; background: #f0f2f5; border: 1px solid transparent;"
                                            placeholder="John Doe" required
                                            value="<%= isEdit ? member.getMember_name() : "" %>">
                                    </div>
                                </div>

                                <div class="form-grid"
                                    style="display: grid; grid-template-columns: 1fr 1fr; gap: 24px;">
                                    <div class="form-group">
                                        <label class="form-label" style="font-weight: 700;">Email Address</label>
                                        <div style="position: relative;">
                                            <span class="material-symbols-outlined"
                                                style="position: absolute; left: 16px; top: 50%; transform: translateY(-50%); color: #65676b; font-size: 20px;">mail</span>
                                            <input type="email" name="email" class="form-input"
                                                style="padding-left: 48px; border-radius: 12px; height: 52px; background: #f0f2f5; border: 1px solid transparent;"
                                                placeholder="john@example.com" required
                                                value="<%= isEdit ? member.getEmail() : "" %>">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label" style="font-weight: 700;">Phone Number</label>
                                        <div style="position: relative;">
                                            <span class="material-symbols-outlined"
                                                style="position: absolute; left: 16px; top: 50%; transform: translateY(-50%); color: #65676b; font-size: 20px;">call</span>
                                            <input type="tel" name="phone_number" class="form-input"
                                                style="padding-left: 48px; border-radius: 12px; height: 52px; background: #f0f2f5; border: 1px solid transparent;"
                                                placeholder="+1 (555) 000-0000" required
                                                value="<%= isEdit ? member.getPhone_number() : "" %>">
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div style="display: flex; flex-direction: column; gap: 24px;">
                                <h3
                                    style="font-size: 1.25rem; font-weight: 700; color: #1c1e21; border-bottom: 2px solid #f0f2f5; padding-bottom: 12px;">
                                    Security & Membership</h3>

                                <div class="form-grid"
                                    style="display: grid; grid-template-columns: 1fr 1fr; gap: 24px;">
                                    <% if (isEdit) { %>
                                        <div class="form-group">
                                            <label class="form-label" style="font-weight: 700;">Membership ID</label>
                                            <div style="position: relative;">
                                                <span class="material-symbols-outlined"
                                                    style="position: absolute; left: 16px; top: 50%; transform: translateY(-50%); color: #65676b; font-size: 20px;">badge</span>
                                                <input type="text" name="membership_id" class="form-input"
                                                    style="padding-left: 48px; border-radius: 12px; height: 52px; background: #f0f2f5; border: 1px solid transparent; color: #64748b;"
                                                    value="<%= member.getMembership_id() %>" readonly>
                                            </div>
                                        </div>
                                        <% } %>
                                            <div class="form-group">
                                                <label class="form-label" style="font-weight: 700;">Account
                                                    Password</label>
                                                <div style="position: relative;">
                                                    <span class="material-symbols-outlined"
                                                        style="position: absolute; left: 16px; top: 50%; transform: translateY(-50%); color: #65676b; font-size: 20px;">lock</span>
                                                    <input type="password" name="password" class="form-input"
                                                        style="padding-left: 48px; border-radius: 12px; height: 52px; background: #f0f2f5; border: 1px solid transparent;"
                                                        placeholder="••••••••" required
                                                        value="<%= isEdit ? member.getPassword() : "" %>">
                                                </div>
                                            </div>
                                </div>
                            </div>

                            <div class="form-actions"
                                style="border-top: 2px solid #f0f2f5; padding-top: 32px; display: flex; justify-content: flex-end; gap: 16px;">
                                <a href="Members?action=list" class="btn-secondary"
                                    style="height: 52px; padding: 0 32px; border-radius: 14px; font-weight: 700; display: flex; align-items: center; justify-content: center; background: #f0f2f5; border: none; color: #4b5563;">Cancel
                                    Operation</a>
                                <button type="submit" class="btn-primary"
                                    style="height: 52px; padding: 0 40px; border-radius: 14px; font-weight: 700; background: var(--primary-gradient); border: none; box-shadow: 0 8px 16px rgba(24, 119, 242, 0.2);">
                                    <%= isEdit ? "Update Profile Details" : "Finalize Registration" %>
                                </button>
                            </div>
                </form>
            </div>

            <jsp:include page="Layout/footer.jsp" />