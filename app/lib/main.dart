import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: WebViewWidget(
          controller: WebViewController()
            ..loadRequest(
              Uri.parse('https://whellcolor.github.io/'),
            ),
        ),
      ),
    );
  }
}
