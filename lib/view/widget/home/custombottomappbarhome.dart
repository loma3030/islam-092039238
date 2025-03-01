import 'package:tks/controler/homescreen_controller.dart';
import 'package:tks/view/widget/home/custombuttonappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomAppBarHome extends StatelessWidget {
  const CustomBottomAppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) => BottomAppBar(
        color: const Color.fromARGB(0, 3, 3, 3), // جعل اللون شفافًا

        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ...List.generate(controller.listPage.length + 1, (index) {
              int i = index > 2 ? index - 1 : index;
              return index == 2
                  ? const Spacer(flex: 2)
                  : SizedBox(
                      width: 60, // تأكد من أن لديك حجمًا مناسبًا لكل زر
                      child: CustomButtonAppBar(
                        textbutton: controller.bottomappbar[i]['title'],
                        icondata: controller.bottomappbar[i]['icon'],
                        onPressed: () {
                          controller.changePage(i);
                        },
                        active: controller.currentpage == i,
                      ),
                    );
            }),
          ],
        ),
      ),
    );
  }
}
