import 'package:tks/controler/settings_controller.dart';
import 'package:tks/core/constant/imsgesassets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tks/core/constant/routes.dart';
import 'package:tks/core/localization/changelocal.dart'; // استيراد التحكم في اللغة

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsController controller = Get.put(SettingsController());
    LocaleController localeController = Get.find(); // التحكم في تغيير اللغة

    return Container(
      child: ListView(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                height: Get.width / 3,
                color: const Color.fromARGB(255, 255, 255, 255),
              ),
              Positioned(
                top: Get.width / 3.9,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.grey[100],
                    backgroundImage: const AssetImage(AppImageAsset.avatar),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 100),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Card(
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                // زر تغيير اللغة إلى العربية
                ListTile(
                  onTap: () {
                    localeController.changeLang("ar"); // تغيير اللغة للعربية
                  },
                  tileColor: Colors.white,
                  trailing: Image.asset(
                    'assets/images/egypt-flag-gif.gif', // صورة العلم المصري
                    height: 24,
                    width: 24,
                  ),
                  title: const Text("اللغه العربيه"),
                ),
                // زر تغيير اللغة إلى الإنجليزية
                ListTile(
                  onTap: () {
                    localeController.changeLang("en"); // تغيير اللغة للإنجليزية
                  },
                  tileColor: Colors.white,
                  trailing: Image.asset(
                    'assets/images/am.gif', // صورة العلم الأمريكي
                    height: 24,
                    width: 24,
                  ),
                  title: const Text("English"),
                ),
                // بقية الأزرار
                ListTile(
                  onTap: () {
                    Get.toNamed(AppRoutes.addressview);
                  },
                  tileColor: Colors.white,
                  trailing: const Icon(Icons.location_on_outlined),
                  title: const Text("Address"),
                ),
                ListTile(
                  onTap: () {
                    Get.toNamed(AppRoutes.aboutus);
                  },
                  tileColor: Colors.white,
                  trailing: const Icon(Icons.help_outline_rounded),
                  title: const Text("About us"),
                ),
                ListTile(
                  onTap: () {
                    controller.logout();
                  },
                  tileColor: Colors.white,
                  title: const Text("Logout"),
                  trailing: const Icon(Icons.exit_to_app),
                ),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
