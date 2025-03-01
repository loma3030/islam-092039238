// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable

import 'package:tks/controler/auth/verifycodesignup_controler.dart';
import 'package:tks/core/class/handlingdataview.dart';
import 'package:tks/core/constant/color.dart';
import 'package:tks/core/functions/alertexitapp.dart';
import 'package:tks/view/widget/auth/customtextbodyauth.dart';
import 'package:tks/view/widget/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class Verfiycodesignup extends StatelessWidget {
  const Verfiycodesignup({super.key});

  @override
  Widget build(BuildContext context) {
    VerifyCodeSignUpControllerImp controller =
        Get.put(VerifyCodeSignUpControllerImp());

    return Scaffold(
        backgroundColor: ColorApp.background,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: ColorApp.background,
          elevation: 0.0,
          title: const Text(
            "Verify Code",
            style: TextStyle(fontFamily: "myfontstart", color: ColorApp.gray),
          ),
        ),
        body: WillPopScope(
          onWillPop: alertExitApp,
          child: GetBuilder<VerifyCodeSignUpControllerImp>(
              builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    padding: const EdgeInsets.all(15),
                    child: ListView(children: [
                      CustomTextTitleAuth(
                        text: "Check Email",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Customtextbodyauth(
                        text: "You can verify your email",
                      ),
                      const SizedBox(height: 20),
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
                          controller.goToSuccessSignUp(verificationCode);
                        }, // end onSubmit
                      ),
                      const SizedBox(height: 40),
                      InkWell(
                        onTap: () {
                          controller.reSend();
                        },
                        child: Center(
                            child: Text(
                          "Resend Verify Code",
                          style: TextStyle(
                              color: ColorApp.praimaryColor, fontSize: 20),
                        )),
                      ),
                      const SizedBox(height: 40),
                      // تنبيه هام
                      Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: ColorApp.gray.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "تنبيه هام:",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: ColorApp.praimaryColor),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "1- سوف يصلك كود التحقق على الجيميل الخاص بك الذي قمت بإدخاله.",
                              style:
                                  TextStyle(fontSize: 16, color: ColorApp.gray),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "2- في حالة لم تستلم الكود اضغط على (Resend Verify Code).",
                              style:
                                  TextStyle(fontSize: 16, color: ColorApp.gray),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "3- في حالة خروجك من التطبيق قبل إدخال كود التحقق فهذا يعني أن حسابك لم يتم تفعيله.",
                              style:
                                  TextStyle(fontSize: 16, color: ColorApp.gray),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "4- لتفعيل حسابك يمكنك التواصل مع فريق الدعم على مدار الساعة 24.",
                              style:
                                  TextStyle(fontSize: 16, color: ColorApp.gray),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "5- للتواصل مع فريق الدعم عبر الواتساب:",
                              style:
                                  TextStyle(fontSize: 16, color: ColorApp.gray),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "01112608734 - 01065145794",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: ColorApp.praimaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 15),
                            Center(
                              child: Text(
                                "نتمنى لكم تجربة ممتعة",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: ColorApp.gray),
                              ),
                            ),
                          ],
                        ),
                      )
                    ]),
                  ))),
        ));
  }
}
