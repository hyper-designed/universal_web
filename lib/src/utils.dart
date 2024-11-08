import 'package:flutter/cupertino.dart';
import 'package:universal_web/universal_web.dart';

/// Represents rendering engine for web platform.
enum WebRenderer {
  html,
  canvasKit;

  /// Converts the [WebRenderer] to [Platform].
  Platform toPlatform() => switch (this) {
        canvasKit => Platform.webCanvasKit,
        html => Platform.webHtml,
      };
}

/// Represents the platform where the application is running.
enum Platform {
  android('Android'),
  ios('iOS'),
  linux('Linux'),
  macos('macOS'),
  windows('Windows'),
  fuchsia('Fuchsia'),
  wasm('Wasm'),
  webHtml('Web HTML'),
  webCanvasKit('Web CanvasKit');

  const Platform(this.label);

  final String label;

  static Platform get current => UniversalWeb.platform;

  /// Returns the platform from the given string value.
  static Platform fromString(String value) => Platform.values.byName(value);

  static bool get isAndroid => UniversalWeb.platform == Platform.android;

  static bool get isIOS => UniversalWeb.platform == Platform.ios;

  static bool get isLinux => UniversalWeb.platform == Platform.linux;

  static bool get isMacOS => UniversalWeb.platform == Platform.macos;

  static bool get isWindows => UniversalWeb.platform == Platform.windows;

  static bool get isWasm => UniversalWeb.platform == Platform.wasm;

  static bool get isWebHtml => UniversalWeb.platform == Platform.webHtml;

  static bool get isWebCanvasKit =>
      UniversalWeb.platform == Platform.webCanvasKit;

  /// Returns `true` if the platform is web.
  static bool get isWeb => isWasm || isWebHtml || isWebCanvasKit;

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
  ios('iOS'),
  linux('Linux'),
  macos('macOS'),
  windows('Windows'),
  unknown('Unknown');

  const OperatingSystem(this.label);

  final String label;

  /// Returns the operating system from the given string value.
  static OperatingSystem fromString(String value) {
    return OperatingSystem.values.firstWhere(
      (e) => e.toString().toLowerCase() == value.toLowerCase(),
      orElse: () => OperatingSystem.unknown,
    );
  }

  /// Returns the current operating system where the application is running.
  static OperatingSystem get current => UniversalWeb.operatingSystem;
}
