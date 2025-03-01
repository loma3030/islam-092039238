import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:tks/core/constant/color.dart';

class Affiliation extends StatelessWidget {
  const Affiliation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            // نص متحرك باستخدام AnimatedTextKit في عنوان الـ AppBar
            AnimatedTextKit(
              animatedTexts: [
                ColorizeAnimatedText(
                  'TKS App',
                  textStyle: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  colors: [
                    ColorApp.praimaryColor,
                    const Color.fromARGB(255, 81, 1, 155),
                    Colors.yellow,
                    Colors.red,
                  ],
                  speed: Duration(milliseconds: 300),
                ),
              ],
              isRepeatingAnimation: true,
              repeatForever: true,
            ),
          ],
        ),
        backgroundColor:
            Colors.white, // تغيير خلفية الـ AppBar إلى اللون الأبيض
        iconTheme: IconThemeData(
            color: ColorApp
                .praimaryColor), // تغيير لون الأيقونات إلى اللون الأرجواني
      ),
    );
  }
}
