import 'package:tks/controler/homescreen_controller.dart';
import 'package:tks/core/constant/routes.dart';
import 'package:tks/view/widget/home/custombottomappbarhome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) => Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 3, 85, 14),
          onPressed: () {
            Get.toNamed(AppRoutes.cart);
          },
          child: const Icon(
            Icons.shopping_basket_outlined,
            color: Colors.white, // تغيير لون الأيقونة إلى الأبيض
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: const CustomBottomAppBarHome(),
        body: Container(
          color: Colors.white, // تعيين الخلفية إلى اللون الأبيض
          child: controller.listPage.elementAt(controller.currentpage),
        ),
        resizeToAvoidBottomInset:
            false, // تمنع تحريك المحتوى عند ظهور لوحة المفاتيح
      ),
    );
  }
}
