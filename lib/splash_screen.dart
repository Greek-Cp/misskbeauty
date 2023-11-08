import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
          builder: (context) => MyApp(),
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
            CircularProgressIndicator(),
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

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            WebView(
              initialUrl: 'https://misskbeauty.com.au/',
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController webViewController) {
                _controller.complete(webViewController);
              },
            ),
            Positioned(
              top: 40,
              left: 10,
              child: FloatingActionButton(
                mini: true,
                backgroundColor: Colors.black.withOpacity(0.7),
                child: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () async {
                  WebViewController controller = await _controller.future;
                  if (await controller.canGoBack()) {
                    controller.goBack();
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(SplashScreen());
}
