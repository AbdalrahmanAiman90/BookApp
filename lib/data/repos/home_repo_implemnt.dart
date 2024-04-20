import 'dart:developer';

import 'package:bookly_app/data/models/book_model/book_model.dart';
import 'package:bookly_app/data/repos/home_repo.dart';
import 'package:bookly_app/error/faluir.dart';
import 'package:bookly_app/util/api_serves.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiServes apiServes;
  HomeRepoImpl(this.apiServes);
  @override
  Future<Either<Failure, List<BookModel>>> fetchNewstBooks(a) async {
    try {
//do requst and decode
      Map<String, dynamic> queryParams = {
        'q': a,
        'Filtering': 'free-ebooks',
        'sorting': 'newest'
      };

      var data = await apiServes.get(queryParams: queryParams);
      // do logic
      List<BookModel> newstBooks = [];
      for (var i in data['items']) {
        newstBooks.add(BookModel.fromJson(i));
      }
      log(data['totalItems'].toString());
      return right(newstBooks); //! return
    } on Exception catch (e) {
      if (e is DioException) {
        log(e.toString());
        return left(ServerFailuar.fromDioError(e)); //! return
      } else {
        log(e.toString());
        return left(ServerFailuar(e.toString())); //! return
      }
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchScreenBooks() async {
    try {
//do requst and decode
      Map<String, dynamic> queryParams = {
        'q': "economy",
        'Filtering': 'free-ebooks',
      };

      var data = await apiServes.get(queryParams: queryParams);
      // do logic
      print(data['totalItems'].toString());
      List<BookModel> books = [];
      for (var i in data['items']) {
        print(i);
        print("===========");
        books.add(BookModel.fromJson(i));
      }
      log(books.length.toString());
      return right(books);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailuar.fromDioError(e));
      } else {
        return left(ServerFailuar(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks(
      {required String category}) async {
    try {
      Map<String, dynamic> queryParams = {
        'q': category,
        'Filtering': 'free-ebooks',
        'sorting': 'relevance'
      };

      var data = await apiServes.get(queryParams: queryParams);
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }

      return right(books);
    } catch (e) {
      // ignore: deprecated_member_use
      if (e is DioError) {
        return left(
          ServerFailuar.fromDioError(e),
        );
      }
      return left(
        ServerFailuar(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> searchScreenBook(
      String input) async {
    try {
      Map<String, dynamic> queryParams = {
        'q': 'intitle:$input',
        'Filtering': 'free-ebooks',
      };

      var data = await apiServes.get(queryParams: queryParams);
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }

      return right(books);
    } catch (e) {
      // ignore: deprecated_member_use
      if (e is DioError) {
        return left(
          ServerFailuar.fromDioError(e),
        );
      }
      return left(
        ServerFailuar(
          e.toString(),
        ),
      );
    }
  }
}
