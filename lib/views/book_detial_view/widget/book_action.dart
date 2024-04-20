import 'package:bookly_app/data/models/book_model/book_model.dart';
import 'package:bookly_app/util/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BookAction extends StatelessWidget {
  const BookAction({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          const Expanded(
            child: CustomButton(
              backgroundColor: Colors.white,
              textColor: Colors.black,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(16),
              ),
              text: "Free",
            ),
          ),
          Expanded(
            child: CustomButton(
              backgroundColor: const Color.fromARGB(210, 226, 101, 47),
              textColor: const Color.fromARGB(255, 253, 253, 253),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(16),
              ),
              text: gettext(bookModel),
              onPressed: () async {
                Uri uri = Uri.parse(bookModel.volumeInfo.previewLink!);
                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri);
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  gettext(BookModel bookModel) {
    if (bookModel.volumeInfo.previewLink == null) {
      return "Not Avalibel";
    } else {
      return "Read";
    }
  }
}
