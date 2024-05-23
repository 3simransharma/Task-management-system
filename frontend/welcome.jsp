<%@ page import="model.Task" %>
<%@ page import="model.Database" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
//    HttpSession session = request.getSession(false);
    if (session == null || session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    String username = (String) session.getAttribute("username");
    String role = (String) session.getAttribute("role");
    int uid = (int)session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Welcome</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- Bootstrap JS -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
    <div class="container">
        <h1 class="mt-5" id="welcomeMessage">Welcome, <%= username %>!</h1>
        <button class="btn btn-primary" id="logoutButton">Logout</button>
        <br />
        
        <% if ("admin".equals(role)) { %>
            <div id="container1">
                <h1>Task Management System</h1>
                <a href="listUsers" class="btn btn-primary">List Users</a>
            </div>
        <% } %>
        <br />
    </div>
    <br />
    
    <div class="container">
        <h2>Tasks for User ID: <%= uid %></h2>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Task ID</th>
                    <th>Title</th>
                    <th>Description</th>
                </tr>
            </thead>
            <tbody>
                <%
//                    List<Task> tasks = (List<Task>) request.getAttribute("ta");
                      List<Task> tasks = Database.getTasksByUserId((int)session.getAttribute("id"));
                    if (tasks != null) {
                        for (Task task : tasks) {
                %>
                <tr>
                    <td><%= task.getId() %></td>
                    <td><%= task.getTaskTitle() %></td>
                    <td><%= task.getDescription() %></td>
                </tr>
                <%
                        }
                    } else {
                %>
                <tr>
                    <td colspan="3">No tasks available.</td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>

    <script>
        $(document).ready(function() {
            // Logout button click event
            $('#logoutButton').on('click', function() {
                $.ajax({
                    url: 'LogoutServlet',
                    type: 'POST',
                    success: function(response) {
                        window.location.href = 'login.jsp';
                    }
                });
            });
        });
    </script>
</body>
</html>
