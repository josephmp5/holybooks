import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:holybooks/api/api.dart';

class BibleReading extends StatefulWidget {
  const BibleReading({super.key, required this.book, required this.chapter});

  final String book;
  final String chapter;

  @override
  State<BibleReading> createState() => _BibleReadingState();
}

class _BibleReadingState extends State<BibleReading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: _buildAppBar(),
      body: Container(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                child: FutureBuilder(
                    future: Api().getBible(widget.book, widget.chapter),
                    builder: (context, snapshot) {
                      final bible = snapshot.data;
                      if (snapshot.hasData) {
                        return Container(
                          child: Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Center(
                              child: Text(
                                bible["Output"],
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                            ),
                          ),
                        );
                      }
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
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
