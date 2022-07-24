import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:holybooks/constants/book_item.dart';
import 'package:holybooks/constants/pdf_api.dart';
import 'package:holybooks/screens/pdf_view.dart';

class pdfNav extends StatefulWidget {
  const pdfNav({Key? key}) : super(key: key);

  @override
  State<pdfNav> createState() => _pdfNavState();
}

class _pdfNavState extends State<pdfNav> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      
      body: Center(
        
        child: Center(
          
          
  child: StreamBuilder(
     stream: FirebaseFirestore.instance.collection("godsbooks").where('language',isEqualTo: 'en').snapshots(),
      builder: (context,AsyncSnapshot snapshot){
        if(snapshot.hasData) {
          return ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: snapshot.data.docs.length,
            itemBuilder: (context,index) {
              QueryDocumentSnapshot holy = snapshot.data!.docs[index];
               var snap = snapshot.data!.docs[index];
                var anan = snap['image'];
               return InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => PDFViewerPage(url: holy['url'],name: holy['name'])));
                      },
                  child: Container(
                   width: 150,
                   height: 180,
                    margin: EdgeInsets.all(8.0),
                   decoration: BoxDecoration(
                     image: DecorationImage(
                     image: NetworkImage(anan),
                     fit: BoxFit.cover,
                      )
                        ),
                  child: Center(child: Text(snap['name'],style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black87,fontSize: 35),)),
                      )                           
                    );

                  });
              }return Center(child: CircularProgressIndicator());
            }
            ),
            
        )
      ),
      



    );
    
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu_rounded),color: Colors.black,),
      title: const Text("Holy Books",style: TextStyle(fontSize: 18,color: Colors.black),),
      centerTitle: true,
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.search_outlined,color: Colors.black,))
      ],
    
    );
  }
}