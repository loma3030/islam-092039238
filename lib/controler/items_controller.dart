// ignore_for_file: override_on_non_overriding_member

import 'package:flutter/widgets.dart';
import 'package:tks/controler/search_mix_controller.dart';
import 'package:tks/core/class/StatusRequest.dart';
import 'package:tks/core/functions/handingdatacontroller.dart';
import 'package:tks/core/services/services.dart';
import 'package:tks/data/datasource/model/itemsmodel.dart';
import 'package:tks/data/datasource/remote/items_data.dart';
import 'package:get/get.dart';

abstract class ItemsController extends GetxController {
  intialData();
  changeCat(int val, String catval);
  getItems(String categoryid);
  goToPageProductDetails(ItemsModel itemsModel);
}

class ItemsControllerImp extends SearchMixController {
  List categories = [];
  String? catid;
  int? selectedCat;

  ItemsData testData = ItemsData(Get.find());
  List data = [];
  @override
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();

  @override
  void onInit() {
    search = TextEditingController();
    intialData();
    super.onInit();
  }

  @override
  intialData() {
    categories = Get.arguments['categories'];
    selectedCat = Get.arguments['selectedcat'];
    catid = Get.arguments['catid'];
    getItems(catid!);
  }

  @override
  changeCat(val, catval) {
    selectedCat = val;
    catid = catval;
    getItems(catid!);
    update();
  }

  @override
  getItems(String categoryid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await testData.getData(
        categoryid, myServices.sharedPreferences.getString("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  goToPageProductDetails(itemsModel) {
    Get.toNamed("productdetails", arguments: {"itemsmodel": itemsModel});
  }

  @override
  void onSearchItems() async {
    String searchQuery = search?.text ?? "";
    var response = await testData.searchData(searchQuery);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data = response['data'];
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
