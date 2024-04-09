import 'package:flutter_test/flutter_test.dart';
import 'package:bridgesdk/bridgesdk.dart';
import 'package:bridgesdk/bridgesdk_platform_interface.dart';
import 'package:bridgesdk/bridgesdk_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockBridgesdkPlatform
    with MockPlatformInterfaceMixin
    implements BridgesdkPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final BridgesdkPlatform initialPlatform = BridgesdkPlatform.instance;

  test('$MethodChannelBridgesdk is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelBridgesdk>());
  });

  test('getPlatformVersion', () async {
    Bridgesdk bridgesdkPlugin = Bridgesdk();
    MockBridgesdkPlatform fakePlatform = MockBridgesdkPlatform();
    BridgesdkPlatform.instance = fakePlatform;

    expect(await bridgesdkPlugin.getPlatformVersion(), '42');
  });
}
