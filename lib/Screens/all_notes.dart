import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:todo_app/Controller/todo_controller.dart';

class AllNotes extends StatelessWidget {
  AllNotes({Key? key,}) : super(key: key);
 ToDoController todo =  Get.put(ToDoController());
 final _formKey = GlobalKey<FormState>();
 TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 182, 201, 1),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromRGBO(54, 115, 125, 1),
        title: Text("All Notes"),),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        onPressed: (){
          Get.defaultDialog(
            title: "Add To Do",
            content: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _textEditingController,
                      validator: (value){
                        if(value!.isEmpty){
                          return "Insert valid input";
                        } return null;
                      },
                    ),
                    ElevatedButton(
                        onPressed: () async => await todo.addToD(_textEditingController.text.trim(), false),
                        child: Text("Save"))
                  ],
                ))
          );
      },child: Icon(FontAwesomeIcons.plus),),
    );
  }
}
