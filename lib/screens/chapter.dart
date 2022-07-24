import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:holybooks/screens/chapter_reading.dart';

class chapter extends StatefulWidget {
  const chapter({Key? key}) : super(key: key);

  @override
  State<chapter> createState() => _chapterState();
}

class _chapterState extends State<chapter> {
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.transparent,
      
      body: Center(
        
        child: Center(
          
          
  child: StreamBuilder(
     stream: FirebaseFirestore.instance.collection("chapters").snapshots(),
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => chapterReading(fversion: snap['fversion'],fparagraph: snap['fparagraph'],sversion: snap['sversion'],sparagraph: snap['sparagraph'])));
                      },
                  child: Container(
                   width: 270,
                   height: 360,
                   
                    margin: EdgeInsets.all(8.0),
                   decoration: BoxDecoration(
                     image: DecorationImage(
                      colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.darken),
                     image: NetworkImage(anan),
                     fit: BoxFit.cover,
                      )
                        ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      
                      Container(child: Text(snap['prewrite'],style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 25),)),
                    ],
                  ),
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