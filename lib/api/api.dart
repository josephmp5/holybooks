import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
  Future getQuotes() async {
    var uri = Uri.https('uncovered-treasure-v1.p.rapidapi.com', '/today');

    var response = await http.get(uri, headers: {
      'X-RapidAPI-Key': 'd88d0a8158mshb8b539da6b34179p137959jsn31258093d5c2',
      'X-RapidAPI-Host': 'uncovered-treasure-v1.p.rapidapi.com'
    });

    print(response.statusCode);
    print(response.body);
    String data = response.body;
    var output = jsonDecode(data);
    return output;
  }

  Future getBible(String book, String chapter) async {
    var uri = Uri.https('ajith-holy-bible.p.rapidapi.com', '/GetChapter',
        {"Book": book, "chapter": chapter});

    var response = await http.get(uri, headers: {
      'X-RapidAPI-Key': 'd88d0a8158mshb8b539da6b34179p137959jsn31258093d5c2',
      'X-RapidAPI-Host': 'ajith-holy-bible.p.rapidapi.com'
    });

    print(response.statusCode);
    print(response.body);
    String data = response.body;
    var output = jsonDecode(data);
    return output;
  }

  Future getBooks() async {
    var uri = Uri.https(
      'ajith-holy-bible.p.rapidapi.com',
      '/GetBooks',
    );

    var response = await http.get(uri, headers: {
      'X-RapidAPI-Key': 'd88d0a8158mshb8b539da6b34179p137959jsn31258093d5c2',
      'X-RapidAPI-Host': 'ajith-holy-bible.p.rapidapi.com'
    });

    print(response.statusCode);
    print(response.body);
    String data = response.body;
    var output = jsonDecode(data);
    return output;
  }

  Future getQuran(String surah) async {
    var uri = Uri.https(
      'al-quran1.p.rapidapi.com',
      '/${surah}',
    );

    var response = await http.get(uri, headers: {
      'X-RapidAPI-Key': '4c475a8679mshd659a75041ce1aap115573jsn8903b41a82cf',
      'X-RapidAPI-Host': 'al-quran1.p.rapidapi.com'
    });
    print(response.statusCode);
    print(response.body);
    Map<String, dynamic> map = jsonDecode(response.body);

    List myData = [];
    map["verses"].forEach((key, value) {
      myData.add(value);
    });

    return myData;
  }
}
