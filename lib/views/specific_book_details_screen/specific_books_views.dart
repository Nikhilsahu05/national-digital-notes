import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../testing_epub.dart';
import '../add_to_cart_screen/add_to_cart_view.dart';
import '../order_placed_screen/order_placed_view.dart';
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
                      Get.to(EPUBTEST(
                          // bookName: widget.bookName,
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

// ignore: must_be_immutable
class PDFSYNC extends StatefulWidget {
  const PDFSYNC({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<PDFSYNC> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();
  final PdfViewerController _pdfViewerController = PdfViewerController();
  Uint8List? _documentBytes;
  OverlayEntry? _overlayEntry;
  double yOffset = 0.0;
  double xOffset = 0.0;
  final Color _contextMenuColor = const Color(0xFFFFFFFF);
  final Color _textColor = const Color(0xFF000000);

  @override
  void initState() {
    getPdfBytes();
    super.initState();
  }

  ///Get the PDF document as bytes
  void getPdfBytes() async {
    _documentBytes = await http.readBytes(Uri.parse(
        'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf'));
    setState(() {});
  }

  ///Add the annotation in PDF document
  Widget _addAnnotation(String? annotationType, String? selectedText) {
    return SizedBox(
      height: 30,
      width: 100,
      child: RawMaterialButton(
        onPressed: () async {
          _checkAndCloseContextMenu();
          await Clipboard.setData(ClipboardData(text: selectedText));
          _drawAnnotation(annotationType);
          print("Selected Text :: $selectedText :: Save to saved notes");
        },
        child: Text(
          annotationType!,
          style: TextStyle(
              color: _textColor,
              fontSize: 10,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400),
        ),
      ),
    );
  }

  ///Draw the annotation in PDF document
  void _drawAnnotation(String? annotationType) {
    final PdfDocument document = PdfDocument(inputBytes: _documentBytes);
    switch (annotationType) {
      case 'Highlight':
        {
          _pdfViewerKey.currentState!
              .getSelectedTextLines()
              .forEach((pdfTextLine) {
            final PdfPage page = document.pages[pdfTextLine.pageNumber];
            final PdfRectangleAnnotation rectangleAnnotation =
                PdfRectangleAnnotation(
                    pdfTextLine.bounds, 'Highlight Annotation',
                    author: 'Syncfusion',
                    color: PdfColor.fromCMYK(0, 0, 255, 0),
                    innerColor: PdfColor.fromCMYK(0, 0, 255, 0),
                    opacity: 0.5);
            page.annotations.add(rectangleAnnotation);
            page.annotations.flattenAllAnnotations();
            xOffset = _pdfViewerController.scrollOffset.dx;
            yOffset = _pdfViewerController.scrollOffset.dy;
          });
          final List<int> bytes = document.saveSync();
          setState(() {
            _documentBytes = Uint8List.fromList(bytes);
          });
        }
        break;
      case 'Underline':
        {
          _pdfViewerKey.currentState!
              .getSelectedTextLines()
              .forEach((pdfTextLine) {
            final PdfPage page = document.pages[pdfTextLine.pageNumber];
            final PdfLineAnnotation lineAnnotation = PdfLineAnnotation(
              [
                pdfTextLine.bounds.left.toInt(),
                (document.pages[pdfTextLine.pageNumber].size.height -
                        pdfTextLine.bounds.bottom)
                    .toInt(),
                pdfTextLine.bounds.right.toInt(),
                (document.pages[pdfTextLine.pageNumber].size.height -
                        pdfTextLine.bounds.bottom)
                    .toInt()
              ],
              'Underline Annotation',
              author: 'Syncfusion',
              innerColor: PdfColor(0, 255, 0),
              color: PdfColor(0, 255, 0),
            );
            page.annotations.add(lineAnnotation);
            page.annotations.flattenAllAnnotations();
            xOffset = _pdfViewerController.scrollOffset.dx;
            yOffset = _pdfViewerController.scrollOffset.dy;
          });
          final List<int> bytes = document.saveSync();
          setState(() {
            _documentBytes = Uint8List.fromList(bytes);
          });
        }
        break;
      case 'Strikethrough':
        {
          _pdfViewerKey.currentState!
              .getSelectedTextLines()
              .forEach((pdfTextLine) {
            final PdfPage page = document.pages[pdfTextLine.pageNumber];
            final PdfLineAnnotation lineAnnotation = PdfLineAnnotation(
              [
                pdfTextLine.bounds.left.toInt(),
                ((document.pages[pdfTextLine.pageNumber].size.height -
                            pdfTextLine.bounds.bottom) +
                        (pdfTextLine.bounds.height / 2))
                    .toInt(),
                pdfTextLine.bounds.right.toInt(),
                ((document.pages[pdfTextLine.pageNumber].size.height -
                            pdfTextLine.bounds.bottom) +
                        (pdfTextLine.bounds.height / 2))
                    .toInt()
              ],
              'Strikethrough Annotation',
              author: 'Syncfusion',
              innerColor: PdfColor(255, 0, 0),
              color: PdfColor(255, 0, 0),
            );
            page.annotations.add(lineAnnotation);
            page.annotations.flattenAllAnnotations();
            xOffset = _pdfViewerController.scrollOffset.dx;
            yOffset = _pdfViewerController.scrollOffset.dy;
          });
          final List<int> bytes = document.saveSync();
          setState(() {
            _documentBytes = Uint8List.fromList(bytes);
          });
        }
        break;
    }
  }

  /// Show Context menu with annotation options.
  void _showContextMenu(
    BuildContext context,
    PdfTextSelectionChangedDetails? details,
  ) {
    final RenderBox renderBoxContainer =
        context.findRenderObject()! as RenderBox;
    const double kContextMenuHeight = 90;
    const double kContextMenuWidth = 100;
    const double kHeight = 18;
    final Offset containerOffset = renderBoxContainer.localToGlobal(
      renderBoxContainer.paintBounds.topLeft,
    );
    if (details != null &&
            containerOffset.dy < details.globalSelectedRegion!.topLeft.dy ||
        (containerOffset.dy <
                details!.globalSelectedRegion!.center.dy -
                    (kContextMenuHeight / 2) &&
            details.globalSelectedRegion!.height > kContextMenuWidth)) {
      double top = 0.0;
      double left = 0.0;
      final Rect globalSelectedRect = details.globalSelectedRegion!;
      if ((globalSelectedRect.top) > MediaQuery.of(context).size.height / 2) {
        top = globalSelectedRect.topLeft.dy +
            details.globalSelectedRegion!.height +
            kHeight;
        left = globalSelectedRect.bottomLeft.dx;
      } else {
        top = globalSelectedRect.height > kContextMenuWidth
            ? globalSelectedRect.center.dy - (kContextMenuHeight / 2)
            : globalSelectedRect.topLeft.dy +
                details.globalSelectedRegion!.height +
                kHeight;
        left = globalSelectedRect.height > kContextMenuWidth
            ? globalSelectedRect.center.dx - (kContextMenuWidth / 2)
            : globalSelectedRect.bottomLeft.dx;
      }
      final OverlayState? overlayState = Overlay.of(context, rootOverlay: true);
      _overlayEntry = OverlayEntry(
        builder: (context) => Positioned(
          top: top,
          left: left,
          child: Container(
            decoration: BoxDecoration(
              color: _contextMenuColor,
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.14),
                  blurRadius: 2,
                  offset: Offset(0, 0),
                ),
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.12),
                  blurRadius: 2,
                  offset: Offset(0, 2),
                ),
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.2),
                  blurRadius: 3,
                  offset: Offset(0, 1),
                ),
              ],
            ),
            constraints: const BoxConstraints.tightFor(
                width: kContextMenuWidth, height: kContextMenuHeight),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _addAnnotation('Highlight', details.selectedText),
                _addAnnotation('Underline', details.selectedText),
                _addAnnotation('Strikethrough', details.selectedText),
              ],
            ),
          ),
        ),
      );
      overlayState?.insert(_overlayEntry!);
    }
  }

  /// Check and close the context menu.
  void _checkAndCloseContextMenu() {
    if (_overlayEntry != null) {
      _overlayEntry?.remove();
      _overlayEntry = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Syncfusion Flutter PDF Viewer'),
      ),
      body: _documentBytes != null
          ? SfPdfViewer.memory(
              scrollDirection: PdfScrollDirection.horizontal,
              enableDoubleTapZooming: true,
              enableDocumentLinkAnnotation: true,
              enableTextSelection: true,
              _documentBytes!,
              key: _pdfViewerKey,
              controller: _pdfViewerController,
              onDocumentLoaded: (PdfDocumentLoadedDetails details) {
                _pdfViewerController.jumpTo(xOffset: xOffset, yOffset: yOffset);
              },
              onTextSelectionChanged: (PdfTextSelectionChangedDetails details) {
                if (details.selectedText == null && _overlayEntry != null) {
                  _checkAndCloseContextMenu();
                } else if (details.selectedText != null &&
                    _overlayEntry == null) {
                  _showContextMenu(context, details);
                }
              },
            )
          : Container(),
    );
  }
}
