import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ToDoController extends GetxController{
  Future<void> addToD(String task, bool done) async{
    await FirebaseFirestore.instance.collection('todos').doc().set({
      'task' : task,
      'isDone' : done
    },SetOptions(merge: true)).then((value) => Get.back());
  }
}