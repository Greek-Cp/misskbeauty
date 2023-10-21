import 'package:flutter/material.dart';
import 'package:misskbeauty/splash_screen.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      // Tambahkan rute lain atau konfigurasi lain jika dix`perlukan
    );
  }
}
