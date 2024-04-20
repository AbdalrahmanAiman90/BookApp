import 'package:bookly_app/manger/featuer_newst_book_mang/cubit/featur_newst_book_cubit.dart';
import 'package:bookly_app/util/const.dart';
import 'package:bookly_app/views/home/presntion/views/widgets/catigory_iteam.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatigoryShow extends StatefulWidget {
  const CatigoryShow({Key? key}) : super(key: key);

  @override
  _CatigoryShowState createState() => _CatigoryShowState();
}

class _CatigoryShowState extends State<CatigoryShow> {
  int selectedIndex = -1; // Initially no item is selected

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final isSelected = index == selectedIndex;
          return CatigoryIteam(
            selected: isSelected,
            catigory: catigorys[
                index], // Assuming catigorys is a list of Catigory objects
            onTap: () {
              setState(
                () {
                  selectedIndex = index;
                },
              );
              BlocProvider.of<FeaturNewstBookCubit>(context)
                  .fetchNewstBooks(catigorys[index]);
            },
          );
        },
        separatorBuilder: (context, index) => SizedBox(width: 8),
        itemCount: catigorys.length,
      ),
    );
  }
}
