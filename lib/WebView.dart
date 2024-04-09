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
  late List<CameraDescription> _cameras;
  late CameraController _cameraController;

  @override
  void initState() {
    super.initState();
    initializeCamera();
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  Future<void> initializeCamera() async {
    _cameras = await availableCameras();
    _cameraController = CameraController(_cameras[0], ResolutionPreset.medium);
    await _cameraController.initialize();
  }

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

  void _openCamera() {
    print('Opening camera app...');
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CameraScreen(),
      ),
    );
  }
}
