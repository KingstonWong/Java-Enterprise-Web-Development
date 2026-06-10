<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="Models.Member" %>
        <% Member headerUser=(Member) session.getAttribute("user"); String memberName=(headerUser !=null) ?
            headerUser.getMember_name() : "Guest" ; String[] nameParts=memberName.split(" ");
    String shortName = nameParts[0] + (nameParts.length > 1 ? " " + nameParts[nameParts.length-1].charAt(0) + " ." : ""
            ); String avatarUrl="https://ui-avatars.com/api/?name=" + java.net.URLEncoder.encode(memberName, "UTF-8" )
            + "&background=137fec&color=fff" ; %>
            <header class="mp-header">
                <div class="mp-header-inner">
                    <a href="Portal?action=home" class="mp-logo">
                        <span class="material-symbols-outlined">menu_book</span>
                        <span class="mp-logo-text">Library Portal</span>
                    </a>

                    <div class="mp-header-search">
                        <div class="mp-search">
                            <span class="material-symbols-outlined">search</span>
                            <input type="text" placeholder="Search books, authors, ISBN..." id="portalSearch"
                                onkeydown="if(event.key==='Enter') window.location.href='Portal?action=home&search='+encodeURIComponent(this.value)">
                        </div>
                    </div>

                    <div class="mp-header-actions">

                        <div class="mp-user-menu" id="userMenu">
                            <div class="mp-user-trigger"
                                onclick="document.getElementById('userDropdown').classList.toggle('open')">
                                <img src="<%= avatarUrl %>" alt="Profile" class="mp-user-avatar">
                                <span class="mp-user-name">
                                    <%= shortName %>
                                </span>
                                <span class="material-symbols-outlined"
                                    style="opacity: 0.5; font-size: 20px;">expand_more</span>
                            </div>
                            <div class="mp-dropdown" id="userDropdown">
                                <a href="Portal?action=profile">Profile</a>
                                <a href="Portal?action=dashboard">Borrowing Dashboard</a>
                                <a href="Portal?action=changePassword">Change Password</a>
                                <div class="mp-dropdown-divider"></div>
                                <a href="Logout" class="mp-signout">Sign Out</a>
                            </div>
                        </div>
                    </div>
                </div>
            </header>
            <script>
                document.addEventListener('click', function (e) {
                    var menu = document.getElementById('userMenu');
                    var dd = document.getElementById('userDropdown');
                    if (menu && dd && !menu.contains(e.target)) {
                        dd.classList.remove('open');
                    }
                });
            </script>