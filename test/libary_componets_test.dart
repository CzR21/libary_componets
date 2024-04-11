import 'package:flutter_test/flutter_test.dart';
import 'package:libary_componets/libary_componets.dart';
import 'package:libary_componets/libary_componets_platform_interface.dart';
import 'package:libary_componets/libary_componets_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockLibaryComponetsPlatform
    with MockPlatformInterfaceMixin
    implements LibaryComponetsPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final LibaryComponetsPlatform initialPlatform = LibaryComponetsPlatform.instance;

  test('$MethodChannelLibaryComponets is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelLibaryComponets>());
  });

  test('getPlatformVersion', () async {
    LibaryComponets libaryComponetsPlugin = LibaryComponets();
    MockLibaryComponetsPlatform fakePlatform = MockLibaryComponetsPlatform();
    LibaryComponetsPlatform.instance = fakePlatform;

    expect(await libaryComponetsPlugin.getPlatformVersion(), '42');
  });
}
