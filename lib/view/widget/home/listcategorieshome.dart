import 'package:tks/controler/home_controller.dart';
import 'package:tks/core/constant/color.dart';
import 'package:tks/core/functions/translatefatabase.dart';
import 'package:tks/data/datasource/model/categoriesmodel.dart';
import 'package:tks/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListCategoriesHome extends GetView<HomeControllerImp> {
  const ListCategoriesHome({super.key});

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

class Categories extends GetView<HomeControllerImp> {
  final CategoriesModel categoriesModel;
  final int? i;
  const Categories({super.key, required this.categoriesModel, required this.i});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToItems(
            controller.categories, i!, categoriesModel.categoriesId!);
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color:
                  const Color.fromARGB(255, 131, 131, 131), // تغيير لون الخلفية
              borderRadius: BorderRadius.circular(35), // جعل الحواف مستديرة
            ),
            padding: const EdgeInsets.all(5), // إضافة بعض المساحة الداخلية
            height: 70,
            width: 70,
            child: ClipOval(
              // يجعل الصورة مستديرة
              child: Image.network(
                "${AppLink.imagestCategories}/${categoriesModel.categoriesImage}",
                fit: BoxFit.cover, // اضبط حسب الحاجة
              ),
            ),
          ),
          const SizedBox(height: 5), // مساحة بين الصورة والنص
          Text(
            "${translateDatabase(categoriesModel.categoriesNameAr, categoriesModel.categoriesNameEn)}",
            style: const TextStyle(fontSize: 13, color: ColorApp.Black),
          ),
        ],
      ),
    );
  }
}
