import 'libary_componets_platform_interface.dart';

class LibaryComponets {
  Future<String?> getPlatformVersion() {
    return LibaryComponetsPlatform.instance.getPlatformVersion();
  }
}
