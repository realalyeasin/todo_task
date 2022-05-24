import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:todo_app/Screens/BottomNavBar/bnb_controller.dart';
import 'package:todo_app/Screens/search_notes.dart';

import 'all_notes.dart';
import 'edit_delete_notes.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  BNBController bnbController = Get.put(BNBController());
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
        body:
           IndexedStack(
            index: bnbController.tabIndex.value,
            children: [
              AllNotes(),
              SearchNotes(),
              EditDeleteNotes()
            ],
          ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: bnbController.changeTabIndex,
          currentIndex: bnbController.tabIndex.value,
          backgroundColor: Colors.lightBlueAccent.shade100,
          items: [
            BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.noteSticky),label: 'All Notes' ),
            BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.search),label: 'Search Notes' ),
            BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.edit),label: 'Edit Notes' ),
          ],

        )
    ));}

}
