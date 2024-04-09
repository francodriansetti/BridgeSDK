import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:camera/camera.dart';
import 'package:bridgesdk/src/CameraScreen.dart';
import 'package:bridgesdk/src/BiometricAuthenticationScreen.dart';
import 'package:local_auth/local_auth.dart';


class MyWebView extends StatefulWidget {
  @override
  _MyWebViewState createState() => _MyWebViewState();
}

class _MyWebViewState extends State<MyWebView> {
  late WebViewController _controller;
  final LocalAuthentication _localAuthentication = LocalAuthentication();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        initialUrl: 'https://6615610d69248e09b5125b1f--playful-macaron-290701.netlify.app',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController controller) {
          _controller = controller;
        },
        javascriptChannels: <JavascriptChannel>[
          _toFlutterChannel(context),
        ].toSet(),
      ),
    );
  }

  JavascriptChannel _toFlutterChannel(BuildContext context) {
    return JavascriptChannel(
      name: 'ToFlutter',
      onMessageReceived: (JavascriptMessage message) async {
        String msg = message.message;
        print('Message from JavaScript: $msg');
        if (msg == 'openCamera') {
          _openCamera();
        } else if (msg == 'openBiometricAuthentication') {
          await _authenticateBiometric();
        }
      },
    );
  }

  Future<void> _openCamera() async {
    print('Opening camera app...');
    final cameras = await availableCameras();
    final firstCamera = cameras.first;

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => TakePictureScreen(
          camera: firstCamera,
        ),
      ),
    );
  }

  Future<void> _authenticateBiometric() async {

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => BiometricAuthenticationScreen(),
      ),
    );
  }
}
