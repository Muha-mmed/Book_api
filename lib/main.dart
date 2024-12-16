import 'package:bloc_api/bloc/book_bloc.dart';
import 'package:bloc_api/model/book.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => BookBloc(),
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  @override
  void initState() {
    super.initState();
    context.read<BookBloc>().add(FetchBooks());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Harry Potter Books list"),
          centerTitle: true,
        ),
        body: const BookList(),
      ),
    );
  }
}

class BookList extends StatelessWidget {
  const BookList({super.key});

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

class BookTile extends StatelessWidget {
  final Book book;

  const BookTile({required this.book, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
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
    );
  }
}
