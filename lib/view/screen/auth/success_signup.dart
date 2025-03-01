// ignore_for_file: unused_local_variable

import 'package:tks/controler/auth/successsignup_controler.dart';
import 'package:tks/core/constant/color.dart';
import 'package:tks/view/widget/auth/customButtonauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';

class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessSignUpControllerImp controller =
        Get.put(SuccessSignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorApp.background,
        elevation: 0.0,
        title: Text('32'.tr,
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: ColorApp.gray)),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(children: [
          const Center(
              child: Icon(
            Icons.check_circle_outline,
            size: 200,
            color: ColorApp.praimaryColor,
          )),
          Text("37".tr,
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(fontSize: 30)),
          Text("38".tr),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: CustomButtomAuth(
                text: "31".tr,
                onPressed: () {
                  controller.goToPageLogin();
                }),
          ),
          const SizedBox(height: 30)
        ]),
      ),
    );
  }
}
