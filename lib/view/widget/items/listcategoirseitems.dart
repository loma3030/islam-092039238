// ignore_for_file: unused_import
import 'package:tks/controler/items_controller.dart';
import 'package:tks/core/constant/color.dart';
import 'package:tks/core/functions/translatefatabase.dart';
import 'package:tks/data/datasource/model/categoriesmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListCategoriesItems extends GetView<ItemsControllerImp> {
  const ListCategoriesItems({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: controller.categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Categories(
            i: index,
            categoriesModel:
                CategoriesModel.fromJson(controller.categories[index]),
          );
        },
      ),
    );
  }
}

class Categories extends GetView<ItemsControllerImp> {
  final CategoriesModel categoriesModel;
  final int? i;
  const Categories({super.key, required this.categoriesModel, required this.i});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //  controller.goToItems(controller.categories, i!);
        controller.changeCat(i!, categoriesModel.categoriesId!);
      },
      child: Column(
        children: [
          GetBuilder<ItemsControllerImp>(
              builder: (controller) => Container(
                    padding:
                        const EdgeInsets.only(right: 10, left: 10, bottom: 5),
                    decoration: controller.selectedCat == i
                        ? const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 3, color: ColorApp.praimaryColor)))
                        : null,
                    child: Text(
                      "${translateDatabase(categoriesModel.categoriesNameAr, categoriesModel.categoriesNameEn)}",
                      style: const TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 119, 119, 119)),
                    ),
                  ))
        ],
      ),
    );
  }
}
