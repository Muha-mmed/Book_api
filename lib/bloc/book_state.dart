part of 'book_bloc.dart';

sealed class BookState extends Equatable {
  const BookState();

  @override
  List<Object> get props => [];
}

final class BookInitial extends BookState {}

final class LoadingBook extends BookState {}

final class BookLoaded extends BookState {
  final List<Book> bookList;

  const BookLoaded({required this.bookList});

  @override
  List<Object> get props => [bookList];
}

final class BookError extends BookState {
  final String errorMsg;
  const BookError({required this.errorMsg});

  @override
  List<Object> get props => [errorMsg];
}
