import model.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/viewTasks")
public class ViewUserTasksServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("userId"));
        List<Task> tasks = Database.getTasksByUserId(userId);
        request.setAttribute("tasks", tasks);
        request.getRequestDispatcher("viewTasks.jsp").forward(request, response);
    }
}
