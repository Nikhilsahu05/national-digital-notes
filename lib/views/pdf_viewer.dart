import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class TestingPDF extends StatefulWidget {
  const TestingPDF({Key? key}) : super(key: key);

  @override
  State<TestingPDF> createState() => _TestingPDFState();
}

class _TestingPDFState extends State<TestingPDF> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:   SfPdfViewer.asset('assets/ANCIENT_HISTORY.pdf',canShowHyperlinkDialog: true,canShowScrollStatus: true,canShowScrollHead: true,canShowPasswordDialog: true,canShowPaginationDialog: true,enableDocumentLinkAnnotation: true,enableDoubleTapZooming: true,enableHyperlinkNavigation: true,enableTextSelection: true),
    );
  }
}
