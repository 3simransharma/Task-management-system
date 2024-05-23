<%@ page import="model.User" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <title>List Users</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h2>Users</h2>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<User> users = (List<User>) request.getAttribute("users");
                    for (User user : users) {
                %>
                <tr>
                    <td><%= user.getId() %></td>
                    <td><%= user.getName() %></td>
                    <td>
                        <form action="createTask.jsp" method="get" style="display:inline;">
                            <input type="hidden" name="userId" value="<%= user.getId() %>">
                            <button type="submit" class="btn btn-success">Create Task</button>
                        </form>
                        <form action="viewTasks" method="get" style="display:inline;">
                            <input type="hidden" name="userId" value="<%= user.getId() %>">
                            <button type="submit" class="btn btn-info">View Tasks</button>
                        </form>
                    </td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>
