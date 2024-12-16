import 'package:bloc_api/screen/book_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/book_bloc.dart';
import '../model/book.dart';

class BookList extends StatefulWidget {
  const BookList({super.key});

  @override
  State<BookList> createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookBloc, BookState>(
      builder: (context, state) {
        if (state is LoadingBook) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is BookError) {
          return Center(
            child: Text(
              state.errorMsg,
              style: const TextStyle(color: Colors.red, fontSize: 18),
            ),
          );
        } else if (state is BookLoaded) {
          if (state.bookList.isEmpty) {
            return const Center(
              child: Text(
                "No books found",
                style: TextStyle(fontSize: 16),
              ),
            );
          }
          return ListView.builder(
            itemCount: state.bookList.length,
            itemBuilder: (context, index) {
              final Book book = state.bookList[index];
              return BookTile(book: book);
            },
          );
        } else {
          return const Center(
            child: Text("Something went wrong"),
          );
        }
      },
    );
  }
}
