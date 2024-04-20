import 'package:bookly_app/app_router.dart';
import 'package:bookly_app/data/repos/home_repo_implemnt.dart';
import 'package:bookly_app/manger/featuer_newst_book_mang/cubit/featur_newst_book_cubit.dart';
import 'package:bookly_app/manger/feature_book_mang/cubit/featur_book_cubit.dart';
import 'package:bookly_app/util/api_serves.dart';
import 'package:bookly_app/util/server_locator.dart';
import 'package:bookly_app/views/splash/presention/views/splash_view.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> main() async {
  setup();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturBookCubit(
            getIt.get<HomeRepoImpl>(),
          )..fetchBooks(),
        ),
        BlocProvider(
            create: (context) => FeaturNewstBookCubit(
                  getIt.get<HomeRepoImpl>(),
                )..fetchNewstBooks("programming"))
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(brightness: Brightness.dark).copyWith(
          scaffoldBackgroundColor: Color(0xff100B20),
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
        routerConfig: AppRouter.router,
      ),
    );
  }
}
