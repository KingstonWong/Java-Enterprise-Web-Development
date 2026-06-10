package Models;

public class Book {
    private int book_id;
    private String isbn;
    private String title;
    private String description;
    private String author;
    private String category;
    private int total_copies;
    private int available_copies;
    private String location;
    private int publication_year;
    private String publisher;
    private String cover_image;

    public Book() {

    }

    public Book(int book_id, String isbn, String title, String description, String author, String category,
            int total_copies, int available_copies, String location, int publication_year, String publisher,
            String cover_image) {
        this.book_id = book_id;
        this.isbn = isbn;
        this.title = title;
        this.description = description;
        this.author = author;
        this.category = category;
        this.total_copies = total_copies;
        this.available_copies = available_copies;
        this.location = location;
        this.publication_year = publication_year;
        this.publisher = publisher;
        this.cover_image = cover_image;
    }

    public int getBook_id() {
        return book_id;
    }

    public void setBook_id(int book_id) {
        this.book_id = book_id;
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public int getTotal_copies() {
        return total_copies;
    }

    public void setTotal_copies(int total_copies) {
        this.total_copies = total_copies;
    }

    public int getAvailable_copies() {
        return available_copies;
    }

    public void setAvailable_copies(int available_copies) {
        this.available_copies = available_copies;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public int getPublication_year() {
        return publication_year;
    }

    public void setPublication_year(int publication_year) {
        this.publication_year = publication_year;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public String getCover_image() {
        return cover_image;
    }

    public void setCover_image(String cover_image) {
        this.cover_image = cover_image;
    }
}
