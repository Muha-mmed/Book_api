// ignore_for_file: public_member_api_docs, sort_constructors_first
class Book {
  final String title;
  final String releaseDate;
  final String description;
  final int pages;
  final String cover;

  Book({
    required this.title,
    required this.releaseDate,
    required this.description,
    required this.pages,
    required this.cover,
  });

  factory Book.fromJSON(Map<String, dynamic> map) {
    return Book(
      title: (map['title'] ?? '') as String,
      releaseDate: (map['releaseDate'] ?? '') as String,
      description: (map['description'] ?? '') as String,
      pages: (map['pages'] ?? '') as int,
      cover: (map['cover'] ?? '') as String,
    );
  }
}
