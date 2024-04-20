import 'package:bookly_app/data/models/book_model/book_model.dart';
import 'package:bookly_app/error/faluir.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookModel>>> fetchNewstBooks(String c);
  Future<Either<Failure, List<BookModel>>> fetchScreenBooks();
  Future<Either<Failure, List<BookModel>>> searchScreenBook(String input);

  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks(
      {required String category});
}
