import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tks/core/class/StatusRequest.dart';
import 'package:tks/core/constant/routes.dart';
import 'package:tks/core/functions/handingdatacontroller.dart';
import 'package:tks/core/services/services.dart';
import 'package:tks/data/datasource/remote/address_data.dart';

class AddAddressDetailsController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;

  final AddressData addressData = AddressData(Get.find());
  final MyServices myServices = Get.find();

  TextEditingController name = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController street = TextEditingController();
  TextEditingController phone = TextEditingController();

  void initializeData() {
    print("Initializing address details.");
  }

  Future<void> addAddress() async {
    statusRequest = StatusRequest.loading;
    update();

    // تأكد من أن المتغيرات ليست فارغة
    if (name.text.isEmpty ||
        city.text.isEmpty ||
        street.text.isEmpty ||
        phone.text.isEmpty) {
      statusRequest = StatusRequest.failure;
      update();
      return; // أوقف التنفيذ إذا كانت القيم فارغة
    }

    var response = await addressData.addData(
      myServices.sharedPreferences.getString("id")!,
      name.text,
      city.text,
      street.text,
      phone.text,

      // تمرير الهاتف هنا
    );

    print("=============================== Controller $response ");

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoutes.homepage);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    initializeData();
    super.onInit();
  }
}
