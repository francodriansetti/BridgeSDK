import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'bridgesdk_method_channel.dart';

abstract class BridgesdkPlatform extends PlatformInterface {
  /// Constructs a BridgesdkPlatform.
  BridgesdkPlatform() : super(token: _token);

  static final Object _token = Object();

  static BridgesdkPlatform _instance = MethodChannelBridgesdk();

  /// The default instance of [BridgesdkPlatform] to use.
  ///
  /// Defaults to [MethodChannelBridgesdk].
  static BridgesdkPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [BridgesdkPlatform] when
  /// they register themselves.
  static set instance(BridgesdkPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
