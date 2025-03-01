// ignore_for_file: unused_local_variable

import 'package:tks/controler/productdetails_controller.dart';
import 'package:tks/core/class/handlingdataview.dart';
import 'package:tks/core/constant/color.dart';
import 'package:tks/core/constant/routes.dart';
import 'package:tks/view/widget/productdetails/priceandcount.dart';
import 'package:tks/view/widget/productdetails/toppageproductdetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ProductDetailsControllerImp controller =
        Get.put(ProductDetailsControllerImp());
    return Scaffold(
        bottomNavigationBar: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            height: 40,
            child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: ColorApp.praimaryColor,
                onPressed: () {
                  Get.toNamed(AppRoutes.cart);
                },
                child: const Text(
                  "Go To Cart",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: "myfont"),
                ))),
        body: GetBuilder<ProductDetailsControllerImp>(
            builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView(children: [
                  const TopProductPageDetails(),
                  const SizedBox(
                    height: 100,
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${controller.itemsModel.itemsNameEn}",
                              style: const TextStyle(
                                fontFamily: "myfont",
                                fontSize: 20,
                                color: ColorApp.praimaryColor,
                              )),
                          const SizedBox(height: 10),
                          PriceAndCountItems(
                              onAdd: () {
                                controller.add();
                              },
                              onRemove: () {
                                controller.remove();
                              },
                              price: "${controller.itemsModel.itemsPrice}",
                              count: "${controller.countitems}"),
                          const SizedBox(height: 10),
                          Text(
                              "${controller.itemsModel.itemsDescEn} ${controller.itemsModel.itemsDescAr}",
                              style: Theme.of(context).textTheme.bodyLarge),
                          const SizedBox(height: 10),
                          // const Text("Color",
                          //     style: TextStyle(
                          //       fontFamily: "myfontstart",
                          //       color: ColorApp.praimaryColor,
                          //     )),
                          // const SizedBox(height: 10),
                          // // const SubitemsList()
                        ]),
                  )
                ]))));
  }
}
