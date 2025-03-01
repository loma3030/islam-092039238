// ignore_for_file: unused_local_variable, unused_element

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tks/controler/home_controller.dart';
import 'package:tks/core/class/handlingdataview.dart';
import 'package:tks/core/constant/routes.dart';
import 'package:tks/data/datasource/model/itemsmodel.dart';
import 'package:tks/linkapi.dart';
import 'package:tks/view/screen/ads2.dart';
import 'package:tks/view/widget/home/customtitlehome.dart';
import 'package:tks/view/widget/home/listcategorieshome.dart';
import 'package:tks/core/constant/color.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeControllerImp controller = Get.put(HomeControllerImp());

    return GetBuilder<HomeControllerImp>(
      builder: (controller) => HandlingDataView(
        statusRequest: controller.statusRequest,
        widget: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: Row(
              children: [
                Icon(Icons.shopify_sharp, color: ColorApp.praimaryColor),
                SizedBox(width: 10),
                Text(
                  "Zahra",
                  style: TextStyle(
                    color: ColorApp.praimaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            actions: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.location_on_outlined,
                        color: const Color.fromARGB(255, 58, 117, 47)),
                    onPressed: () {
                      Get.toNamed(AppRoutes.addressview);
                    },
                  ),
                  Text(
                    "Egypt",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ],
              ),
            ],
          ),
          drawer: Drawer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DrawerHeader(
                  child: Text(
                    "Zahra",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: ColorApp.praimaryColor,
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.favorite,
                      color: const Color.fromARGB(255, 255, 0, 0)),
                  title: Text("المفضلة"),
                  onTap: () {
                    Get.toNamed(AppRoutes.myfavroite);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.info_outline,
                      color: const Color.fromARGB(255, 5, 73, 3)),
                  title: Text("حول التطبيق"),
                  onTap: () {
                    Get.toNamed(AppRoutes.aboutus);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.location_on,
                      color: const Color.fromARGB(255, 0, 100, 0)),
                  title: Text("العنوان"),
                  onTap: () {
                    Get.toNamed(AppRoutes.addressview);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.shopping_cart,
                      color: const Color.fromARGB(255, 0, 100, 0)),
                  title: Text("السلة"),
                  onTap: () {
                    Get.toNamed(AppRoutes.cart);
                  },
                ),
              ],
            ),
          ),
          body: Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ListView(
              children: [
                SizedBox(height: 50),
                AdsCarousel(),
                SizedBox(height: 30),
                CustomTitleHome(title: "55".tr),
                ListCategoriesHome(),
                CustomTitleHome(title: "56".tr),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.75,
                  ),
                  itemCount: controller.items.length,
                  itemBuilder: (context, i) {
                    return SpecialItem(
                      itemsModel: ItemsModel.fromJson(controller.items[i]),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // دالة لإظهار مربع البحث
  void _showSearchDialog(BuildContext context, HomeControllerImp controller) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Search Products'),
          content: TextField(
            controller: controller.search,
            decoration: InputDecoration(hintText: 'Enter product name'),
            onChanged: (val) {
              controller.checkSearch(val); // تحديث نتائج البحث
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}

class SpecialItem extends StatefulWidget {
  final ItemsModel itemsModel;

  const SpecialItem({super.key, required this.itemsModel});

  @override
  _SpecialItemState createState() => _SpecialItemState();
}

class _SpecialItemState extends State<SpecialItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeControllerImp>();
    Object discount = widget.itemsModel.itemsDiscount ??
        0; // فرض أن itemsDiscount هو نسبة الخصم

    return ScaleTransition(
      scale: _animation,
      child: InkWell(
        onTap: () {
          controller.goToPageProductDetails(widget.itemsModel);
        },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            children: [
              // نقل الصورة إلى الأسفل قليلاً
              SizedBox(height: 10), // إضافة مساحة أعلى الصورة
              CachedNetworkImage(
                imageUrl:
                    "${AppLink.imagestItems}/${widget.itemsModel.itemsImage}",
                height: 100,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 10),
              Text(
                "${widget.itemsModel.itemsNameEn}",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${widget.itemsModel.itemsPrice} EGP ",
                      style: TextStyle(
                        color: Colors.green[700],
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "${discount}% off",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
