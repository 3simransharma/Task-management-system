<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    if (session != null && session.getAttribute("username") != null) {
        response.sendRedirect("welcome.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- Bootstrap JS -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
    <div class="container mt-5">
        <h2>Login</h2>
        <form id="loginForm">
            <div class="form-group">
                <label for="username">Username:</label>
                <input type="text" class="form-control" id="username" name="username" required>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" class="form-control" id="password" name="password" required>
            </div>
            <button type="submit" class="btn btn-primary">Login</button>
            <a href="register.jsp" class="btn btn-link">New User? Register from here</a>
        </form>
        <div id="loginResult" class="mt-3"></div>
    </div>

    <script>
        $(document).ready(function() {
            $("#loginForm").on("submit", function(event) {
                event.preventDefault();
                $.ajax({
                    url: "LoginServlet",
                    type: "POST",
                    data: $(this).serialize(),
                    success: function(response) {
                        if (response.trim() === "success") {
                            window.location.href = "welcome.jsp";
                        } else {
                            $("#loginResult").html("<div class='alert alert-danger'>Invalid username or password.</div>");
                        }
                    }
                });
            });
        });
    </script>
</body>
</html>
