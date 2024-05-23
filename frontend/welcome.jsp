<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
//    HttpSession session = request.getSession(false);
    if (session == null || session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    String role = (String) session.getAttribute("role");
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
        <h1 class="mt-5" id="welcomeMessage">Welcome, <%= session.getAttribute("username") %>!</h1>
        <button class="btn btn-primary" id="logoutButton">Logout</button>
        
        <% if ("admin".equals(role)) { %>
            <div id="container1">
                <h1>Task Management System</h1>
                <a href="listUsers" class="btn btn-primary">List Users</a>
            </div>
        <% } %>
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
