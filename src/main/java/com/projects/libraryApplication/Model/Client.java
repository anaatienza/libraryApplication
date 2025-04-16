package com.projects.libraryApplication.Model;

import java.time.LocalDate;

public class Client extends User {

    private String nationalId;
    private String firstName;
    private String lastName;
    private LocalDate birthDate;

    public Client() {
    }

    public Client(int id, String email, String password, String nationalId, String firstName, String lastName, LocalDate birthDate) {
        super(id, email, password);
        this.nationalId = nationalId;
        this.firstName = firstName;
        this.lastName = lastName;
        this.birthDate = birthDate;
    }

    public LocalDate getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(LocalDate birthDate) {
        this.birthDate = birthDate;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getNationalId() {
        return nationalId;
    }

    public void setNationalId(String nationalId) {
        this.nationalId = nationalId;
    }
}

