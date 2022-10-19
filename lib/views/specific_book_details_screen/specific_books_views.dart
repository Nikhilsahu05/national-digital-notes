import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocsy_epub_viewer/epub_viewer.dart';
import '../add_to_cart_screen/add_to_cart_view.dart';
import '../order_placed_screen/order_placed_view.dart';
import '../pdf_viewer.dart';
import 'about_this_ebook_view.dart';

// ignore: must_be_immutable
class SpecificBooksViews extends StatefulWidget {
  String bookName;
  String imageURL;
  String category;
  bool free;

  SpecificBooksViews(
      {super.key,
      required this.free,
      required this.bookName,
      required this.imageURL,
      required this.category});

  @override
  State<SpecificBooksViews> createState() => _SpecificBooksViewsState();
}

class _SpecificBooksViewsState extends State<SpecificBooksViews> {
  bool isFaved = false;
  bool addToCart = false;


  bool loading = false;
  Dio dio = Dio();
  String filePath = "";




  callBook() async {
    EpubViewer.setConfig(
        themeColor: Theme.of(context).primaryColor,
        identifier: "iosBook",
        scrollDirection: EpubScrollDirection.ALLDIRECTIONS,
        allowSharing: true,
        enableTts: true,
        nightMode: true);

    // get current locator
    EpubViewer.locatorStream.listen((locator) {});
  await  EpubViewer.openAsset(
      'assets/books_testing.epub',
      lastLocation: EpubLocator.fromJson({
        "bookId": "2239",
        "href": "/OEBPS/ch06.xhtml",
        "created": 1539934158390,
        "locations": {"cfi": "epubcfi(/0!/4/4[simple_book]/2/2/6)"}
      }),
    );
  }





  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print("Book Name : ${widget.bookName}, Image URL : ${widget.imageURL}");
    }

    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        title: Text(widget.bookName),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(const AddToCartView());
              },
              icon: const Icon(Icons.shopping_cart))
        ],
      ),
      body: ListView(children: [
        Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Image.asset(widget.imageURL),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.bookName,
                          style: const TextStyle(fontSize: 20),
                        ),
                        Flexible(
                          child: Text(
                            widget.category,
                            style: TextStyle(
                                fontSize: 12, color: Colors.grey.shade700),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Flexible(
                          child: SizedBox(
                            height: 25,
                            child: ListView(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              children: const [
                                Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                ),
                                Icon(
                                  Icons.star_border,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            widget.free == true
                                ? const Text(
                                    "FREE",
                                    style: TextStyle(
                                        color: Colors.orange,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  )
                                : const Text(
                                    "₹ 999",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        letterSpacing: 1.2,
                                        color: Colors.green),
                                  ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              "₹ 1549",
                              style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  letterSpacing: 1.2,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 35,
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: ElevatedButton(
                            onPressed: () {
                              Future.delayed(const Duration(seconds: 3))
                                  .then((value) {
                                Get.to(const OrderPlaced());
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Icon(Icons.shopping_cart),
                                Text(
                                  "BUY NOW",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              thickness: 1.2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                OutlinedButton(
                    onPressed: () {
                      _settingModalBottomSheet(context);
                    },
                    style: OutlinedButton.styleFrom(
                      //<-- SEE HERE
                      side: const BorderSide(width: 1.0, color: Colors.grey),
                    ),
                    child: const Text(
                      'Read Sample',
                      style: TextStyle(fontSize: 11),
                    )),
                Flexible(
                  child: OutlinedButton(
                    onPressed: () {
                      setState(() {
                        setState(() {
                          isFaved = !isFaved;
                        });
                      });
                      // Get.to(PDFSYNC(
                      //   bookName: widget.bookName,
                      // ));
                    },
                    style: OutlinedButton.styleFrom(
                      //<-- SEE HERE
                      side: const BorderSide(width: 1.0, color: Colors.grey),
                    ),
                    child: isFaved
                        ? const Text(
                            '    Add to Wishlist   ',
                            style: TextStyle(fontSize: 10),
                          )
                        : const Text(
                            'Remove from Wishlist',
                            style: TextStyle(fontSize: 10),
                          ),
                  ),
                ),
                addToCart == false
                    ? ElevatedButton(
                        onPressed: () {
                          setState(() {
                            addToCart = !addToCart;
                          });
                        },
                        child: const Text(
                          "Add to Cart",
                          style: TextStyle(fontSize: 10),
                        ))
                    : ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue.shade200),
                        onPressed: () {
                          setState(() {
                            addToCart = !addToCart;
                          });
                        },
                        child: const Text(
                          "Remove from cart",
                          style: TextStyle(fontSize: 10),
                        ))
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: InkWell(
                onTap: () {
                  if (kDebugMode) {
                    print("About this eBook");
                  }
                  Get.to(AboutThisEBook(
                    bookName: widget.bookName,
                  ));
                },
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "About this eBook",
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.blue,
                        ),
                      ],
                    ),
                    const Text(
                      "Books that you buy on the Google Play website can be read in the app.Books that you buy on the Google Play website can be read in the app.Books that you buy on the Google Play website can be read in the app.Books that you buy on the Google Play website can be read in the app.",
                      style: TextStyle(fontSize: 13),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Published",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    Text(
                      "23 January 2019 * GENERAL PRESS",
                      style: TextStyle(fontSize: 13),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Wrap(
            children: <Widget>[
              ListTile(
                  leading: const Icon(Icons.picture_as_pdf),
                  title: const Text('Open with PDF'),
                  onTap: () => {
                  Get.to(const TestingPDF())
                  }
              ),
              ListTile(
                leading: const Icon(Icons.book),
                title: const Text('Open with Epub'),
                onTap: () {
                  callBook();
                },
              ),
            ],
          );
        }
    );
  }}