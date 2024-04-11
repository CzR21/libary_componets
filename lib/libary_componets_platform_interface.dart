import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'libary_componets_method_channel.dart';

abstract class LibaryComponetsPlatform extends PlatformInterface {
  /// Constructs a LibaryComponetsPlatform.
  LibaryComponetsPlatform() : super(token: _token);

  static final Object _token = Object();

  static LibaryComponetsPlatform _instance = MethodChannelLibaryComponets();

  /// The default instance of [LibaryComponetsPlatform] to use.
  ///
  /// Defaults to [MethodChannelLibaryComponets].
  static LibaryComponetsPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [LibaryComponetsPlatform] when
  /// they register themselves.
  static set instance(LibaryComponetsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
