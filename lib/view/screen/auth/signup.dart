// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:tks/controler/auth/signup_controler.dart';
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

class signUp extends StatelessWidget {
  const signUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImp());

    return Scaffold(
        backgroundColor: ColorApp.background,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: ColorApp.background,
          elevation: 0.0,
          title: Text(
            "17".tr,
            style: TextStyle(fontFamily: "myfontstart", color: ColorApp.gray),
          ),
        ),
        body: WillPopScope(
            onWillPop: alertExitApp,
            child: GetBuilder<SignUpControllerImp>(
              builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    padding: const EdgeInsets.all(15),
                    child: Form(
                      key: controller.formstate,
                      child: ListView(
                        children: [
                          CustomTextTitleAuth(
                            text: "o20".tr,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Customtextbodyauth(
                            text: "o21".tr,
                          ),
                          SizedBox(height: 20),
                          Customtextformauth(
                            isNumber: false,
                            valid: (val) {
                              return validInput(val!, 3, 20, "username");
                            },
                            mycontroller: controller.username,
                            hinttext: "23".tr,
                            iconData: Icons.person,
                            labeltext: "20".tr,
                          ),
                          const SizedBox(height: 20),
                          Customtextformauth(
                            isNumber: false,
                            valid: (val) {
                              return validInput(val!, 8, 100, "email");
                            },
                            mycontroller: controller.email,
                            hinttext: "12".tr,
                            iconData: Icons.email,
                            labeltext: "o12".tr,
                          ),
                          SizedBox(height: 20),
                          Customtextformauth(
                            isNumber: true,
                            valid: (val) {
                              return validInput(val!, 10, 18, "phone");
                            },
                            mycontroller: controller.phone,
                            hinttext: "22".tr,
                            iconData: Icons.phone_android,
                            labeltext: "21".tr,
                          ),
                          SizedBox(height: 10),
                          Customtextformauth(
                            isNumber: false,
                            valid: (val) {
                              return validInput(val!, 8, 20, "password");
                            },
                            mycontroller: controller.password,
                            hinttext: "13".tr,
                            iconData: Icons.remove_red_eye_outlined,
                            labeltext: "19".tr,
                            // mycontroller: ,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CustomButtomAuth(
                            text: "17".tr,
                            onPressed: () {
                              controller.signUp();
                            },
                          ),
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("25".tr),
                              InkWell(
                                onTap: () {
                                  controller.goToSignIn();
                                },
                                child: Text("26".tr,
                                    style: TextStyle(
                                        color: ColorApp.praimaryColor,
                                        fontWeight: FontWeight.bold)),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )),
            )));
  }
}
