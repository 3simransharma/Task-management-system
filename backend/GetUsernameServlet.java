import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Database;
import model.Task;

@WebServlet("/GetUsernameServlet")
public class GetUsernameServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("username") != null && session.getAttribute("id") != null) {
            String username = (String) session.getAttribute("username");
            int userId = (int) session.getAttribute("id");

            // Fetch tasks for the user
            List<Task> tasks = getTasksForUser(userId);

            // Set the tasks in the request attribute
            request.setAttribute("ta", tasks);

            // Forward the request to the JSP page
            request.getRequestDispatcher("welcome.jsp").forward(request, response);
        } else {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            response.getWriter().write("User not authorized or session expired.");
        }

    }

    private List<Task> getTasksForUser(int userId) {
        // Fetch tasks from the database for the given userId
        return Database.getTasksByUserId(userId);
    }

}
