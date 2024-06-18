import 'package:cuteapp/config/helpers/datasource/cuna.dart';
import 'package:cuteapp/config/helpers/models/document.dart';
import 'package:cuteapp/config/themes/appTheme.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewerScreen extends StatelessWidget {
  final Content content;

  const PdfViewerScreen({Key? key, required this.content, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(content.name,style: TextStyle(color: Colors.white),),centerTitle: true,backgroundColor: colorSDATheme,
      ),
      body: SfPdfViewer.network(
        content.content,
       
      ),
    );
  }
}
