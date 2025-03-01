// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use, body_might_complete_normally_nullable

import 'package:tks/controler/forgetpassword/forget_controler.dart';
import 'package:tks/core/class/handlingdataview.dart';
import 'package:tks/core/constant/color.dart';
import 'package:tks/core/functions/alertexitapp.dart';
import 'package:tks/view/widget/auth/customButtonauth.dart';
import 'package:tks/view/widget/auth/customtextbodyauth.dart';
import 'package:tks/view/widget/auth/customtextformauth.dart';
import 'package:tks/view/widget/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Forgetpassword extends StatelessWidget {
  const Forgetpassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerImp());

    return Scaffold(
      backgroundColor: ColorApp.background,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorApp.background,
        elevation: 0.0,
        title: Text(
          "45".tr,
          style: TextStyle(fontFamily: "myfontstart", color: ColorApp.gray),
        ),
      ),
      body: WillPopScope(
          onWillPop: alertExitApp,
          child: GetBuilder<ForgetPasswordControllerImp>(
              builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 30),
                    child: Form(
                      key: controller.formstate,
                      child: ListView(children: [
                        const SizedBox(height: 20),
                        CustomTextTitleAuth(text: "27".tr),
                        const SizedBox(height: 10),
                        Customtextbodyauth(
                            // please Enter Your Email Address To Recive A verification code
                            text: "29".tr),
                        const SizedBox(height: 15),
                        Customtextformauth(
                          isNumber: false,
                          valid: (val) {},
                          mycontroller: controller.email,
                          hinttext: "12".tr,
                          iconData: Icons.email_outlined,
                          labeltext: "o12".tr,
                          // mycontroller: ,
                        ),
                        CustomButtomAuth(
                            text: "30".tr,
                            onPressed: () {
                              controller.checkemail();
                            }),
                        const SizedBox(height: 40),
                      ]),
                    ),
                  )))),
    );
  }
}
