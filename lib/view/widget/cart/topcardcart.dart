import 'package:tks/core/constant/color.dart';
import 'package:flutter/material.dart';

class TopCardCart extends StatelessWidget {
  final String message;
  const TopCardCart({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 5),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      // height: 20,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(message,
          textAlign: TextAlign.center,
          style: const TextStyle(color: ColorApp.praimaryColor)),
    );
  }
}
