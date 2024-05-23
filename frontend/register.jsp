<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
//    HttpSession session = request.getSession(false);
    if (session != null && session.getAttribute("username") != null) {
        String role = (String) session.getAttribute("role");
        if ("admin".equals(role)) {
            response.sendRedirect("welcome.jsp");
        } else {
            response.sendRedirect("welcome.jsp");
        }
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- Bootstrap JS -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
    <div class="container">
        <h2 class="mt-5">Register</h2>
        <form id="registerForm">
            <div class="form-group">
                <label for="username">Username:</label>
                <input type="text" class="form-control" id="username" name="username" required>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" class="form-control" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" class="form-control" id="password" name="password" required>
            </div>
            <button type="submit" class="btn btn-primary">Register</button>
            <a href="login.jsp" class="btn btn-link">Already a user? Login here</a>
        </form>
        <div id="registerResult" class="mt-3"></div>
    </div>

    <script>
        $(document).ready(function() {
            $("#registerForm").on("submit", function(event) {
                event.preventDefault();
                $.ajax({
                    url: "RegisterServlet",
                    type: "POST",
                    data: $(this).serialize(),
                    success: function(response) {
                        if (response.trim() === "success") {
                            window.location.href = "login.jsp";
                        } else {
                            $("#registerResult").html("<div class='alert alert-danger'>Registration failed. Please try again.</div>");
                        }
                    }
                });
            });
        });
    </script>
</body>
</html>
