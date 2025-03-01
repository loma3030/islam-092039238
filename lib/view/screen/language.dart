import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tks/core/constant/color.dart';
import 'package:tks/core/constant/routes.dart';
import 'package:tks/core/localization/changelocal.dart';

class Language extends StatelessWidget {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.background,
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // الكرة الأرضية المتحركة بصيغة GIF من assets
            SizedBox(
              height: 180, // تكبير حجم الصورة المتحركة للكرة الأرضية
              child: Image.asset(
                'assets/images/globe.gif', // مسار صورة الـ GIF من assets
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 40),

            // زر اللغة العربية مع علم مصر المتحرك
            SizedBox(
              width: double.infinity, // الزر يكون عريض بعرض الشاشة
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      const Color.fromARGB(255, 255, 255, 255), // خلفية بيضاء
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  LocaleController controller = Get.find();
                  controller.changeLang("ar");
                  Get.toNamed(AppRoutes.OnBording);
                },
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceEvenly, // توزيع بين الصورة والنص
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/egypt-flag-gif.gif', // علم مصر بصيغة GIF
                          height: 24, // تصغير العلم
                          width: 24,
                        ),
                        const SizedBox(width: 3), // مسافة بين العلم والنص
                      ],
                    ),
                    const Text(
                      "اللغه العربيه",
                      style: TextStyle(
                        color: Color(0xFF4B9F5A), // اللون الزيتي الغامق
                        fontFamily: 'myfont',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // زر اللغة الإنجليزية مع علم أمريكا المتحرك
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  LocaleController controller = Get.find();
                  controller.changeLang("en");
                  Get.toNamed(AppRoutes.OnBording);
                },
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceEvenly, // توزيع بين الصورة والنص
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/am.gif', // علم أمريكا بصيغة GIF
                          height: 24, // تصغير العلم
                          width: 24,
                        ),
                        const SizedBox(width: 5), // مسافة بين العلم والنص
                      ],
                    ),
                    const Text(
                      "English",
                      style: TextStyle(
                        color: Color(0xFF4B9F5A), // اللون الزيتي الغامق
                        fontFamily: 'myfont',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
