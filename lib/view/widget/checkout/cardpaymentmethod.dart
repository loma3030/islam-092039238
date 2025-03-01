import 'package:flutter/material.dart';
import 'package:tks/core/constant/color.dart';

class CardPaymentMethodCheckout extends StatelessWidget {
  final String title;
  final bool isActive;
  const CardPaymentMethodCheckout(
      {Key? key, required this.title, required this.isActive})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          color: isActive == true
              ? const Color.fromARGB(255, 255, 196, 0)
              : ColorApp.praimaryColor,
          borderRadius: BorderRadius.circular(20)),
      child: Text(title,
          style: TextStyle(
              color: isActive == true
                  ? const Color.fromARGB(255, 4, 181, 235)
                  : const Color.fromARGB(255, 255, 196, 0),
              height: 1,
              fontWeight: FontWeight.bold)),
    );
  }
}
