import 'package:flutter/foundation.dart';

import 'universal_web_io.dart'
    if (dart.library.js_interop) 'universal_web_web.dart';

/// Represents rendering engine for web platform.
enum WebRenderer {
  html,
  canvasKit;

  /// Converts the [WebRenderer] to [Platform].
  Platform toPlatform() => switch (this) {
        canvasKit => Platform.webCanvasKit,
        html => Platform.webHTML,
      };
}

/// Represents the platform where the application is running.
enum Platform {
  android('Android'),
  iOS('iOS'),
  linux('Linux'),
  macOS('macOS'),
  windows('Windows'),
  fuchsia('Fuchsia'),
  webWasm('Web Wasm'),
  webHTML('Web HTML'),
  webCanvasKit('Web CanvasKit');

  const Platform(this.label);

  final String label;

  static Platform get current => UniversalWeb.platform;

  /// Returns the platform from the given string value.
  static Platform fromString(String value) => Platform.values.byName(value);

  static bool get isAndroid => UniversalWeb.platform == Platform.android;

  static bool get isIOS => UniversalWeb.platform == Platform.iOS;

  static bool get isLinux => UniversalWeb.platform == Platform.linux;

  static bool get isMacOS => UniversalWeb.platform == Platform.macOS;

  static bool get isWindows => UniversalWeb.platform == Platform.windows;

  static bool get isWebWasm => UniversalWeb.platform == Platform.webWasm;

  static bool get isWebHTML => UniversalWeb.platform == Platform.webHTML;

  static bool get isWebCanvasKit =>
      UniversalWeb.platform == Platform.webCanvasKit;

  /// Returns `true` if the platform is web.
  static bool get isWeb => isWebWasm || isWebHTML || isWebCanvasKit;

  /// Returns `true` if the platform is desktop.
  static bool get isDesktop => isLinux || isMacOS || isWindows;

  /// Returns `true` if the platform is mobile.
  static bool get isMobile => isAndroid || isIOS;
}

/// Provides extensions to convert [TargetPlatform] to [Platform]
/// and [OperatingSystem].
extension TargetPlatformExt on TargetPlatform {
  Platform toPlatform() => Platform.fromString(name);

  OperatingSystem toOperatingSystem() => OperatingSystem.fromString(name);
}

/// Represents the operating system where the application is running.
enum OperatingSystem {
  android('Android'),
  iOS('iOS'),
  linux('Linux'),
  macOS('macOS'),
  windows('Windows'),
  fuchsia('Fuchsia'),
  unknown('Unknown');

  const OperatingSystem(this.label);

  final String label;

  /// Returns the operating system from the given string value.
  static OperatingSystem fromString(String value) {
    return OperatingSystem.values.firstWhere(
      (e) => e.name.toString().toLowerCase() == value.toLowerCase(),
      orElse: () => OperatingSystem.unknown,
    );
  }

  /// Returns the current operating system where the application is running.
  static OperatingSystem get current => UniversalWeb.operatingSystem;
}
