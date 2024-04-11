#ifndef FLUTTER_PLUGIN_LIBARY_COMPONETS_PLUGIN_H_
#define FLUTTER_PLUGIN_LIBARY_COMPONETS_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace libary_componets {

class LibaryComponetsPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  LibaryComponetsPlugin();

  virtual ~LibaryComponetsPlugin();

  // Disallow copy and assign.
  LibaryComponetsPlugin(const LibaryComponetsPlugin&) = delete;
  LibaryComponetsPlugin& operator=(const LibaryComponetsPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace libary_componets

#endif  // FLUTTER_PLUGIN_LIBARY_COMPONETS_PLUGIN_H_
