import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:camera/camera.dart';
import 'package:bridgesdk/CameraScreen.dart';

class MyWebView extends StatefulWidget {
  @override
  _MyWebViewState createState() => _MyWebViewState();
}

class _MyWebViewState extends State<MyWebView> {
  late WebViewController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WebView Example'),
      ),
      body: WebView(
        initialUrl: 'https://6615395828125210e37d973a--playful-macaron-290701.netlify.app',
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
      onMessageReceived: (JavascriptMessage message) {
        String msg = message.message;
        print('Message from JavaScript: $msg');
        if (msg == 'openCamera') {
          _openCamera();
        }
      },
    );
  }

  Future<void> _openCamera() async {
    print('Opening camera app...');
    // Obtain a list of the available cameras on the device.
    final cameras = await availableCameras();
    // Get a specific camera from the list of available cameras.
    final firstCamera = cameras.first;

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => TakePictureScreen(
          camera: firstCamera,
        ),
      ),
    );
  }
}
