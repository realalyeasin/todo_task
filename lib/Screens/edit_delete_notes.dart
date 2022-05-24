import 'package:flutter/material.dart';

class EditDeleteNotes extends StatelessWidget {
  const EditDeleteNotes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(194, 184, 255, 1),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromRGBO(54, 115, 125, 1),
        title: Text("Edit Notes"),),
    );
  }
}
