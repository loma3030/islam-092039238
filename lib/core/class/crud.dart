import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:tks/core/class/StatusRequest.dart';
import 'package:tks/core/functions/checkinternet.dart';
import 'package:http/http.dart' as http;

class Crud {
  Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {
    if (await checkInternet()) {
      print("Sending data: $data"); // طباعة البيانات
      var response = await http.post(Uri.parse(linkurl), body: data);
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}"); // طباعة محتوى الاستجابة

      if (response.statusCode == 200 || response.statusCode == 201) {
        try {
          Map responsebody = jsonDecode(response.body);
          print(responsebody);
          return Right(responsebody);
        } catch (e) {
          print("JSON decode error: $e");
          return const Left(StatusRequest.serverfailure);
        }
      } else {
        return const Left(StatusRequest.serverfailure);
      }
    } else {
      return const Left(StatusRequest.offlinefailure);
    }
  }
}
