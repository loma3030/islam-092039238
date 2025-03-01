import 'package:tks/view/screen/support.dart';
import 'package:tks/view/screen/home.dart';
import 'package:tks/view/screen/myfavorite.dart';
import 'package:tks/view/screen/setting.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int currentpage);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentpage = 0;

  List<Widget> listPage = [
    const HomePage(),
    ComplaintScreen(),
    const MyFavorite(),
    const Settings()
  ];

  List bottomappbar = [
    {"title": "Home", "icon": Icons.home},
    {"title": "Complaint", "icon": Icons.support_agent_outlined},
    {"title": "favorite", "icon": Icons.favorite},
    {"title": "Settings", "icon": Icons.settings}
  ];

  @override
  changePage(int i) {
    currentpage = i;
    update();
  }
}
