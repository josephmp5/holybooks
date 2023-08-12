import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:holybooks/screens/biblereading.dart';

class NewChapters extends StatefulWidget {
  final String book;
  const NewChapters({super.key, required this.book});

  @override
  State<NewChapters> createState() => _NewChaptersState();
}

class _NewChaptersState extends State<NewChapters> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: _buildAppBar(),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("the-new-testament")
              .doc(widget.book)
              .collection("Chapters")
              .orderBy("chapter")
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final holy = snapshot.data!.docs[index];

                    return Column(
                      children: [
                        SizedBox(
                          height: 120,
                          width: 120,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BibleReading(
                                          book: holy["book"],
                                          chapter:
                                              holy["chapter"].toString())));
                            },
                            child: Center(
                              child: Container(
                                child: Text(
                                  "Chapter ${holy['chapter']}",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    );
                  });
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Color(0xff303030),
      elevation: 0,
      leading: BackButton(
        color: Colors.white,
      ),
      title: Text(
        widget.book,
        style: TextStyle(fontSize: 18, color: Colors.white),
      ),
      centerTitle: true,
    );
  }
}
