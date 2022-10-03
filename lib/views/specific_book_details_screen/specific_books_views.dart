import 'package:esys_flutter_share_plus/esys_flutter_share_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

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

  @override
  Widget build(BuildContext context) {
    print("Book Name : ${widget.bookName}, Image URL : ${widget.imageURL}");

    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.bookName}'),
        actions: [
          IconButton(
              onPressed: () {
                Share.text(
                  'NDN',
                  '${widget.bookName}',
                  '${widget.imageURL}',
                );
              },
              icon: Icon(Icons.ios_share))
        ],
      ),
      body: ListView(children: [
        Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Stack(alignment: Alignment.center, children: [
                      Image.asset(widget.imageURL),
                      Container(
                        alignment: Alignment.bottomRight,
                        child: IconButton(
                            onPressed: () {
                              setState(() {
                                isFaved = !isFaved;
                                isFaved
                                    ? Get.snackbar(
                                        widget.bookName, "Added to Wishlists")
                                    : Get.snackbar(widget.bookName,
                                        "Removed from Wishlists");
                              });
                            },
                            icon: isFaved
                                ? const Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                  )
                                : const Icon(
                                    Icons.favorite_border_outlined,
                                  )),
                      ),
                    ]),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.bookName,
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          widget.category,
                          style: TextStyle(
                              fontSize: 12, color: Colors.grey.shade700),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Spacer(),
                        SizedBox(
                          height: 50,
                          width: 150,
                          child: CustomPaint(
                            painter: PriceTagPaint(),
                            child: Center(
                              child: Text(
                                "₹ 999",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    letterSpacing: 1.2,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
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
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    //<-- SEE HERE
                    side: BorderSide(width: 1.0, color: Colors.grey),
                  ),
                  child: Text('Read Sample'),
                ),
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    //<-- SEE HERE
                    side: BorderSide(width: 1.0, color: Colors.grey),
                  ),
                  child: Text('Add to cart'),
                ),

                // ElevatedButton(
                //   onPressed: () {},
                //   child: Text("Add to cart"),
                //   style: ElevatedButton.styleFrom(
                //       backgroundColor: Colors.blue.shade300),
                // ),
                ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.shopping_cart),
                      Text("BUY NOW"),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                children: [
                  Icon(
                    Icons.warning_amber,
                    size: 20,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: Text(
                      "Books that you buy on the Google Play website can be read in the app.",
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 1.2,
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: InkWell(
                onTap: () {
                  print("About this eBook");
                  Get.to(AboutThisEBook(
                    bookName: widget.bookName,
                  ));
                },
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
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
                    Text(
                      "Books that you buy on the Google Play website can be read in the app.Books that you buy on the Google Play website can be read in the app.Books that you buy on the Google Play website can be read in the app.Books that you buy on the Google Play website can be read in the app.",
                      style: TextStyle(fontSize: 13),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
