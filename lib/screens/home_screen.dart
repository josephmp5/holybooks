import 'package:flutter/material.dart';
import 'package:holybooks/screens/new_testament.dart';
import 'package:holybooks/screens/old_testament.dart';
import 'package:holybooks/screens/quotes.dart';
import 'package:holybooks/screens/quran/surahs.dart';

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

  List<Widget> pages = [Quotes(), Surahs(), NewTestament(), OldTestament()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff303030),
        elevation: 0,
        title: const Text(
          "Holy Books",
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xff303030),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        onTap: onPageChanged,
        currentIndex: _page,
        type: BottomNavigationBarType.fixed,
        unselectedFontSize: 12,
        selectedFontSize: 12,
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
            label: 'Quran',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.monitor_rounded),
            label: 'The New Testament',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.book_online_outlined,
            ),
            label: 'The Old Testament',
          ),
        ],
      ),
    );
  }
}
