import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../Controller/todo_controller.dart';

class EditDeleteNotes extends StatelessWidget {
  EditDeleteNotes({Key? key}) : super(key: key);
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
            backgroundColor: Color.fromRGBO(194, 184, 255, 1),
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Color.fromRGBO(54, 115, 125, 1),
              title: Text("Edit and Delete To-Do"),
            ),
            body: Center(
                child: todo.isLoading
                    ? SizedBox(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        itemCount: todo.todoList.length,
                        itemBuilder: (BuildContext, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 30, right: 30, top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  todo.todoList[index].task,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                        onPressed: () async {
                                          await addEditDelete(
                                              todo,
                                              'Edit',
                                              todo.todoList[index].id,
                                              todo.todoList[index].task);
                                          Get.snackbar(
                                              '${todo.todoList[index].task}',
                                              "Updated",
                                              snackPosition:
                                                  SnackPosition.BOTTOM,
                                              backgroundColor:
                                                  Colors.teal.shade100,
                                              margin: EdgeInsets.only(
                                                  bottom: 18,
                                                  left: 10,
                                                  right: 10));
                                        },
                                        icon: Icon(
                                          FontAwesomeIcons.edit,
                                          color: Colors.blue,
                                        )),
                                    IconButton(
                                        onPressed: () {
                                          todo.delete(todo.todoList[index].id);
                                          Get.snackbar(
                                              '${todo.todoList[index].task}',
                                              "Successfully deleted",
                                              snackPosition:
                                                  SnackPosition.BOTTOM,
                                              backgroundColor:
                                                  Colors.teal.shade100,
                                              margin: EdgeInsets.only(
                                                  bottom: 18,
                                                  left: 10,
                                                  right: 10));
                                        },
                                        icon: Icon(
                                          FontAwesomeIcons.deleteLeft,
                                          color: Colors.pink,
                                        ))
                                  ],
                                )
                              ],
                            ),
                          );
                        })),
          );
        });
  }

  addEditDelete(ToDoController toDoController, String title, String id,
      String task) async {
    if (task.isNotEmpty) {
      _textEditingController.text = task;
    }
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
                    child: Text("Update"))
              ],
            )));
  }
}
