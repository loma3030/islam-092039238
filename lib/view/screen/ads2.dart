import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class AdsCarousel extends StatefulWidget {
  const AdsCarousel({super.key});

  @override
  _AdsCarouselState createState() => _AdsCarouselState();
}

class _AdsCarouselState extends State<AdsCarousel> {
  List<String> adImages = []; // لتخزين روابط الصور
  late PageController _pageController;
  late Timer _timer;
  int _currentPage = 0;

  // تحميل الصور من الباك اند
  Future<void> fetchAdImages() async {
    final response = await http.get(Uri.parse(
        'http://81.10.64.250:80/Zahra_store/zahra/ads2.php')); // ضع رابط API الخاص بك هنا

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      setState(() {
        adImages = List<String>.from(data);
      });
      _startAutoScrolling(); // بدء التمرير التلقائي
    } else {
      print("Failed to load ads");
    }
  }

  // بدء التمرير التلقائي
  void _startAutoScrolling() {
    _timer = Timer.periodic(Duration(seconds: 10), (timer) {
      if (_currentPage < adImages.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0; // العودة إلى الصورة الأولى عند الوصول إلى آخر صورة
      }
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.9);
    fetchAdImages(); // جلب الصور عند تحميل الصفحة
  }

  @override
  void dispose() {
    _timer.cancel(); // إيقاف التمرير التلقائي عند التخلص من الصفحة
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return adImages.isEmpty
        ? Center(child: CircularProgressIndicator()) // تحميل البيانات
        : Column(
            children: [
              // شريط التمرير (Carousel)
              Container(
                height: 120, // تحديد ارتفاع الشريط
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: adImages.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5.0), // إضافة المسافة بين الصور
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: AspectRatio(
                          aspectRatio: 3 / 1, // نسبة عرض إلى ارتفاع إعلان بنر
                          child: Image.network(
                            adImages[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              // النقاط التفاعلية (Dots)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(adImages.length, (index) {
                  return AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    margin: EdgeInsets.symmetric(horizontal: 3),
                    height: 6, // حجم النقاط
                    width: _currentPage == index
                        ? 12
                        : 6, // تغيير العرض عند التفعيل
                    decoration: BoxDecoration(
                      color: _currentPage == index
                          ? const Color.fromARGB(255, 7, 104, 4)
                          : Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(3),
                    ),
                  );
                }),
              ),
            ],
          );
  }
}
