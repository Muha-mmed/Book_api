import '../model/book.dart';
import 'api_service.dart';

class Repository {
  ApiService apiService = ApiService();

  Future<List<Book>> getBooks() {
    return apiService.getBooks();
  }
}

class NetworkError extends Error {}
