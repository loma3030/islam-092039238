// ignore_for_file: prefer_const_constructors, file_names, unused_import, prefer_const_literals_to_create_immutables

import 'package:tks/controler/onbording_controler.dart';
import 'package:tks/core/constant/color.dart';
import 'package:tks/data/static/static.dart';
import 'package:tks/view/widget/onbording/custtombotton.dart';
import 'package:tks/view/widget/onbording/custtomslider.dart';
import 'package:tks/view/widget/onbording/dotcontroler.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

class OnBording extends StatelessWidget {
  const OnBording({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBordingControlerImp());
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Column(
          children: [
            Expanded(
              flex: 3,
              child: slideronbording(),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  customdotcontroleronbording(),
                  Spacer(),
                  const Custtombottononbording()
                ],
              ),
            ),
          ],
        )));
  }
}
