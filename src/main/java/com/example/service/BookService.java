package com.example.bookmanagement.service;

import com.example.bookmanagement.model.Book;
import org.springframework.stereotype.Service;
import java.util.*;

@Service
public class BookService {
    private Map<Long, Book> books = new HashMap<>();
    private long currentId = 1;

    public BookService() {
        addBook(new Book(null, "Spring Boot Guide", "Harshita", 2025, 199.99));
        addBook(new Book(null, "Java Mastery", "John Doe", 2023, 299.50));
    }

    public List<Book> getAllBooks() {
        return new ArrayList<>(books.values());
    }

    public Book getBookById(Long id) {
        return books.get(id);
    }

    public Book addBook(Book book) {
        book.setId(currentId++);
        books.put(book.getId(), book);
        return book;
    }

    public Book updateBook(Long id, Book book) {
        if (books.containsKey(id)) {
            book.setId(id);
            books.put(id, book);
            return book;
        }
        return null;
    }

    public boolean deleteBook(Long id) {
        return books.remove(id) != null;
    }
}
