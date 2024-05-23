package model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Database {
    private static final String DB_URL = "jdbc:derby://localhost:1527/u";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "admin";

    private static List<User> users = new ArrayList<>();

    static {
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            String sql = "SELECT * FROM USERS";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                System.out.println("User found: " + rs.getInt(1) + ", " + rs.getString(2));
                int id = rs.getInt(1);
                String name = rs.getString(2);
                users.add(new User(id, name));
            }

            rs.close();
            ps.close();
            conn.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            System.out.print("error");
        }
    }

    public static List<User> getUsers() {
        System.out.println("Fetching users: " + users.size());
        for (User user : users) {
            System.out.println("User: " + user.getId() + ", " + user.getName());
        }
        return users;
    }

    public static void addTask(Task task) {
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            String sql = "INSERT INTO task (userid, title, description) VALUES (?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, task.getUserId());
            ps.setString(2, task.getTaskTitle());
            ps.setString(3, task.getDescription());
            ps.executeUpdate();

            ps.close();
            conn.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            System.out.print("error");
        }
    }

    public static List<Task> getTasksByUserId(int userId) {
        List<Task> userTasks = new ArrayList<>();
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            String sql = "SELECT * FROM task WHERE userId = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int id = rs.getInt(1);
                int uid = rs.getInt(2);
                String title = rs.getString(3);
                String description = rs.getString(4);
                userTasks.add(new Task(id, uid, title, description));
            }

            rs.close();
            ps.close();
            conn.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            System.out.print("error");
        }
        return userTasks;
    }
}
