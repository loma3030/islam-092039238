// ignore_for_file: unused_local_variable

import 'package:tks/controler/items_controller.dart';
import 'package:tks/controler/favorite_controler.dart'; // تأكد من استيراد وحدة التحكم بالمفضلة
import 'package:tks/core/constant/color.dart';
import 'package:tks/core/constant/imsgesassets.dart';
import 'package:tks/core/functions/translatefatabase.dart';
import 'package:tks/data/datasource/model/itemsmodel.dart';
import 'package:tks/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';

class CustomListItems extends GetView<ItemsControllerImp> {
  final ItemsModel itemsModel;
  const CustomListItems({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToPageProductDetails(itemsModel);
      },
      child: Card(
        color: Colors.white, // Set the background color to white
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Hero(
                    tag: "${itemsModel.itemsId}",
                    child: CachedNetworkImage(
                      imageUrl:
                          "${AppLink.imagestItems}/${itemsModel.itemsImage!}",
                      height: 100,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    translateDatabase(
                        itemsModel.itemsNameAr, itemsModel.itemsNameEn),
                    style: const TextStyle(
                      color: ColorApp.Black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${itemsModel.itemsPrice} EGP",
                        style: const TextStyle(
                          color: ColorApp.praimaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: "sans",
                        ),
                      ),
                      GetBuilder<FavoriteController>(
                        builder: (controller) => IconButton(
                          onPressed: () {
                            if (controller.isFavorite[itemsModel.itemsId] ==
                                "1") {
                              controller.setFavorite(itemsModel.itemsId, "0");
                              controller.removeFavorite(itemsModel.itemsId!);
                            } else {
                              controller.setFavorite(itemsModel.itemsId, "1");
                              controller.addFavorite(itemsModel.itemsId!);
                            }
                          },
                          icon: Icon(
                            controller.isFavorite[itemsModel.itemsId] == "1"
                                ? Icons.favorite
                                : Icons.favorite_border_outlined,
                            color: const Color.fromARGB(255, 255, 0, 0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if (itemsModel.itemsDiscount != "0")
              Positioned(
                top: 0, // تم تغيير الموقع ليكون أسفل
                right: 0.1, // تثبيت الصورة إلى اليسار
                child: Image.asset(
                  AppImageAsset.saleOne,
                  width: 100, // تم تكبير العرض
                ),
              ),
          ],
        ),
      ),
    );
  }
}
