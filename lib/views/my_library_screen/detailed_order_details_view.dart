import 'package:flutter/material.dart';

class DetailedBooksOrder extends StatefulWidget {
  String bookName;
  String imageURL;
  String orderedDate;

  DetailedBooksOrder(
      {required this.bookName,
      required this.imageURL,
      required this.orderedDate});

  @override
  State<DetailedBooksOrder> createState() => _DetailedBooksOrderState();
}

class _DetailedBooksOrderState extends State<DetailedBooksOrder> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
