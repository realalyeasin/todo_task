import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Controller/todo_controller.dart';

class SearchNotes extends StatelessWidget {
  SearchNotes({Key? key}) : super(key: key);
  ToDoController todo = Get.put(ToDoController());
  @override
  Widget build(BuildContext context) {
    String q = '';
    return Obx(()=>Scaffold(
        backgroundColor: Color.fromRGBO(232, 245, 182, 1),
        appBar: AppBar(
            toolbarHeight: 70,
            backgroundColor: Color.fromRGBO(54, 115, 125, 1),
            title: Card(
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(FontAwesomeIcons.search),
                  hintText: 'Search To-Do',
                  border: InputBorder.none,
                  floatingLabelAlignment: FloatingLabelAlignment.center,
                ),
                onChanged: (value){
                  q=value;
                  todo.getSearch(q);
                },),
            )),
        body: ListView.builder(
            itemCount: todo.searchList.value.length,
            itemBuilder: (BuildContext,index){
              return Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 10),
                child: Row(
                  children: [
                    Text('${todo.searchList.value[index]['task']}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ],
                ),
              );
            })

    ));
  }
}
