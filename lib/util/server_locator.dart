import 'package:bookly_app/data/repos/home_repo_implemnt.dart';
import 'package:bookly_app/util/api_serves.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      ApiServes(
        Dio(),
      ),
    ),
  );
}
