<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="Models.Member" %>
        <% Member user=(Member) session.getAttribute("user"); String alertMsg=(String)
            session.getAttribute("alertMessage"); String alertType=(String) session.getAttribute("alertType"); if
            (alertMsg !=null) { session.removeAttribute("alertMessage"); session.removeAttribute("alertType"); } %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Change Password - Library Portal</title>
                <link rel="stylesheet"
                    href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200">
                <link rel="stylesheet" href="member-portal.css">
                <style>
                    .mp-pwd-reqs li {
                        transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
                    }

                    .mp-pwd-reqs li.met {
                        color: var(--mp-green-700);
                        transform: translateX(4px);
                    }
                </style>
            </head>

            <body class="mp-page">
                <jsp:include page="MemberHeader.jsp" />

                <main class="mp-container">
                    <!-- Breadcrumb -->
                    <ol class="mp-breadcrumb">
                        <li><a href="Portal?action=home"><span class="material-symbols-outlined">home</span> Home</a>
                        </li>
                        <li><span class="material-symbols-outlined">chevron_right</span></li>
                        <li><a href="Portal?action=profile">Profile</a></li>
                        <li><span class="material-symbols-outlined">chevron_right</span></li>
                        <li><span class="current">Change Password</span></li>
                    </ol>

                    <div class="mp-layout">
                        <!-- Sidebar -->
                        <aside class="mp-sidebar">
                            <div class="mp-card" style="border-radius: 12px; overflow: hidden;">
                                <nav class="mp-sidebar-nav" style="padding: 8px;">
                                    <a href="Portal?action=profile"><span
                                            class="material-symbols-outlined">person</span> Overview</a>
                                    <a href="Portal?action=updateProfile"><span
                                            class="material-symbols-outlined">edit_square</span> Update Profile</a>
                                    <a href="Portal?action=changePassword" class="active"><span
                                            class="material-symbols-outlined">lock</span> Change Password</a>
                                </nav>
                            </div>
                        </aside>

                        <!-- Main Content -->
                        <div class="mp-content">
                            <div class="mp-card" style="max-width: 600px;">
                                <div class="mp-card-header">
                                    <div>
                                        <h2 style="display: flex; align-items: center; gap: 8px;">
                                            <span class="material-symbols-outlined"
                                                style="color: var(--mp-primary);">lock_reset</span>
                                            Change Password
                                        </h2>
                                        <p>Update your password to keep your account secure</p>
                                    </div>
                                </div>

                                <div class="mp-card-body">
                                    <% if (alertMsg !=null) { %>
                                        <div class="mp-badge mp-badge-<%= " success".equals(alertType) ? "green" : "red"
                                            %>"
                                            style="width: 100%; justify-content: flex-start; margin-bottom: 24px;
                                            padding: 12px 16px;">
                                            <span class="material-symbols-outlined">
                                                <%= "success" .equals(alertType) ? "check_circle" : "error" %>
                                            </span>
                                            <%= alertMsg %>
                                        </div>
                                        <% } %>

                                            <form action="Portal?action=doChangePassword" method="post"
                                                id="passwordForm">
                                                <!-- Current Password -->
                                                <div style="margin-bottom: 24px;">
                                                    <label class="mp-form-label">Current Password</label>
                                                    <div style="position: relative;">
                                                        <span class="material-symbols-outlined"
                                                            style="position: absolute; left: 12px; top: 50%; transform: translateY(-50%); font-size: 20px; color: var(--mp-gray-400);">key</span>
                                                        <input type="password" name="currentPassword"
                                                            id="currentPassword" class="mp-form-control"
                                                            style="padding-left: 40px;"
                                                            placeholder="Enter current password" required>
                                                        <button type="button"
                                                            onclick="toggleVisibility('currentPassword', this)"
                                                            style="position: absolute; right: 8px; top: 50%; transform: translateY(-50%); background: none; border: none; cursor: pointer; color: var(--mp-gray-400); display: flex;">
                                                            <span class="material-symbols-outlined"
                                                                style="font-size: 20px;">visibility</span>
                                                        </button>
                                                    </div>
                                                </div>

                                                <hr
                                                    style="border: 0; border-top: 1px solid var(--mp-gray-100); margin: 24px 0;">

                                                <!-- New Password -->
                                                <div style="margin-bottom: 24px;">
                                                    <label class="mp-form-label">New Password</label>
                                                    <div style="position: relative;">
                                                        <span class="material-symbols-outlined"
                                                            style="position: absolute; left: 12px; top: 50%; transform: translateY(-50%); font-size: 20px; color: var(--mp-gray-400);">lock</span>
                                                        <input type="password" name="newPassword" id="newPassword"
                                                            class="mp-form-control" style="padding-left: 40px;"
                                                            placeholder="Enter new password" required>
                                                        <button type="button"
                                                            onclick="toggleVisibility('newPassword', this)"
                                                            style="position: absolute; right: 8px; top: 50%; transform: translateY(-50%); background: none; border: none; cursor: pointer; color: var(--mp-gray-400); display: flex;">
                                                            <span class="material-symbols-outlined"
                                                                style="font-size: 20px;">visibility</span>
                                                        </button>
                                                    </div>

                                                    <!-- Strength Meter -->
                                                    <div class="mp-strength-meter">
                                                        <div class="mp-strength-segment" id="segment-1"></div>
                                                        <div class="mp-strength-segment" id="segment-2"></div>
                                                        <div class="mp-strength-segment" id="segment-3"></div>
                                                        <div class="mp-strength-segment" id="segment-4"></div>
                                                    </div>
                                                </div>

                                                <!-- Confirm Password -->
                                                <div style="margin-bottom: 24px;">
                                                    <label class="mp-form-label">Confirm New Password</label>
                                                    <div style="position: relative;">
                                                        <span class="material-symbols-outlined"
                                                            style="position: absolute; left: 12px; top: 50%; transform: translateY(-50%); font-size: 20px; color: var(--mp-gray-400);">lock_clock</span>
                                                        <input type="password" id="confirmPassword"
                                                            class="mp-form-control" style="padding-left: 40px;"
                                                            placeholder="Confirm new password" required>
                                                        <button type="button"
                                                            onclick="toggleVisibility('confirmPassword', this)"
                                                            style="position: absolute; right: 8px; top: 50%; transform: translateY(-50%); background: none; border: none; cursor: pointer; color: var(--mp-gray-400); display: flex;">
                                                            <span class="material-symbols-outlined"
                                                                style="font-size: 20px;">visibility</span>
                                                        </button>
                                                    </div>
                                                </div>

                                                <!-- Requirements List -->
                                                <div
                                                    style="background: var(--mp-gray-50); border: 1px solid var(--mp-gray-100); border-radius: 12px; padding: 20px; margin-bottom: 32px;">
                                                    <h4
                                                        style="font-size: 0.75rem; font-weight: 700; color: var(--mp-gray-400); text-transform: uppercase; letter-spacing: 0.05em; margin-bottom: 16px;">
                                                        Password Requirements:
                                                    </h4>
                                                    <ul class="mp-pwd-reqs">
                                                        <li id="req-length">
                                                            <span class="material-symbols-outlined">circle</span>
                                                            Minimum 8 characters
                                                        </li>
                                                        <li id="req-upper">
                                                            <span class="material-symbols-outlined">circle</span>
                                                            At least one uppercase letter
                                                        </li>
                                                        <li id="req-number">
                                                            <span class="material-symbols-outlined">circle</span>
                                                            At least one number
                                                        </li>
                                                        <li id="req-special">
                                                            <span class="material-symbols-outlined">circle</span>
                                                            At least one special character (!@#$%^&*)
                                                        </li>
                                                    </ul>
                                                </div>

                                                <div style="display: flex; flex-direction: column; gap: 12px;">
                                                    <button type="submit" id="submitBtn" class="mp-btn mp-btn-primary"
                                                        style="width: 100%; padding: 14px;" disabled>
                                                        Update Password
                                                    </button>
                                                    <a href="Portal?action=profile" class="mp-btn mp-btn-ghost"
                                                        style="text-align: center;">Cancel</a>
                                                </div>
                                            </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>

                <script>
                    function toggleVisibility(id, btn) {
                        const input = document.getElementById(id);
                        const icon = btn.querySelector('.material-symbols-outlined');
                        if (input.type === 'password') {
                            input.type = 'text';
                            icon.textContent = 'visibility_off';
                        } else {
                            input.type = 'password';
                            icon.textContent = 'visibility';
                        }
                    }

                    const newPassword = document.getElementById('newPassword');
                    const confirmPassword = document.getElementById('confirmPassword');
                    const submitBtn = document.getElementById('submitBtn');

                    const requirements = {
                        length: val => val.length >= 8,
                        upper: val => /[A-Z]/.test(val),
                        number: val => /[0-9]/.test(val),
                        special: val => /[!@#$%^&*]/.test(val)
                    };

                    function updateValidation() {
                        const val = newPassword.value;
                        const confirmVal = confirmPassword.value;
                        let metCount = 0;

                        for (const [key, fn] of Object.entries(requirements)) {
                            const li = document.getElementById('req-' + key);
                            const icon = li.querySelector('.material-symbols-outlined');
                            const isMet = fn(val);

                            if (isMet) {
                                li.classList.add('met');
                                icon.textContent = 'check_circle';
                                metCount++;
                            } else {
                                li.classList.remove('met');
                                icon.textContent = 'circle';
                            }
                        }

                        // Update Strength Meter
                        for (let i = 1; i <= 4; i++) {
                            const segment = document.getElementById('segment-' + i);
                            if (i <= metCount) {
                                segment.style.background = metCount <= 2 ? '#ef4444' : (metCount === 3 ? '#f59e0b' : '#10b981');
                            } else {
                                segment.style.background = 'var(--mp-gray-200)';
                            }
                        }

                        const allMet = metCount === 4;
                        const matches = val === confirmVal && val !== '';

                        submitBtn.disabled = !(allMet && matches);

                        if (matches) {
                            confirmPassword.style.borderColor = 'var(--mp-green-600)';
                        } else if (confirmVal !== '') {
                            confirmPassword.style.borderColor = '#ef4444';
                        } else {
                            confirmPassword.style.borderColor = '';
                        }
                    }

                    newPassword.addEventListener('input', updateValidation);
                    confirmPassword.addEventListener('input', updateValidation);
                </script>
            </body>

            </html>