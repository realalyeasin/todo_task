import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:todo_app/Controller/todo_controller.dart';

class AllNotes extends StatelessWidget {
  AllNotes({
    Key? key,
  }) : super(key: key);
  ToDoController todo = Get.put(ToDoController());
  final _formKey = GlobalKey<FormState>();
  TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ToDoController>(
        init: ToDoController(),
        initState: (_) {},
        builder: (todo) {
          todo.getData();
          return Scaffold(
            backgroundColor: Color.fromRGBO(245, 182, 201, 1),
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Color.fromRGBO(54, 115, 125, 1),
              title: Text("All To-Dos"),
            ),
            body: Center(
                child: todo.isLoading
                    ? SizedBox(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.separated(
                        itemCount: todo.todoList.length,
                        itemBuilder: (BuildContext, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 30, right: 30, top: 10),
                            child: Row(
                              children: [
                                Checkbox(
                                    value: todo.todoList[index].isDone,
                                    onChanged: (value) => {
                                          todo.addToD(
                                              todo.todoList[index].task,
                                              !todo.todoList[index].isDone,
                                              todo.todoList[index].id)
                                        }),
                                Text(
                                  todo.todoList[index].task,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return Divider(
                            color: Colors.black,
                            indent: 25,
                            endIndent: 25,
                            thickness: 1,
                          );
                        },
                      )),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              onPressed: () async {
                await addEditDelete(todo, 'Add To Do', '');
                Get.snackbar('Great!', "Added new item",
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.teal.shade100,
                    margin: EdgeInsets.only(bottom: 18, left: 10, right: 10));
              },
              child: Icon(FontAwesomeIcons.plus),
            ),
          );
        });
  }

  addEditDelete(ToDoController toDoController, String title, String id) async {
    await Get.defaultDialog(
        title: title,
        content: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _textEditingController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Insert valid input";
                    }
                    return null;
                  },
                ),
                ElevatedButton(
                    onPressed: () async => await todo.addToD(
                        _textEditingController.text.trim(), false, id),
                    child: Text("Save"))
              ],
            )));
  }
}
