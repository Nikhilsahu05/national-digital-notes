import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../order_placed_screen/order_placed_view.dart';

class AddToCartView extends StatefulWidget {
  const AddToCartView({super.key});

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
  int qn = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Your Cart - (${cartItems.length})"),
        ),
        body: cartItems.isEmpty
            ? const Center(
                child: Text("Cart Is Empty"),
              )
            : Column(
                children: [
                  // GestureDetector(
                  //   onTap: () {
                  //     Get.to(const AllAddressScreen());
                  //   },
                  //   child: Container(
                  //     height: 50,
                  //     color: Colors.blue.shade200,
                  //     child: Row(
                  //       crossAxisAlignment: CrossAxisAlignment.center,
                  //       mainAxisAlignment: MainAxisAlignment.start,
                  //       children: const [
                  //         SizedBox(
                  //           width: 20,
                  //         ),
                  //         Icon(Icons.gps_fixed_outlined),
                  //         SizedBox(
                  //           width: 10,
                  //         ),
                  //         Text("Deliver to Tanmay - Indore 452001")
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.70,
                    child: ListView.builder(
                        itemCount: cartItems.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              elevation: 3,
                              child: Container(
                                color: Colors.grey.shade200,
                                child: Column(
                                  children: [
                                    ListTile(
                                      onTap: () {
                                        setState(() {
                                          cartItems.removeAt(index);
                                        });
                                      },
                                      leading: Image.asset(
                                          cartItems[index].imageURL),
                                      title: Text(cartItems[index].bookName),
                                      subtitle: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(cartItems[index].description),
                                          const Text(
                                            'Tap to Remove Item',
                                            style:
                                                TextStyle(color: Colors.blue),
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
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          height: 30,
                                          width: 30,
                                          decoration: BoxDecoration(
                                              color: Colors.grey.shade300,
                                              shape: BoxShape.circle),
                                          child: IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  if (qn != 0) {
                                                    qn--;
                                                  }
                                                });
                                              },
                                              icon: const Icon(
                                                Icons.remove,
                                                size: 15,
                                              )),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text("$qn"),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          height: 30,
                                          width: 30,
                                          decoration: BoxDecoration(
                                              color: Colors.grey.shade300,
                                              shape: BoxShape.circle),
                                          child: IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  qn++;
                                                });
                                              },
                                              icon: const Icon(
                                                Icons.add,
                                                size: 15,
                                              )),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              setState(() {
                                                cartItems.removeAt(index);
                                              });
                                            },
                                            icon: const Icon(
                                              Icons.delete,
                                              size: 20,
                                            ))
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 50,
                    width: double.maxFinite,
                    child: ElevatedButton(
                        onPressed: () {
                          Future.delayed(const Duration(seconds: 1))
                              .then((value) {
                            Get.to(const OrderPlaced());
                          });
                        },
                        child:
                            const Text("Proceed to Buy (Rs. 5499 - 5 Items)")),
                  )
                ],
              ));
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
