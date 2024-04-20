import 'package:bookly_app/views/home/presntion/views/widgets/home_view_body.dart';
import 'package:bookly_app/views/search_view/widget/search_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: SearchViewBody()),
    );
  }
}
