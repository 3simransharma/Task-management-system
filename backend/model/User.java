package model;

public class User {
    private int id;
    private String name;

    // Constructor, getters, and setters
    public User(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }
}
