// ignore_for_file: unused_local_variable, body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tks/controler/address/adddetails_controller.dart';
import 'package:tks/core/class/handlingdataview.dart';
import 'package:tks/view/widget/auth/customButtonauth.dart';
import 'package:tks/view/widget/auth/customtextformauth.dart';

class AddressAddDetails extends StatelessWidget {
  const AddressAddDetails({super.key});

  @override
  Widget build(BuildContext context) {
    AddAddressDetailsController controller =
        Get.put(AddAddressDetailsController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('add details address'),
      ),
      body: Container(
          padding: const EdgeInsets.all(15),
          child: GetBuilder<AddAddressDetailsController>(
            builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView(children: [
                  Customtextformauth(
                      hinttext: "city",
                      labeltext: "city",
                      iconData: Icons.location_city,
                      mycontroller: controller.city,
                      valid: (val) {},
                      isNumber: false),
                  Customtextformauth(
                      hinttext: "street",
                      labeltext: "street",
                      iconData: Icons.streetview,
                      mycontroller: controller.street,
                      valid: (val) {},
                      isNumber: false),
                  Customtextformauth(
                      hinttext: "name",
                      labeltext: "name",
                      iconData: Icons.near_me,
                      mycontroller: controller.name,
                      valid: (val) {},
                      isNumber: false),
                  Customtextformauth(
                      hinttext: "phone",
                      labeltext: "phone",
                      iconData: Icons.phone,
                      mycontroller: controller.phone,
                      valid: (val) {},
                      isNumber: false),
                  CustomButtomAuth(
                    text: "Add",
                    onPressed: () {
                      controller.addAddress();
                    },
                  )
                ])),
          )),
    );
  }
}
