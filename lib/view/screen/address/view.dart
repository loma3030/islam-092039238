// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tks/controler/address/view_controller.dart';
import 'package:tks/core/class/handlingdataview.dart';
import 'package:tks/core/constant/routes.dart';
import 'package:tks/data/datasource/model/addressmodel.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    AddressViewController controller = Get.put(AddressViewController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, // خلفية بيضاء لـ AppBar
        title: ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Colors.green, Colors.yellow, Colors.red], // تدرج لوني للنص
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ).createShader(bounds),
          child: const Text(
            'address',
            style: TextStyle(
              color: Colors.white, // يضمن التدرج اللوني يظهر على النص
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
        ),
        centerTitle: true, // جعل العنوان في المنتصف
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoutes.addressadddetails);
        },
        backgroundColor: const Color(0xFF4B9F5A), // اللون الزيتي الغامق
        child: ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [
              Colors.white,
              Colors.yellow,
              Colors.red
            ], // تدرج في الألوان
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ).createShader(bounds),
          child: const Icon(Icons.add),
        ),
      ),
      body: GetBuilder<AddressViewController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
            child: ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (context, i) {
                return CardAddress(
                  addressModel: controller.data[i],
                  onDelete: () {
                    controller.deleteAddress(controller.data[i].addressId!);
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class CardAddress extends StatelessWidget {
  final AddressModel addressModel;
  final void Function()? onDelete;
  const CardAddress({super.key, required this.addressModel, this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15), // حواف دائرية
      ),
      elevation: 3,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white, // خلفية بيضاء للبطاقة
          borderRadius: BorderRadius.circular(15), // حواف دائرية
          border: Border.all(
            width: 1,
            style: BorderStyle.solid,
            color: Colors.grey[300]!, // لون الحدود
          ),
          gradient: const LinearGradient(
            colors: [Colors.green, Colors.yellow, Colors.red], // تدرج للحواف
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListTile(
          title: Text(addressModel.addressName!),
          subtitle: Text(
              "${addressModel.addressCity!} ${addressModel.addressStreet!}"),
          trailing: IconButton(
            onPressed: onDelete,
            icon: const Icon(Icons.delete_outline),
            color: Colors.red, // لون أيقونة الحذف
          ),
        ),
      ),
    );
  }
}
