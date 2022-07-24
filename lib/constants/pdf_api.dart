import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:firebase_storage/firebase_storage.dart';

class pdfApi {
  static Future<File> loadFirebase(String url) async {

  try {  
    final refpdf = FirebaseStorage.instance.ref().child(url);
    final bytes = await refpdf.getData();
    
    return _storeFile(url, bytes!);
  } catch(e) {
    return null!;
  }
  }

  static Future<File> _storeFile(String url, List<int> bytes) async {
    final filename = basename(url);
    final dir = await getApplicationDocumentsDirectory();

    final file = File('${dir.path}/$filename');
    await file.writeAsBytes(bytes, flush: true);
    return file;
  }
}