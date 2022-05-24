import 'package:get/get.dart';
import 'package:todo_app/Controller/todo_controller.dart';

class ControllerBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<ToDoController>(ToDoController());
  }
}