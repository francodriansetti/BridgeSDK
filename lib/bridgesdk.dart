import 'bridgesdk_platform_interface.dart';
import 'package:flutter/material.dart';
import 'src/WebView.dart';

/// A class that provides access to platform-specific functionality through the Bridgesdk platform interface.
///
/// Use this class to interact with the underlying platform and perform tasks such as getting the platform version
/// and building a web view widget.
class Bridgesdk {
  /// Retrieves the platform version.
  ///
  /// Returns a [Future] containing a [String] representing the platform version.
  /// Use this method to get the platform version of the device.
  Future<String?> getPlatformVersion() async {
    // Use BridgesdkPlatform for platform-specific implementation
    return await BridgesdkPlatform.instance.getPlatformVersion();
  }

  /// Builds a web view widget.
  ///
  /// Returns a [Widget] representing a web view that can be embedded in a Flutter app.
  /// Use this method to create a web view for displaying web content within your app.
  Widget buildWebView() {
    return MyWebView();
  }
}
