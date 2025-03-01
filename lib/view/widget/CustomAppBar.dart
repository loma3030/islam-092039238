import 'package:tks/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String titleappbar;
  final void Function()? onPressedIcon;
  final void Function()? onPressedIconFavorite;
  final void Function()? onPressedSearch;
  final void Function(String)? onChanged;
  final TextEditingController mycontroller;

  const CustomAppBar({
    super.key,
    required this.titleappbar,
    this.onPressedIcon,
    this.onPressedSearch,
    this.onPressedIconFavorite,
    this.onChanged,
    required this.mycontroller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white, // تعيين لون الخلفية إلى أبيض
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: TextField(
                controller: mycontroller,
                onChanged: onChanged,
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Icon(
                      Icons.search,
                      color: Colors.grey[700],
                    ),
                  ),
                  hintText: titleappbar, // تغيير نص الهينت إلى "search"
                  hintStyle: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[500],
                  ),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 12), // تعديل المحاذاة
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Container(
            decoration: BoxDecoration(
              color: Colors.white, // تعيين لون الخلفية إلى أبيض
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            width: 60,
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: IconButton(
              onPressed: onPressedIconFavorite,
              icon: const Icon(
                Icons.favorite,
                size: 30,
                color: Colors.red, // تعيين لون الأيقونة إلى أحمر
              ),
            ),
          ),
          const SizedBox(width: 10),
          Container(
            decoration: BoxDecoration(
              color: ColorApp.praimaryColor,
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                  color:
                      const Color.fromARGB(255, 250, 250, 250).withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            width: 60,
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: IconButton(
              onPressed: onPressedSearch,
              icon: const Icon(
                Icons.search,
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
