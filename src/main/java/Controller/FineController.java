package Controller;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import AppDbContext.FineApiClient;
import Models.FineDTO;

@WebServlet("/Fines")
public class FineController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private FineApiClient fineApiClient;

    public void init(ServletConfig config) throws ServletException {
        fineApiClient = new FineApiClient();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "list";
        }

        try {
            switch (action) {
                case "calculate":
                    calculateFine(request, response);
                    break;
                case "showConfirmPayment":
                    showConfirmPayment(request, response);
                    break;
                case "viewReceipt":
                    viewReceipt(request, response);
                    break;
                case "pay":
                    payFine(request, response);
                    break;
                default:
                    listFines(request, response);
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

    private void listFines(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<FineDTO> listFines = fineApiClient.getAllFines();
        request.setAttribute("listFines", listFines);
        request.getRequestDispatcher("FineList.jsp").forward(request, response);
    }

    private void calculateFine(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        int borrowId = Integer.parseInt(request.getParameter("borrow_id"));
        fineApiClient.calculateFine(borrowId);
        response.sendRedirect("Fines?action=list");
    }

    private void payFine(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        int fineId = Integer.parseInt(request.getParameter("id"));
        boolean success = fineApiClient.payFine(fineId);
        if (success) {
            request.getSession().setAttribute("alertMessage", "Fine marked as paid successfully.");
            request.getSession().setAttribute("alertType", "success");
        } else {
            request.getSession().setAttribute("alertMessage", "Failed to mark fine as paid.");
            request.getSession().setAttribute("alertType", "error");
        }
        response.sendRedirect("Fines?action=list");
    }

    private void showConfirmPayment(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int fineId = Integer.parseInt(request.getParameter("id"));
        FineDTO fine = fineApiClient.getFineById(fineId);
        request.setAttribute("fine", fine);
        request.getRequestDispatcher("ConfirmPayment.jsp").forward(request, response);
    }

    private void viewReceipt(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int fineId = Integer.parseInt(request.getParameter("id"));
        FineDTO fine = fineApiClient.getFineById(fineId);
        request.setAttribute("fine", fine);
        request.getRequestDispatcher("ViewReceipt.jsp").forward(request, response);
    }
}
