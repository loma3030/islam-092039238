import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:tks/controler/myfavoritecontroller.dart';
import 'package:tks/core/constant/color.dart';
import 'package:tks/core/functions/translatefatabase.dart';
import 'package:tks/data/datasource/model/favoritemodel.dart';
import 'package:tks/linkapi.dart';

class CustomListFavoriteItems extends GetView<MyFavoriteController> {
  final MyFavoriteModel itemsModel;
  const CustomListFavoriteItems({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // controller.goToPageProductDetails(itemsModel);
      },
      child: Card(
        color: Colors.white, // Set the background color to white
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                tag: "${itemsModel.itemsId}",
                child: CachedNetworkImage(
                  imageUrl: "${AppLink.imagestItems}/${itemsModel.itemsImage!}",
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
                    "${itemsModel.itemsPrice} ج",
                    style: const TextStyle(
                      color: ColorApp.praimaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: "sans",
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      controller.deleteFromFavorite(itemsModel.favoriteId!);
                    },
                    icon: const Icon(
                      Icons.delete_outline_outlined,
                      color: Color.fromARGB(255, 255, 0, 0),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
