import 'package:bookly_app/data/models/book_model/book_model.dart';
import 'package:bookly_app/data/repos/home_repo_implemnt.dart';
import 'package:bookly_app/manger/search_mang/cubit/search_book_cubit.dart';
import 'package:bookly_app/manger/similar_book/cubit/similar_book_cubit.dart';
import 'package:bookly_app/util/server_locator.dart';
import 'package:bookly_app/views/home/presntion/views/home_view.dart';
import 'package:bookly_app/views/book_detial_view/book_details_view.dart';
import 'package:bookly_app/views/search_view/serch_view.dart';
import 'package:bookly_app/views/splash/presention/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => SplashScreen(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => HomeView(),
      ),
      GoRoute(
        path: '/bookdetails',
        builder: (context, state) => BlocProvider(
          create: (context) => SimilarBookCubit(getIt.get<HomeRepoImpl>()),
          child: BookDetialView(
            bookmodel: state.extra as BookModel,
          ),
        ),
      ),
      GoRoute(
        path: '/searchview',
        builder: (context, state) => BlocProvider(
          create: (context) => SearchBookCubit(getIt.get<HomeRepoImpl>()),
          child: SearchView(),
        ),
      ),
    ],
  );
}
