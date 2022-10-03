import 'package:flutter/material.dart';

class AboutThisEBook extends StatelessWidget {
  String bookName;

  AboutThisEBook({super.key, required this.bookName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "About this eBook - $bookName",
            style: TextStyle(fontSize: 16),
          ),
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            "Books that you buy on the Google Play website can be read in the app.Books that you buy on the Google Play website can be read in the app.Books that you buy on the Google Play website can be read in the app.Books that you buy on the Google Play website can be read in the app.Books that you buy on the Google Play website can be read in the app."
            '\n'
            '\n'
            "Books that you buy on the Google Play website can be read in the app.Books that you buy on the Google Play website can be read in the app.Books that you buy on the Google Play website can be read in the app."
            '\n'
            '\n'
            'Books that you buy on the Google Play website can be read in the app.Books that you buy on the Google Play website can be read in the app.Books that you buy on the Google Play website can be read in the app.Books that you buy on the Google Play website can be read in the app.',
          ),
        )));
  }
}
