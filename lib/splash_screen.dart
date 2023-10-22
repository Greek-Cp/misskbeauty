import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart'; // Ganti dengan impor ke layar selanjutnya di aplikasi Anda

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) =>
              MyApp(), // Ganti dengan layar selanjutnya di aplikasi Anda
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(), // Anda bisa ganti dengan logo atau gambar lain
            SizedBox(height: 20),
            Text(
              "Misskbeauty",
              style: TextStyle(color: Color.fromARGB(255, 246, 0, 68)),
            ),
          ],
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: WebView(
          initialUrl: 'https://misskbeauty.com.au/',
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
