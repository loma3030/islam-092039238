import 'package:tks/controler/favorite_controler.dart';
import 'package:tks/controler/items_controller.dart';
import 'package:tks/core/class/handlingdataview.dart';
import 'package:tks/core/constant/routes.dart';
import 'package:tks/data/datasource/model/itemsmodel.dart';
import 'package:tks/view/widget/CustomAppBar.dart';
import 'package:tks/view/widget/items/customlistitems.dart';
import 'package:tks/view/widget/items/listcategoirseitems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize controllers
    final itemsController = Get.put(ItemsControllerImp());
    final favoriteController = Get.put(FavoriteController());

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            CustomAppBar(
              mycontroller: itemsController.search!,
              titleappbar: "Find Product",
              onPressedSearch: () {
                itemsController.onSearchItems();
              },
              onChanged: (val) {
                itemsController.checkSearch(val);
              },
              onPressedIconFavorite: () {
                Get.toNamed(AppRoutes.myfavroite);
              },
            ),
            const SizedBox(height: 20),
            const ListCategoriesItems(),
            GetBuilder<ItemsControllerImp>(
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
                  itemBuilder: (BuildContext context, index) {
                    // Update favorite status
                    final itemId = controller.data[index]['items_id'];
                    final isFavorite = controller.data[index]['favorite'];
                    favoriteController.isFavorite[itemId] = isFavorite;

                    return CustomListItems(
                      itemsModel: ItemsModel.fromJson(controller.data[index]),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
