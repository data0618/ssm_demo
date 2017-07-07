package com.ssm.pojo;

public class UserDetail {

    private String userName;
    private Integer age;
    private String role;
    private String operation;

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getOperation() {
        return operation;
    }

    public void setOperation(String operation) {
        this.operation = operation;
    }

    @Override
    public String toString() {
        return "UserDetail [userName=" + userName + ", age=" + age + ", role=" + role
                + ", operation=" + operation + "]";
    }

}
