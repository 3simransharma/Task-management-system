<!DOCTYPE html>

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

<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- Bootstrap CSS -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <!-- jQuery -->
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <!-- Bootstrap JS -->
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
    </head>
    <body>
        <div class="container">
            <h1>Welcome!</h1>
            <form id="myForm" method="GET">
                <button type="button" class="btn btn-primary" id="registerBtn">Register</button>
                <button type="button" class="btn btn-secondary" id="loginBtn">Login</button>
            </form>
        </div>

        <script>
            $(document).ready(function(){
                $('#registerBtn').click(function(){
                    $('#myForm').attr('action', 'register.jsp').submit();
                });

                $('#loginBtn').click(function(){
                    $('#myForm').attr('action', 'login.jsp').submit();
                });
            });
        </script>
    </body>
</html>
