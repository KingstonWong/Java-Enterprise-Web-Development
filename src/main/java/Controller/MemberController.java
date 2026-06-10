package Controller;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import AppDbContext.MemberApiClient;
import AppDbContext.BorrowRecordApiClient;
import Models.Member;
import Models.BorrowRecordDTO;

@WebServlet("/Members")
public class MemberController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private MemberApiClient memberApiClient;
    private BorrowRecordApiClient borrowRecordApiClient;

    public void init(ServletConfig config) throws ServletException {
        memberApiClient = new MemberApiClient();
        borrowRecordApiClient = new BorrowRecordApiClient();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "list";
        }

        try {
            switch (action) {
                case "new":
                    showNewForm(request, response);
                    break;
                case "insert":
                    insertMember(request, response);
                    break;
                case "delete":
                    deleteMember(request, response);
                    break;
                case "edit":
                    showEditForm(request, response);
                    break;
                case "update":
                    updateMember(request, response);
                    break;
                default:
                    listMembers(request, response);
                    break;
            }
        } catch (Exception ex) {
            throw new ServletException(ex);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    private void listMembers(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String searchQuery = request.getParameter("search");
        List<Member> listMember;
        if (searchQuery != null && !searchQuery.trim().isEmpty()) {
            listMember = memberApiClient.searchMembers(searchQuery);
            request.setAttribute("searchQuery", searchQuery);
        } else {
            listMember = memberApiClient.getAllMembers();
        }
        request.setAttribute("listMember", listMember);
        request.getRequestDispatcher("MemberList.jsp").forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("MemberForm.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Member existingMember = memberApiClient.getMemberById(id);
        request.setAttribute("member", existingMember);
        request.getRequestDispatcher("MemberForm.jsp").forward(request, response);
    }

    private void insertMember(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        String name = request.getParameter("member_name");
        String phone = request.getParameter("phone_number");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Member newMember = new Member(0, null, name, phone, email, password);
        memberApiClient.register(newMember);
        response.sendRedirect("Members?action=list");
    }

    private void updateMember(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        int id = Integer.parseInt(request.getParameter("member_id"));
        String membershipId = request.getParameter("membership_id");
        String name = request.getParameter("member_name");
        String phone = request.getParameter("phone_number");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Member member = new Member(id, membershipId, name, phone, email, password);
        boolean success = memberApiClient.updateMember(member);

        if (success) {
            request.getSession().setAttribute("alertMessage", "Member updated successfully!");
            request.getSession().setAttribute("alertType", "success");
        } else {
            request.getSession().setAttribute("alertMessage", "Failed to update member. Please try again.");
            request.getSession().setAttribute("alertType", "error");
        }
        response.sendRedirect("Members?action=list");
    }

    private void deleteMember(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        // Check if member has active borrowings
        List<BorrowRecordDTO> activeBorrows = borrowRecordApiClient.getMemberActiveBorrows(id);
        if (activeBorrows != null && !activeBorrows.isEmpty()) {
            response.sendRedirect("Members?action=list&error=borrowing");
            return;
        }

        memberApiClient.deleteMember(id);
        response.sendRedirect("Members?action=list");
    }
}
