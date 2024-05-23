<%@ page import="model.Task" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Tasks</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h2>Tasks for User ID: <%= request.getParameter("userId") %></h2>
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
                    List<Task> tasks = (List<Task>) request.getAttribute("tasks");
                    for (Task task : tasks) {
                %>
                <tr>
                    <td><%= task.getId() %></td>
                    <td><%= task.getTaskTitle() %></td>
                    <td><%= task.getDescription() %></td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>
