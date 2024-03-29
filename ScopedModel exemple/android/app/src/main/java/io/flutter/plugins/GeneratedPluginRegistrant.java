package io.flutter.plugins;

import io.flutter.plugin.common.PluginRegistry;
import com.notrait.deviceid.DeviceIdPlugin;
import io.flutter.plugins.deviceinfo.DeviceInfoPlugin;

/**
 * Generated file. Do not edit.
 */
public final class GeneratedPluginRegistrant {
  public static void registerWith(PluginRegistry registry) {
    if (alreadyRegisteredWith(registry)) {
      return;
    }
    DeviceIdPlugin.registerWith(registry.registrarFor("com.notrait.deviceid.DeviceIdPlugin"));
    DeviceInfoPlugin.registerWith(registry.registrarFor("io.flutter.plugins.deviceinfo.DeviceInfoPlugin"));
  }

  private static boolean alreadyRegisteredWith(PluginRegistry registry) {
    final String key = GeneratedPluginRegistrant.class.getCanonicalName();
    if (registry.hasPlugin(key)) {
      return true;
    }
    registry.registrarFor(key);
    return false;
  }
}
