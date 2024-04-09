import 'bridgesdk_platform_interface.dart';
import 'package:flutter/material.dart';
import 'src/WebView.dart';

/// A class that provides access to platform-specific functionality through the Bridgesdk platform interface.
///
/// Use this class to interact with the underlying platform and perform tasks such as getting the platform version
/// and building a web view widget.
class Bridgesdk {

  /// Builds a web view widget.
  ///
  /// Returns a [Widget] representing a web view that can be embedded in a Flutter app.
  /// Use this method to create a web view for displaying web content within your app.
  Widget buildWebView() {
    return MyWebView();
  }
}
