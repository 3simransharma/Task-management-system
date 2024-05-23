package model;

public class Task {
    private int id;
    private int userId;
    private String taskTitle;
    private String description;

    // Constructor, getters, and setters
    public Task(int id, int userId,String title, String description) {
        this.id = id;
        this.userId = userId;
        this.taskTitle = title;
        this.description = description;
    }

    public int getId() {
        return id;
    }

    public String getTaskTitle() {
        return taskTitle;
    }

    public void setTaskTitle(String taskTitle) {
        this.taskTitle = taskTitle;
    }   

    public int getUserId() {
        return userId;
    }

    public String getDescription() {
        return description;
    }
}