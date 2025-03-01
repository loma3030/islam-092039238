// ignore_for_file: unused_local_variable

import 'package:tks/core/constant/routes.dart';
import 'package:tks/core/services/services.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  MyServices myServices = Get.find();

  logout() {
    String userid = myServices.sharedPreferences.getString("id")!;
    // تم إزالة FirebaseMessaging
    myServices.sharedPreferences.clear();
    Get.offAllNamed(AppRoutes.login);
  }
}
