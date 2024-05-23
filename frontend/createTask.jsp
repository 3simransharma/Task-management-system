<!DOCTYPE html>
<html>
<head>
    <title>Create Task</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h2>Create Task</h2>
        <form action="createTask" method="post">
            <input type="hidden" name="userId" value="<%= request.getParameter("userId") %>">
            <div class="form-group">
                <label for="description">Task Title</label>
                <input type="text" class="form-control" id="t" name="t" required>
                <br />
                <label for="description">Task Description:</label>
                <input type="text" class="form-control" id="description" name="description" required>
            </div>
            <button type="submit" class="btn btn-primary">Create Task</button>
        </form>
    </div>
</body>
</html>
