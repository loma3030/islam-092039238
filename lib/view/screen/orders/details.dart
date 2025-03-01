// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tks/controler/orders/details.dart';
import 'package:tks/core/class/handlingdataview.dart';
import 'package:tks/core/constant/color.dart';

class OrdersDetails extends StatelessWidget {
  const OrdersDetails({super.key});

  @override
  Widget build(BuildContext context) {
    OrdersDetailsController controller = Get.put(OrdersDetailsController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders Details'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: GetBuilder<OrdersDetailsController>(
          builder: ((controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: ListView(children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      children: [
                        Table(
                          children: [
                            TableRow(children: [
                              Text("Item",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: ColorApp.praimaryColor,
                                      fontWeight: FontWeight.bold)),
                              Text("QTY",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: ColorApp.praimaryColor,
                                      fontWeight: FontWeight.bold)),
                              Text("Price",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: ColorApp.praimaryColor,
                                      fontWeight: FontWeight.bold)),
                            ]),
                            ...List.generate(
                                controller.data.length,
                                (index) => TableRow(children: [
                                      Text(
                                          "${controller.data[index].itemsNameEn}",
                                          textAlign: TextAlign.center),
                                      Text(
                                          "${controller.data[index].countitems}",
                                          textAlign: TextAlign.center),
                                      Text(
                                          "${controller.data[index].itemsPrice}",
                                          textAlign: TextAlign.center),
                                    ]))
                          ],
                        ),
                        SizedBox(height: 10),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                              "Total Price : ${controller.ordersModel.ordersTotalprice}\ج",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: ColorApp.praimaryColor,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),
                ),
                if (controller.ordersModel.ordersType == "0")
                  Card(
                    child: Container(
                      child: ListTile(
                        title: const Text("Shipping Address",
                            style: TextStyle(
                                color: ColorApp.praimaryColor,
                                fontWeight: FontWeight.bold)),
                        subtitle: Text(
                            "${controller.ordersModel.addressCity} ${controller.ordersModel.addressStreet}"),
                      ),
                    ),
                  ),
              ]))),
        ),
      ),
    );
  }
}
