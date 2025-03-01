import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tks/controler/orders/archive.dart';
import 'package:tks/core/constant/color.dart';
import 'package:tks/core/constant/routes.dart';
import 'package:tks/data/datasource/model/ordersmodel.dart';

class CardOrdersListArchive extends GetView<OrdersArchiveController> {
  final OrdersModel listdata;

  const CardOrdersListArchive({Key? key, required this.listdata})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("Order Number : #${listdata.ordersId}",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  const Spacer(),
                  // Text(listdata.ordersDatetime!)
                  Text(
                    listdata.ordersDatetime != null
                        ? DateFormat('yyyy-MM-dd')
                            .format(DateTime.parse(listdata.ordersDatetime!))
                        : "Invalid Date",
                    style: const TextStyle(
                        color: ColorApp.praimaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const Divider(),
              Text(
                  "Order Type : ${controller.printOrderType(listdata.ordersType!)}"),
              Text("Order Price : ${listdata.ordersPrice} \ج"),
              Text("Delivery Price : ${listdata.ordersPricedelivery} \ج "),
              Text(
                  "Payment Method : ${controller.printPaymentMethod(listdata.ordersPaymentmethod!)} "),
              Text(
                  "Order Status : ${controller.printOrderStatus(listdata.ordersStatus!)} "),
              const Divider(),
              Row(
                children: [
                  Text("Total Price : ${listdata.ordersId} \ج ",
                      style: const TextStyle(
                          color: ColorApp.praimaryColor,
                          fontWeight: FontWeight.bold)),
                  const Spacer(),
                  MaterialButton(
                    onPressed: () {
                      Get.toNamed(AppRoutes.ordersdetails,
                          arguments: {"ordersmodel": listdata});
                    },
                    color: ColorApp.Black,
                    textColor: ColorApp.praimaryColor,
                    child: const Text("Details"),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
