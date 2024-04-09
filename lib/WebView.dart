import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:camera/camera.dart';
import 'package:bridgesdk/CameraScreen.dart';
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
      appBar: AppBar(
        title: Text('WebView Example'),
      ),
      body: WebView(
        initialUrl: 'https://66155b5735ba8608bb23a4b3--playful-macaron-290701.netlify.app',
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
    print('Authenticating with biometrics...');
    bool authenticated = false;
    try {
      authenticated = await _localAuthentication.authenticate(
        localizedReason: 'Authenticate to access the app',
      );
    } catch (e) {
      print('Error authenticating: $e');
    }

    if (authenticated) {
      print('Biometric authentication successful!');
    } else {
      print('Biometric authentication failed!');
    }
  }
}
