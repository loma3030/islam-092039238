import 'package:tks/controler/myfavoritecontroller.dart';
import 'package:tks/core/class/handlingdataview.dart';
import 'package:tks/view/widget/myfavorite/customlistfavoriteitems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyFavorite extends StatelessWidget {
  const MyFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    // Ensure to initialize the controller
    Get.put(MyFavoriteController());

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Favorites",
          textAlign: TextAlign.center, // Center the text in the AppBar
        ),
        centerTitle: true, // Center the title horizontally in the AppBar
        actions: const [], // Remove the search button
      ),
      body: Container(
        color: Colors.white, // Set the background color of the body to white
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: GetBuilder<MyFavoriteController>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.data.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
              ),
              itemBuilder: (context, index) {
                return CustomListFavoriteItems(
                  itemsModel: controller.data[index],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
