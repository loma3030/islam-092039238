// ignore_for_file: prefer_const_constructors

import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:tks/controler/cart_controller.dart';
import 'package:tks/core/constant/color.dart';
import 'package:tks/view/widget/cart/buttoncart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavgationBarCart extends GetView<CartController> {
  final String totalprice;
  const BottomNavgationBarCart({
    Key? key,
    required this.totalprice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // تم إزالة الكود المتعلق بالكوبون
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: ColorApp.praimaryColor, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text("Total Price",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: ColorApp.praimaryColor,
                          )),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text("$totalprice \ج",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: ColorApp.praimaryColor,
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          CustomButtonCart(
            textbutton: "Order",
            onPressed: () {
              controller.goToPageCheckout();
            },
          )
        ],
      ),
    );
  }
}
