// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable

import 'package:tks/controler/forgetpassword/resetpassword_controller.dart';
import 'package:tks/core/class/handlingdataview.dart';
import 'package:tks/core/constant/color.dart';
import 'package:tks/core/functions/alertexitapp.dart';
import 'package:tks/core/functions/validinput.dart';
import 'package:tks/view/widget/auth/customButtonauth.dart';
import 'package:tks/view/widget/auth/customtextbodyauth.dart';
import 'package:tks/view/widget/auth/customtextformauth.dart';
import 'package:tks/view/widget/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class resetpassword extends StatelessWidget {
  const resetpassword({super.key});

  @override
  Widget build(BuildContext context) {
    ResetPasswordControllerImp controller =
        Get.put(ResetPasswordControllerImp());

    return Scaffold(
        backgroundColor: ColorApp.background,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: ColorApp.background,
          elevation: 0.0,
          title: Text(
            "46".tr,
            style: TextStyle(fontFamily: "myfontstart", color: ColorApp.gray),
          ),
        ),
        body: WillPopScope(
            onWillPop: alertExitApp,
            child: GetBuilder<ResetPasswordControllerImp>(
                builder: (controller) => HandlingDataView(
                      statusRequest: controller.statusRequest,
                      widget: Container(
                        padding: const EdgeInsets.all(15),
                        child: Form(
                          key: controller.formstate,
                          child: ListView(
                            children: [
                              CustomTextTitleAuth(
                                text: "35".tr,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Customtextbodyauth(
                                text: "34".tr,
                              ),
                              const SizedBox(height: 20),
                              Customtextformauth(
                                isNumber: false,
                                valid: (val) {
                                  return validInput(val!, 8, 20, "19".tr);
                                },
                                mycontroller: controller.password,
                                hinttext: "48".tr,
                                iconData: Icons.remove_red_eye_outlined,
                                labeltext: "19".tr,
                                // mycontroller: ,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Customtextformauth(
                                isNumber: false,

                                valid: (val) {
                                  return validInput(val!, 3, 40, "password");
                                },
                                mycontroller: controller.repassword,
                                hinttext: "o14".tr,
                                iconData: Icons.remove_red_eye_outlined,
                                labeltext: "19".tr,
                                // mycontroller: ,
                              ),
                              CustomButtomAuth(
                                text: "47".tr,
                                onPressed: () {
                                  controller.goToSuccessResetPassword();
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ))));
  }
}
