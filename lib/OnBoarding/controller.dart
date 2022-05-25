import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Screens/home_page.dart';
import 'model.dart';

class OnboardingController extends GetxController {
  var selectedPageIndex = 0.obs;
  bool get isLastPage => selectedPageIndex.value == onboardingPages.length - 1;
  var pageController = PageController();

  forwardAction() {
    if (isLastPage) {
      Get.to(()=> HomePage());
    } else
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
  }

  List<OnboardingInfo> onboardingPages = [
    OnboardingInfo('images/welcome.gif', 'Welcome to To-Do List Application',
        'Here you can make your list easily'),
    OnboardingInfo('images/pencil.gif', 'Listing is easy',
        'You can list anything anytime and find your items any moment'),
    OnboardingInfo('images/list.gif', 'It is highly secured',
    'You can keep you lists here with full trust')
  ];
}
