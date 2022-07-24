import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class BookItem extends StatelessWidget {
  final book;
  const BookItem({Key? key,required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 50,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(book),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(18)
      ),
    );


    
  }
}