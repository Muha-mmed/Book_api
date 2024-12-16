import 'package:flutter/material.dart';

import '../details_screen.dart';
import '../model/book.dart';

class BookTile extends StatelessWidget {
  final Book book;

  const BookTile({required this.book, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => DetailScreen(book: book)));
      },
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: Colors.grey.shade300),
          child: ListTile(
            leading: Image.network(
              book.cover,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.image_not_supported);
              },
            ),
            title: Text(book.title),
            subtitle: Text(
              book.description,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Pages: ${book.pages}",
                  style: const TextStyle(fontSize: 14),
                ),
                Text(
                  book.releaseDate,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
