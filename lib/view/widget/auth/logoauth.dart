import 'package:tks/core/constant/imsgesassets.dart';
import 'package:flutter/material.dart';

class Logoauth extends StatelessWidget {
  const Logoauth({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImageAsset.logo1,
      height: 200,
      width: 200,
    );
  }
}
