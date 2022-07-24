
import 'package:flutter/material.dart';
import 'package:holybooks/pdf_nav.dart';
import 'package:holybooks/screens/chapter.dart';
import 'package:holybooks/screens/quotes.dart';
import 'package:holybooks/screens/tr_pdfnav.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  

  int _page = 0;
  onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  List<Widget> pages = [
    Quotes(),
    pdfNav(),
    trPdfnav(),
    chapter()
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu_rounded),color: Colors.black,),
      title: const Text("Holy Books",style: TextStyle(fontSize: 18,color: Colors.black),),
      centerTitle: true,
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.search_outlined,color: Colors.black,))
      ],
      ),
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Color.fromRGBO(26, 26, 26, 1),
        unselectedItemColor: Colors.grey,
        onTap: onPageChanged,
        currentIndex: _page,
        type: BottomNavigationBarType.fixed,
        unselectedFontSize: 14,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Life Changing Quotes',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.book_rounded,
            ),
            label: 'English Holy Books',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.monitor_rounded
            ),
            label: 'Turkish Holy Books',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.book_online_outlined,
            ),
            label: 'Chapters from Holy Books',
          ),
          
        ],
      ),
    );
  }
}
