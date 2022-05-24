import 'package:flutter/material.dart';

class AllNotes extends StatelessWidget {
  AllNotes({Key? key,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 182, 201, 1),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromRGBO(54, 115, 125, 1),
        title: Text("All Notes"),),
    );
  }
}
