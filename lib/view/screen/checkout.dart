import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tks/controler/checkout_controller.dart';
import 'package:tks/core/class/handlingdataview.dart';
import 'package:tks/core/constant/color.dart';
import 'package:tks/core/constant/imsgesassets.dart';
import 'package:tks/view/widget/checkout/carddeliveerytype.dart';
import 'package:tks/view/widget/checkout/cardpaymentmethod.dart';
import 'package:tks/view/widget/checkout/cardshippingaddress.dart';

class Checkout extends StatelessWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CheckoutController controller = Get.put(CheckoutController());
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            AnimatedTextKit(
              animatedTexts: [
                ColorizeAnimatedText(
                  'Checkout',
                  textStyle: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  colors: [
                    Colors.purple,
                    Colors.blue,
                    Colors.yellow,
                    Colors.red,
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
      bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: MaterialButton(
            color: ColorApp.praimaryColor,
            textColor: Colors.white,
            onPressed: () {
              controller.checkout();
            },
            child: const Text("Checkout",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          )),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: GetBuilder<CheckoutController>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: const EdgeInsets.all(20),
              child: ListView(
                children: [
                  const Text(
                    "Choose Payment Method",
                    style: TextStyle(
                        color: ColorApp.praimaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  InkWell(
                    onTap: () {
                      controller.choosePaymentMethod("0");
                    },
                    child: CardPaymentMethodCheckout(
                      title: "Cash On Delivery",
                      isActive: controller.paymentMethod == "0",
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Choose Delivery Type",
                    style: TextStyle(
                        color: ColorApp.praimaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          controller.chooseDeliveryType("0");
                        },
                        child: CardDeliveryTypeCheckout(
                          imagename: AppImageAsset.deliveryImage2,
                          title: "Delivery",
                          active: controller.deliveryType == "0",
                        ),
                      ),
                      const SizedBox(width: 10),
                    ],
                  ),
                  const SizedBox(height: 20),
                  if (controller.deliveryType == "0")
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Shipping Address",
                          style: TextStyle(
                              color: ColorApp.praimaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        const SizedBox(height: 10),
                        ...List.generate(
                          controller.dataaddress.length,
                          (index) => InkWell(
                            onTap: () {
                              controller.chooseShippingAddress(
                                  controller.dataaddress[index].addressId!);
                            },
                            child: CardShppingAddressCheckout(
                              title:
                                  "${controller.dataaddress[index].addressName}",
                              body:
                                  "${controller.dataaddress[index].addressCity} ${controller.dataaddress[index].addressStreet}",
                              isactive: controller.addressid ==
                                      controller.dataaddress[index].addressId
                                  ? true
                                  : false,
                            ),
                          ),
                        )
                      ],
                    )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
