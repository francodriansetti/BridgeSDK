import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'bridgesdk_platform_interface.dart';

/// An implementation of [BridgesdkPlatform] that uses method channels.
class MethodChannelBridgesdk extends BridgesdkPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('bridgesdk');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
