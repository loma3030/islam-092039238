import 'package:tks/core/class/StatusRequest.dart';
import 'package:tks/core/functions/handingdatacontroller.dart';
import 'package:tks/core/services/services.dart';
import 'package:tks/data/datasource/model/itemsmodel.dart';
import 'package:tks/data/datasource/remote/cart_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ProductDetailsController extends GetxController {}

class ProductDetailsControllerImp extends ProductDetailsController {
  //CartController cartController = Get.put(CartController());

  late ItemsModel itemsModel;

  CartData cartData = CartData(Get.find());

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  int countitems = 0;

  intialData() async {
    statusRequest = StatusRequest.loading;
    itemsModel = Get.arguments['itemsmodel'];
    countitems = await getCountItems(itemsModel.itemsId!);
    statusRequest = StatusRequest.success;
    update();
  }

  getCountItems(String itemsid) async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.getCountCart(
        myServices.sharedPreferences.getString("id")!, itemsid);
    print("=============================== Full response: $response ");

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        int countitems = 0;
        if (response['data'] != null && response['data'].isNotEmpty) {
          countitems = int.tryParse(response['data']) ?? 0;
        }
        print("==================================");
        print("Count items: $countitems");
        return countitems;
      } else {
        print("Error: Failed to retrieve data");
        statusRequest = StatusRequest.failure;
      }
    } else {
      print("Error: Request failed");
    }
    return 0; // Return 0 if there's an error
  }

  addItems(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.addCart(
        myServices.sharedPreferences.getString("id")!, itemsid);
    print("=============================== Add to Cart Response: $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "اشعار",
            messageText: const Text("تم اضافة المنتج الى السلة "));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteitems(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await cartData.deleteCart(
        myServices.sharedPreferences.getString("id")!, itemsid);
    print(
        "=============================== Delete from Cart Response: $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "اشعار",
            messageText: const Text("تم ازالة المنتج من السلة "));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  // List subitems = [
  //   {"name": "red", "id": 1, "active": '0'},
  //   {"name": "yallow", "id": 2, "active": '0'},
  //   {"name": "black", "id": 3, "active": '1'}
  // ];

  add() {
    addItems(itemsModel.itemsId!);
    countitems++;
    update();
  }

  remove() {
    if (countitems > 0) {
      deleteitems(itemsModel.itemsId!);
      countitems--;
      update();
    }
  }

  @override
  void onInit() {
    intialData();
    super.onInit();
  }
}
