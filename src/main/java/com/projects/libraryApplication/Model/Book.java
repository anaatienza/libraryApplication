package com.projects.libraryApplication.Model;

import java.time.LocalDate;

public class Book {

    private int id;
    private String title;
    private String coverImage;
    private String isbn;
    private LocalDate publicationDate;
    private Genre genre;
    private int totalCopies;
    private int authorId;
    private int editorialId;

}
