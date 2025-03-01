import 'package:tks/core/class/StatusRequest.dart';
import 'package:tks/core/constant/routes.dart';
import 'package:tks/core/functions/handingdatacontroller.dart';
import 'package:tks/core/services/services.dart';
import 'package:tks/data/datasource/model/cartmodel.dart';
import 'package:tks/data/datasource/model/couponmodel.dart';
import 'package:tks/data/datasource/remote/cart_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  TextEditingController? controllercoupon;
  CartData cartData = CartData(Get.find());
  int? discountcoupon = 0;
  String? couponname;
  String? couponid;
  late StatusRequest statusRequest;
  CouponModel? couponModel;
  MyServices myServices = Get.find();
  List<CartModel> data = [];
  double priceorders = 0.0;
  int totalcountitems = 0;

  add(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.addCart(
        myServices.sharedPreferences.getString("id")!, itemsid);
    print("=============================== Controller $response ");
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

  goToPageCheckout() {
    if (data.isEmpty) {
      return Get.snackbar("تنبيه", "السلة فارغة");
    }
    Get.toNamed(AppRoutes.checkout, arguments: {
      "couponid": couponid ?? "0",
      "priceorder": priceorders.toString(),
      "discountcoupon": discountcoupon.toString(),
    })!
        .then((_) {
      clearCart(); // امسح السلة بعد تأكيد الطلب
    });
  }

  clearCart() {
    data.clear();
    totalcountitems = 0;
    priceorders = 0.0;
    update();
    Get.snackbar("تنبيه", "تم إزالة جميع المنتجات من السلة");
  }

  getTotalPrice() {
    double totalPrice = 0.0;

    // حساب الإجمالي لجميع العناصر في السلة
    for (var item in data) {
      // تحويل السعر والعدد إلى أرقام مناسبة
      double itemPrice = double.parse(item.itemsPrice ?? '0.0'); // السعر الفردي
      int countitems = int.parse(item.countitems ?? '1'); // الكمية

      // ضرب السعر في الكمية للحصول على السعر الإجمالي للمنتج
      double itemTotal = itemPrice * countitems;

      // إضافة السعر الإجمالي للمنتج إلى الإجمالي العام
      totalPrice += itemTotal;
    }

    // تطبيق الخصم من القسيمة إذا كان هناك
    if (discountcoupon != null && discountcoupon! > 0) {
      totalPrice -= totalPrice * discountcoupon! / 100;
    }

    return totalPrice;
  }

  delete(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await cartData.deleteCart(
        myServices.sharedPreferences.getString("id")!, itemsid);
    print("=============================== Controller $response ");
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

  checkcoupon() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await cartData.checkCoupon(controllercoupon!.text);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Map<String, dynamic> datacoupon = response['data'];
        couponModel = CouponModel.fromJson(datacoupon);
        discountcoupon = int.parse(couponModel!.couponDiscount!);
        couponname = couponModel!.couponName;
        couponid = couponModel!.couponId;
      } else {
        discountcoupon = 0;
        couponname = null;
        couponid = null;
        Get.snackbar("Warning", "Coupon Not Valid");
      }
    }
    update();
  }

  resetVarCart() {
    totalcountitems = 0;
    priceorders = 0.0;
    data.clear();
  }

  refreshPage() {
    resetVarCart();
    view();
  }

  view() async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await cartData.viewCart(myServices.sharedPreferences.getString("id")!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        if (response['datacart']['status'] == 'success') {
          List dataresponse = response['datacart']['data'];
          Map dataresponsecountprice = response['countprice'];
          data.clear();
          data.addAll(dataresponse.map((e) => CartModel.fromJson(e)));
          totalcountitems = int.parse(dataresponsecountprice['totalcount']);
          priceorders = double.parse(dataresponsecountprice['totalprice']);
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    controllercoupon = TextEditingController();
    view();
    super.onInit();
  }
}
