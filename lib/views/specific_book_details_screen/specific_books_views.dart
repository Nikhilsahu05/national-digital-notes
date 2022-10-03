import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../add_to_cart_views/add_to_cart_views.dart';
import 'about_this_ebook_view.dart';

class SpecificBooksViews extends StatefulWidget {
  String bookName;
  String imageURL;
  String category;

  SpecificBooksViews(
      {super.key,
      required this.bookName,
      required this.imageURL,
      required this.category});

  @override
  State<SpecificBooksViews> createState() => _SpecificBooksViewsState();
}

class _SpecificBooksViewsState extends State<SpecificBooksViews> {
  bool isFaved = false;
  bool addToCart = false;

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print("Book Name : ${widget.bookName}, Image URL : ${widget.imageURL}");
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.bookName),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart))
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
                          children: const [
                            Text(
                              "₹ 999",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  letterSpacing: 1.2,
                                  color: Colors.green),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
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
                            onPressed: () {},
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
                      Get.to(PDFSYNC(
                        bookName: widget.bookName,
                      ));
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

                          Get.to(AddToCartView(
                            category: widget.category,
                            bookName: widget.bookName,
                            imageURL: widget.imageURL,
                          ));
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
}

class PriceTagPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.green
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill;

    Path path = Path();

    path
      ..moveTo(0, size.height * .5)
      ..lineTo(size.width * .13, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width * .13, size.height)
      ..lineTo(0, size.height * .5)
      ..close();
    canvas.drawPath(path, paint);

    //* Circle
    canvas.drawCircle(
      Offset(size.width * .13, size.height * .5),
      size.height * .15,
      paint..color = Colors.white,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class PDFSYNC extends StatefulWidget {
  String bookName;

  PDFSYNC({super.key, required this.bookName});

  @override
  State<PDFSYNC> createState() => _PDFSYNCState();
}

class _PDFSYNCState extends State<PDFSYNC> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Read Sample Book - ${widget.bookName}'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.bookmark,
                color: Colors.white,
                semanticLabel: 'Bookmark',
              ),
              onPressed: () {
                _pdfViewerKey.currentState?.openBookmarkView();
              },
            ),
          ],
        ),
        body: SfPdfViewer.asset(
          'assets/sample_book.pdf',
          canShowHyperlinkDialog: true,
          canShowPaginationDialog: true,
          canShowPasswordDialog: true,
          canShowScrollHead: true,
          canShowScrollStatus: true,
        ));
  }
}
