import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:holybooks/constants/pdf_api.dart';

class PDFViewerPage extends StatefulWidget {
 
 String url;
 String name;

  PDFViewerPage({
    Key? key,required this.url,required this.name
    
  }) : super(key: key);

  @override
  _PDFViewerPageState createState() => _PDFViewerPageState();
}

class _PDFViewerPageState extends State<PDFViewerPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(      
      appBar: AppBar(
        title: Text(widget.name,style: TextStyle(color: Colors.black),),
        centerTitle: true,
        backgroundColor: Colors.white,
      
      ),
      body: Container(
        child: SfPdfViewer.network(widget.url)
      ),
    );
  }
}