package com.parking.parkinglot.common;

public class UserDto {

   private String username;

    private Long id;
    private String email;

    public String getUsername() {
        return username;
    }

    public Long getId() {
        return id;
    }

    public String getEmail() {
        return email;
    }

    public UserDto(String username, Long id, String email) {
        this.username = username;
        this.id = id;
        this.email = email;
    }
}
