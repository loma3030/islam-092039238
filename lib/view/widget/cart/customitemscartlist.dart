import 'package:cached_network_image/cached_network_image.dart';
import 'package:tks/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:tks/linkapi.dart';

class CustomItemsCartList extends StatelessWidget {
  final String name;
  final String price;
  final String count;
  final String imagename;
  final void Function()? onAdd;
  final void Function()? onRemove;
  const CustomItemsCartList({
    super.key,
    required this.name,
    required this.price,
    required this.count,
    required this.imagename,
    required this.onAdd,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white, // تعيين لون الخلفية للـ Card
      child: Container(
        padding:
            const EdgeInsets.all(8.0), // إضافة padding لتفادي تلاصق العناصر
        child: Row(
          children: [
            SizedBox(
              width: 110, // تحديد عرض ثابت للصورة
              height: 90, // تحديد ارتفاع ثابت للصورة
              child: CachedNetworkImage(
                imageUrl: "${AppLink.imagestItems}/$imagename",
                fit: BoxFit.fill, // ملء المساحة بالكامل
                placeholder: (context, url) => const Center(
                    child:
                        CircularProgressIndicator()), // عرض مؤشر التحميل أثناء تحميل الصورة
                errorWidget: (context, url, error) => const Icon(
                    Icons.error), // عرض أيقونة خطأ إذا فشلت عملية تحميل الصورة
              ),
            ),
            const SizedBox(width: 8.0), // إضافة مسافة بين الصورة والنص
            Expanded(
              flex: 3,
              child: ListTile(
                title: Text(name,
                    style: const TextStyle(fontSize: 14)), // تقليص حجم النص
                subtitle: Text(
                  price,
                  style: const TextStyle(
                      color: ColorApp.praimaryColor, fontSize: 15),
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center, // محاذاة العناصر في الوسط عموديًا
                children: [
                  IconButton(
                    onPressed: onAdd,
                    icon: const Icon(Icons.add, size: 20), // تقليص حجم الأيقونة
                  ),
                  Text(
                    count,
                    style: const TextStyle(
                      fontSize: 16, // تقليص حجم الخط
                      fontWeight: FontWeight.bold, // جعل النص بارزًا
                      color: Colors.black, // لون النص
                    ),
                  ),
                  IconButton(
                    onPressed: onRemove,
                    icon: const Icon(Icons.remove,
                        size: 20), // تقليص حجم الأيقونة
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
