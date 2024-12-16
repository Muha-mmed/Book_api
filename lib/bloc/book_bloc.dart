import 'package:bloc/bloc.dart';
import 'package:bloc_api/service/api_repo.dart';
import 'package:equatable/equatable.dart';

import '../model/book.dart';

part 'book_event.dart';
part 'book_state.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  BookBloc() : super(BookInitial()) {
    final Repository repository = Repository();
    on<BookEvent>((event, emit) async {
      emit(LoadingBook());
      try {
        final List<Book> bookList = await repository.getBooks();
        emit(BookLoaded(bookList: bookList));
      } on NetworkError {
        emit(const BookError(errorMsg: "Failed to fetch book!"));
      }
    });
  }
}
