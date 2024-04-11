#include "include/libary_componets/libary_componets_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "libary_componets_plugin.h"

void LibaryComponetsPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  libary_componets::LibaryComponetsPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
