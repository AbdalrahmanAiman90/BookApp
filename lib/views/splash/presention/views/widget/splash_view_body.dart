import 'package:bookly_app/views/home/presntion/views/home_view.dart';
import 'package:bookly_app/util/const.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreenBody extends StatefulWidget {
  const SplashScreenBody({super.key});

  @override
  State<SplashScreenBody> createState() => _SplashScreenBodyState();
}

class _SplashScreenBodyState extends State<SplashScreenBody> {
  @override
  void initState() {
    super.initState();
    navigatorToHome();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(AssetData.logo),
        const SizedBox(
          height: 5,
        ),
        const Text(
          'free book to read',
          textAlign: TextAlign.center,
        )
      ],
    );
  }

  void navigatorToHome() {
    Future.delayed(const Duration(seconds: 2), () {
      GoRouter.of(context).push('/home');
    });
  }
}
