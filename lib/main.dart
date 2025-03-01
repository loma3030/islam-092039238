import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tks/bindings/intialbindings.dart';
import 'package:tks/core/constant/color.dart';
import 'package:tks/core/localization/changelocal.dart';
import 'package:tks/core/localization/transaltion.dart';
import 'package:tks/core/services/services.dart';
import 'package:tks/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const tks());
}

class tks extends StatelessWidget {
  const tks({super.key});

  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      title: 'T.K.S',
      locale: controller.language,
      theme: ThemeData(
        fontFamily: "myfontstart",
        textTheme: const TextTheme(
            headlineLarge: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: ColorApp.Black),
            bodyLarge: TextStyle(
                fontFamily: "myfont",
                height: 2,
                color: ColorApp.gray,
                fontWeight: FontWeight.bold,
                fontSize: 14)),
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white, // تعيين لون الخلفية الأساسي
      ),
      initialBinding: InitialBindings(),
      // routes: routes,
      getPages: routes,
    );
  }
}
