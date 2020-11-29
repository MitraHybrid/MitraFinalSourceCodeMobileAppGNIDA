import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';

class PDFDownloader extends StatefulWidget {
  @override
  _PDFDownloaderState createState() => _PDFDownloaderState();
}

class _PDFDownloaderState extends State<PDFDownloader> {
  bool _isLoading = true;
  PDFDocument document;

  @override
  void initState() {
    super.initState();
   // loadDocument();
     changePDF(2);
  }

  changePDF(value) async {
    setState(() => _isLoading = true);
    if (value == 1) {
      document = await PDFDocument.fromAsset('assets/images/all0tte.pdf');
    } else if (value == 2) {
      document = await PDFDocument.fromURL(
          "http://conorlastowka.com/book/CitationNeededBook-Sample.pdf");
    } else {
      document = await PDFDocument.fromAsset('assets/images/all0tte.pdf');
    }
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       
         appBar: AppBar(
           title: const Text('Allotte'),
         ),
        body: Center(
            child: _isLoading
                ? Center(child: CircularProgressIndicator())
                : PDFViewer(document: document)),

      );
    
  }
}