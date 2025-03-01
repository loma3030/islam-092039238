// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:tks/controler/forgetpassword/verifycode_controller.dart';
import 'package:tks/core/constant/color.dart';
import 'package:tks/view/widget/auth/customtextbodyauth.dart';
import 'package:tks/view/widget/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class Verfiycode extends StatelessWidget {
  const Verfiycode({super.key});

  @override
  Widget build(BuildContext context) {
    VerifyCodeControllerImp controller = Get.put(VerifyCodeControllerImp());

    return Scaffold(
      backgroundColor: ColorApp.background,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorApp.background,
        elevation: 0.0,
        title: const Text(
          "verfiycode",
          style: TextStyle(fontFamily: "myfontstart", color: ColorApp.gray),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            CustomTextTitleAuth(
              text: "Check Email",
            ),
            const SizedBox(
              height: 10,
            ),
            const Customtextbodyauth(
              text: "You can verify your email",
            ),
            SizedBox(height: 20),
            OtpTextField(
              fieldWidth: 50.0,
              borderRadius: BorderRadius.circular(20),
              numberOfFields: 5,
              borderColor: Color(0xFF512DA8),
              //set to true to show as box or false to show as dash
              showFieldAsBox: true,
              //runs when a code is typed in
              onCodeChanged: (String code) {
                //handle validation or checks here
              },
              //runs when every textfield is filled
              onSubmit: (String verificationCode) {
                controller.goToResetPassword(verificationCode);
              }, // end onSubmit
            ),
          ],
        ),
      ),
    );
  }
}
