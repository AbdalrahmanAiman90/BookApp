import 'dart:async';
import 'dart:developer';

import 'package:bookly_app/manger/search_mang/cubit/search_book_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSearchBar extends StatefulWidget {
  CustomSearchBar({Key? key});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  final TextEditingController t = TextEditingController();

  Timer? _debounce;

  void _searchBooks(String query) async {
    // Cancel the previous debounce timer if it exists
    if (_debounce != null && _debounce!.isActive) {
      _debounce!.cancel();
    }

    // Set up a new debounce timer
    _debounce = Timer(
      Duration(milliseconds: 600),
      () async {
        await BlocProvider.of<SearchBookCubit>(context).fetchSearchBook(query);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: t,
      onChanged: (value) {
        _searchBooks(value);
      },
      onSubmitted: (value) {
        _searchBooks(value);
      },
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(12),
          ),
          hintText: 'search',
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                t.text = '';
                BlocProvider.of<SearchBookCubit>(context)
                    .emit(SearchBookClose());
              });
            },
            icon: const Icon(
              Icons.close,
              size: 28,
            ),
          ),
          prefixIcon: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              size: 28,
            ),
          )),
    );
  }
}
