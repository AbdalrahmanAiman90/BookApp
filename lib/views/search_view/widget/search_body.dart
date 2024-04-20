import 'package:bookly_app/views/home/presntion/views/widgets/best_seller_iteam.dart';
import 'package:bookly_app/views/search_view/widget/custom_search_appbar.dart';
import 'package:bookly_app/views/search_view/widget/search_list_book.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({Key? key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            CustomSearchBar(),
            SizedBox(
              height: 16,
            ),
            SearchResultList()
          ],
        ),
      ),
    );
  }
}




/**
 * 
 * 
 * The answer is in the error itself. When the column is inside a view that is scrollable, the column is trying to shrink-wrap its content but since you used Expanded as a child of the column it is working opposite to the column trying to shrink-wrap its children. This is causing this error because these two directives are completely opposite to each other. explian

ChatGPT
Certainly! Let's break down the issue:

Column and Expanded: In Flutter, a Column widget is used to arrange its children in a vertical array. When the Column widget has an Expanded child, it tries to take up as much vertical space as possible, expanding to fill the available space along the main axis.

ScrollView and Shrink-Wrapping: A scrollable widget like SingleChildScrollView tries to shrink-wrap its content by default. This means it tries to make its content fit within the viewport without scrolling if possible. When a scrollable widget has a child that tries to expand to fill all available space, it can lead to conflicts because the child wants to take up more space than the scrollable widget wants to allocate.

In your case, the Column with an Expanded child is trying to take up as much space as possible, while the SingleChildScrollView is trying to make its content fit without scrolling. This conflict arises because the Column and Expanded are working against the shrink-wrapping behavior of the SingleChildScrollView.

To resolve this conflict, you have a few options:

Remove the Expanded: If you don't need the Column to expand to fill all available space, you can remove the Expanded widget and let the Column shrink-wrap its content naturally.

Wrap the Column with a Container: Instead of using Expanded, you can wrap the Column with a Container and specify its height to control its size within the SingleChildScrollView.

Use MainAxisAlignment.spaceBetween or CrossAxisAlignment.stretch: If you're using Expanded to evenly space out the children of the Column, you can use MainAxisAlignment.spaceBetween or CrossAxisAlignment.stretch along with Flexible widgets to achieve similar results without conflicting with the SingleChildScrollView.

By understanding these layout behaviors and choosing the appropriate layout strategy, you can avoid conflicts and create a smooth scrolling experience in your app
 */
