import 'package:flutter/material.dart';

class SearchNotes extends StatelessWidget {
  const SearchNotes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(232, 245, 182, 1),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromRGBO(54, 115, 125, 1),
        title: Text("Search Notes"),),
    );
  }
}
