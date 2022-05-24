import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/utils.dart';
import 'model.dart';

class OnboardingController extends GetxController {
  var selectedPageIndex = 0.obs;
  bool get isLastPage => selectedPageIndex.value == onboardingPages.length - 1;
  var pageController = PageController();

  forwardAction() {
    if (isLastPage) {
      //go to home page
    } else
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
  }

  List<OnboardingInfo> onboardingPages = [
    OnboardingInfo('images/welcome.gif', 'Order Your Food',
        'Now you can order food any time  right from your mobile.'),
    OnboardingInfo('images/pencil.gif', 'Cooking Safe Food',
        'We are maintain safty and We keep clean while making food.'),
    OnboardingInfo('images/list.gif', 'Quick Delivery',
        'Orders your favorite meals will be  immediately deliver')
  ];
}
