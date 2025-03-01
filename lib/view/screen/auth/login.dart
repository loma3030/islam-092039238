// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable, deprecated_member_use

import 'package:tks/controler/auth/login_controler.dart';
import 'package:tks/core/class/handlingdataview.dart';
import 'package:tks/core/constant/color.dart';
import 'package:tks/core/functions/alertexitapp.dart';
import 'package:tks/core/functions/validinput.dart';
import 'package:tks/view/widget/auth/customButtonauth.dart';
import 'package:tks/view/widget/auth/customtextbodyauth.dart';
import 'package:tks/view/widget/auth/customtextformauth.dart';
import 'package:tks/view/widget/auth/customtexttitleauth.dart';
import 'package:tks/view/widget/auth/logoauth.dart';
import 'package:tks/view/widget/auth/textsignup.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class Login extends StatelessWidget {
  const Login({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
      backgroundColor: ColorApp.background,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorApp.background,
        elevation: 0.0,
        title: Text(
          "15".tr,
          style: TextStyle(fontFamily: "myfontstart", color: ColorApp.gray),
        ),
      ),
      body: WillPopScope(
          onWillPop: alertExitApp,
          child: GetBuilder<LoginControllerImp>(
              builder: (controller) => HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 30),
                      child: Form(
                        key: controller.formstate,
                        child: ListView(children: [
                          const Logoauth(),
                          const SizedBox(height: 20),
                          CustomTextTitleAuth(text: "10".tr),
                          const SizedBox(height: 10),
                          Customtextbodyauth(text: "11".tr),
                          const SizedBox(height: 15),
                          Customtextformauth(
                            isNumber: false,

                            valid: (val) {
                              return validInput(val!, 5, 100, "email");
                            },
                            mycontroller: controller.email,
                            hinttext: "12".tr,
                            iconData: Icons.email_outlined,
                            labeltext: "o12".tr,
                            // mycontroller: ,
                          ),
                          GetBuilder<LoginControllerImp>(
                            builder: (controller) => Customtextformauth(
                              obscureText: controller.isshowpassword,
                              onTapIcon: () {
                                controller.showPassword();
                              },
                              isNumber: false,
                              valid: (val) {
                                return validInput(val!, 3, 30, "password");
                              },
                              mycontroller: controller.password,
                              hinttext: "13".tr,
                              iconData: Icons.lock_outline,
                              labeltext: "19".tr,
                              // mycontroller: ,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              controller.goToForgetPassword();
                            },
                            child: Text(
                              "14".tr,
                              textAlign: TextAlign.right,
                            ),
                          ),
                          CustomButtomAuth(
                              text: "15".tr,
                              onPressed: () {
                                controller.login();
                              }),
                          const SizedBox(height: 40),
                          CustomTextSignUpOrSignIn(
                            textone: "16".tr,
                            texttwo: "17".tr,
                            onTap: () {
                              controller.goToSignUp();
                            },
                          )
                        ]),
                      ),
                    ),
                  ))),
    );
  }
}
