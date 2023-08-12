import 'package:flutter/material.dart';

class chapterReading extends StatefulWidget {
  String fversion;
  String fparagraph;
  String sversion;
  String sparagraph;

  chapterReading(
      {Key? key,
      required this.fversion,
      required this.fparagraph,
      required this.sversion,
      required this.sparagraph})
      : super(key: key);

  @override
  State<chapterReading> createState() => _chapterReadingState();
}

class _chapterReadingState extends State<chapterReading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(),
        body: ListView(
          physics: ScrollPhysics(),
          shrinkWrap: true,
          children: [
            Center(
                child: Text(
              widget.fversion,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            )),
            SizedBox(
              height: 8,
            ),
            Text(
              widget.fparagraph,
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(
              height: 12,
            ),
            Center(
                child: Text(
              widget.sversion,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            )),
            SizedBox(
              height: 8,
            ),
            Text(
              widget.sparagraph,
              style: TextStyle(fontSize: 15),
            )
          ],
        ));
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        onPressed: () {},
        icon: Icon(Icons.menu_rounded),
        color: Colors.black,
      ),
      title: const Text(
        "Holy Books",
        style: TextStyle(fontSize: 18, color: Colors.black),
      ),
      centerTitle: true,
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search_outlined,
              color: Colors.black,
            ))
      ],
    );
  }
}
