import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:holybooks/constants/size.dart';

class Quotes extends StatefulWidget {
  const Quotes({Key? key}) : super(key: key);

  @override
  State<Quotes> createState() => _QuotesState();
}

class _QuotesState extends State<Quotes> {
  @override
  Widget build(BuildContext context) {

    

    return Scaffold(
      
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("daily").orderBy(FieldPath.documentId).limit(5).snapshots(),
      builder: (context,AsyncSnapshot snapshot){
        if(snapshot.hasData) {
        return ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: snapshot.data.docs.length,
            itemBuilder: (context,index) {
              QueryDocumentSnapshot holy = snapshot.data!.docs[index];

              return Column(
                
                children: [
                  
                  Container(
                   
                    child: Card(
                      shadowColor: Colors.yellowAccent,
                      elevation: 8,
                      
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          gradient: LinearGradient(
                            colors: [Colors.deepPurpleAccent,Colors.grey],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight
                            ),
                            

                        ),
                        child: Padding(
                          padding: EdgeInsets.all(25),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(holy['word'],style: TextStyle(color: Colors.white,fontSize: 18),),
                              Text(holy['where'],style: TextStyle(color: Colors.black,fontSize: 15),)
                            ],
                          ),
                        ),
                      )
                    ),
               

                  )
                ],
              );

            }
        );
        }return Center(child: CircularProgressIndicator());
      }
      ),
    );
    
  }


}


