import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:tks/core/constant/routes.dart';
import 'package:tks/core/midelware/mymidelware.dart';
import 'package:tks/view/screen/about_us.dart';
import 'package:tks/view/screen/address/adddetails.dart';
import 'package:tks/view/screen/address/view.dart';
import 'package:tks/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:tks/view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'package:tks/view/screen/auth/forgetpassword/verfiyCode.dart';
import 'package:tks/view/screen/auth/login.dart';
import 'package:tks/view/screen/auth/signup.dart';
import 'package:tks/view/screen/auth/success_signup.dart';
import 'package:tks/view/screen/cart.dart';
import 'package:tks/view/screen/checkout.dart';
import 'package:tks/view/screen/homescreen.dart';
import 'package:tks/view/screen/items.dart';
import 'package:tks/view/screen/language.dart';
import 'package:tks/view/screen/onbording.dart';
import 'package:tks/view/screen/orders/archive.dart';
import 'package:tks/view/screen/orders/details.dart';
import 'package:tks/view/screen/orders/pending.dart';
import 'package:tks/view/screen/productdetails.dart';
import 'package:tks/view/screen/setting.dart';

import 'view/screen/auth/forgetpassword/forgetpassword.dart';
import 'view/screen/auth/verfiycodesignup.dart';
import 'view/screen/myfavorite.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: "/", page: () => const Language(), middlewares: [MyMiddleWare()]),

  //GetPage(name: "/", page: () => HomeScreen()),
  GetPage(name: AppRoutes.login, page: () => const Login()),
  GetPage(name: AppRoutes.SignUp, page: () => const signUp()),
  GetPage(name: AppRoutes.forgetPassword, page: () => const Forgetpassword()),
  GetPage(name: AppRoutes.verfiyCode, page: () => const Verfiycode()),
  GetPage(name: AppRoutes.resetPassword, page: () => const resetpassword()),
  GetPage(
      name: AppRoutes.successResetpassword,
      page: () => const SuccessResetPassword()),
  GetPage(name: AppRoutes.successSignUp, page: () => const SuccessSignUp()),
  GetPage(name: AppRoutes.OnBording, page: () => const OnBording()),
  GetPage(
      name: AppRoutes.verfiyCodeSignUp, page: () => const Verfiycodesignup()),
  GetPage(name: AppRoutes.homepage, page: () => const HomeScreen()),
  GetPage(name: AppRoutes.items, page: () => const Items()),
  GetPage(name: AppRoutes.productdetails, page: () => const ProductDetails()),
  GetPage(name: AppRoutes.myfavroite, page: () => const MyFavorite()),
  GetPage(name: AppRoutes.cart, page: () => const Cart()),
  GetPage(name: AppRoutes.addressview, page: () => const AddressView()),
  // GetPage(name: AppRoutes.addressadd, page: () => const AddressAdd()),
  GetPage(name: AppRoutes.checkout, page: () => const Checkout()),
  GetPage(name: AppRoutes.orderspending, page: () => const OrdersPending()),
  GetPage(name: AppRoutes.ordersarchive, page: () => const OrdersArchiveView()),
  GetPage(name: AppRoutes.ordersdetails, page: () => const OrdersDetails()),
  GetPage(
      name: AppRoutes.addressadddetails, page: () => const AddressAddDetails()),
  GetPage(name: AppRoutes.aboutus, page: () => AboutPage()),
  GetPage(name: AppRoutes.set, page: () => Settings()),
];
