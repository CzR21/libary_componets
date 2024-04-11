import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'libary_componets_platform_interface.dart';

/// An implementation of [LibaryComponetsPlatform] that uses method channels.
class MethodChannelLibaryComponets extends LibaryComponetsPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('libary_componets');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
