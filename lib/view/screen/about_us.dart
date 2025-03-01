import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(TksApp());
}

class TksApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
        fontFamily: 'Arial',
      ),
      home: AboutPage(),
    );
  }
}

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/videos/rt.mp4')
      ..setLooping(true)
      ..initialize().then((_) {
        _controller.play();
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // خلفية الفيديو
          SizedBox.expand(
            child: _controller.value.isInitialized
                ? VideoPlayer(_controller)
                : Center(child: CircularProgressIndicator()),
          ),
          // طبقة شفافة فوق الفيديو
          Container(
            color: Colors.black.withOpacity(0.5),
          ),
          // المحتوى
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // صورة المطور
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('assets/developer.jpg'),
                  ),
                  SizedBox(height: 20),
                  // مربع البيانات
                  Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      padding: EdgeInsets.all(20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // عنوان التطبيق
                          Text(
                            'TKS App',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple,
                            ),
                          ),
                          SizedBox(height: 20),
                          // شرح التطبيق
                          Text(
                            'This is an electronic store application for stores. This application was programmed by Professor Islam Ashraf, owner of TKS Programming Company. We also always strive to provide everything that is advanced, modern and 100% secure.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                              height: 1.5,
                            ),
                          ),
                          SizedBox(height: 20),
                          // رسالة شكر
                          Text(
                            'A special thanks to our developer Mr. Islam Ashraf for his dedication and effort in bringing this project to life.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.deepPurple,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
