import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:national_digital_notes/views/buy_now_view/buy_now_screen.dart';

class Wishlists extends StatefulWidget {
  const Wishlists({super.key});

  @override
  State<Wishlists> createState() => _WishlistsState();
}

class _WishlistsState extends State<Wishlists> {
  List<BookLists> bookLists = [
    BookLists(
        imageURL: 'assets/books_covers/1.jpg',
        title: 'Jodi Picoult',
        desc: 'short Description for book'),
    BookLists(
        imageURL: 'assets/books_covers/1.jpg',
        title: 'Jodi Picoult',
        desc: 'short Description for book'),
    BookLists(
        imageURL: 'assets/books_covers/1.jpg',
        title: 'Jodi Picoult',
        desc: 'short Description for book'),
    BookLists(
        imageURL: 'assets/books_covers/1.jpg',
        title: 'Jodi Picoult',
        desc: 'short Description for book'),
    BookLists(
        imageURL: 'assets/books_covers/1.jpg',
        title: 'Jodi Picoult',
        desc: 'short Description for book'),
  ];

  bool wishlist = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Wishlist"),
        ),
        body: ListView.builder(
            itemCount: bookLists.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  Get.to(BuyNowScreen(
                      category: '',
                      bookName: bookLists[index].title,
                      imageURL: bookLists[index].imageURL));
                },
                title: Text(bookLists[index].title),
                leading: Image.asset(bookLists[index].imageURL),
                subtitle: Text(bookLists[index].desc),
                trailing: IconButton(
                  icon: wishlist == true
                      ? const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )
                      : const Icon(Icons.favorite_border),
                  onPressed: () {
                    setState(() {
                      Get.snackbar(
                          bookLists[index].title, "Removed from wishlist");
                      bookLists.removeAt(index);
                    });
                  },
                ),
              );
            }));
  }
}

class BookLists {
  String title;
  String desc;
  String imageURL;

  BookLists({required this.imageURL, required this.title, required this.desc});
}
