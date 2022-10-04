import 'package:flutter/material.dart';

class AddToCartView extends StatefulWidget {
  @override
  State<AddToCartView> createState() => _AddToCartViewState();
}

class _AddToCartViewState extends State<AddToCartView> {
  List<CartModels> cartItems = [
    CartModels(
        bookName: 'Jodi Picoult',
        imageURL: 'assets/books_covers/1.jpg',
        description: 'short Description for book',
        price: '999'),
    CartModels(
        bookName: 'Jodi Picoult',
        imageURL: 'assets/books_covers/3.jpg',
        description: 'short Description for book',
        price: '3453'),
    CartModels(
        bookName: 'Jodi Picoult',
        imageURL: 'assets/books_covers/4.jpg',
        description: 'short Description for book',
        price: '1234'),
    CartModels(
        bookName: 'Jodi Picoult',
        imageURL: 'assets/books_covers/5.jpg',
        description: 'short Description for book',
        price: '9996'),
    CartModels(
        bookName: 'Jodi Picoult',
        imageURL: 'assets/books_covers/8.jpg',
        description: 'short Description for book',
        price: '1121'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Your Cart - (${cartItems.length})"),
        ),
        body: cartItems.isEmpty
            ? Center(
                child: Text("Cart Is Empty"),
              )
            : ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      onTap: () {
                        setState(() {});
                        cartItems.removeAt(index);
                      },
                      leading: Image.asset(cartItems[index].imageURL),
                      title: Text(cartItems[index].bookName),
                      subtitle: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(cartItems[index].description),
                          Text(
                            'Tap to Remove Item',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ],
                      ),
                      isThreeLine: true,
                      trailing: Text(
                        "₹ ${cartItems[index].price}",
                        style: const TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                  );
                }));
  }
}

class CartModels {
  String bookName;
  String price;
  String imageURL;
  String description;

  CartModels(
      {required this.bookName,
      required this.imageURL,
      required this.description,
      required this.price});
}
