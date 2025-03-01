import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:get/get.dart';
import 'package:tks/controler/cart_controller.dart';
import 'package:tks/core/class/handlingdataview.dart';
import 'package:tks/core/constant/color.dart';
import 'package:tks/view/widget/cart/custom_bottom_navgationbar_cart.dart';
import 'package:tks/view/widget/cart/customitemscartlist.dart';
import 'package:tks/view/widget/cart/topcardcart.dart';
import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.put(CartController());
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            AnimatedTextKit(
              animatedTexts: [
                ColorizeAnimatedText(
                  'cart',
                  textStyle: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  colors: [
                    const Color.fromARGB(255, 2, 173, 45),
                    const Color.fromARGB(255, 90, 173, 97),
                    const Color.fromARGB(255, 8, 105, 13),
                    const Color.fromARGB(255, 2, 63, 10),
                  ],
                  speed: Duration(milliseconds: 300),
                ),
              ],
              isRepeatingAnimation: true,
              repeatForever: true,
            ),
          ],
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: ColorApp.praimaryColor),
      ),
      bottomNavigationBar: GetBuilder<CartController>(
        builder: (controller) => BottomNavgationBarCart(
          totalprice: "${controller.getTotalPrice()}",
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.jpg"), // مسار الصورة
            fit: BoxFit.cover,
          ),
        ),
        child: GetBuilder<CartController>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView(
              children: [
                SizedBox(height: 10),
                TopCardCart(
                  message:
                      "You Have ${cartController.totalcountitems} Items in Your List",
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      ...List.generate(
                        cartController.data.length,
                        (index) => CustomItemsCartList(
                          onAdd: () async {
                            await cartController
                                .add(cartController.data[index].itemsId!);
                            cartController.refreshPage();
                          },
                          onRemove: () async {
                            await cartController
                                .delete(cartController.data[index].itemsId!);
                            cartController.refreshPage();
                          },
                          imagename: "${cartController.data[index].itemsImage}",
                          name: "${cartController.data[index].itemsNameEn}",
                          price: "${cartController.data[index].itemsPrice} \ج",
                          count: "${cartController.data[index].countitems}",
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
