import model.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/createTask")
public class CreateTaskServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("userId"));
        String description = request.getParameter("description");
        String title = request.getParameter("t");
        
        Task task = new Task(0, userId, title, description);  // ID generation is omitted for simplicity
        
        
        
        Database.addTask(task);
        response.sendRedirect("listUsers");
    }
}
