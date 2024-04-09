
import 'bridgesdk_platform_interface.dart';

class Bridgesdk {
  Future<String?> getPlatformVersion() {
    return BridgesdkPlatform.instance.getPlatformVersion();
  }
}
