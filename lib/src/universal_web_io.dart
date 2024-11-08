import 'package:flutter/foundation.dart';

import 'utils.dart';

/// Stub class for web.
class UniversalWeb {
  UniversalWeb._();

  /// Stub method for web.
  static void removeLoadingLayout() {}

  /// Stub method for web.
  static void reloadWindow() {}

  /// Returns the rendering engine for the platform. This is always 'Native'.
  static String get renderer => 'Native';

  /// Returns the platform where the application is running. This will be
  /// identical to the platform except for web.
  static Platform get platform => defaultTargetPlatform.toPlatform();

  static String get userAgent => 'unknown';

  /// Returns the operating system where the application is running. This
  /// will be identical to the platform except for web.
  static OperatingSystem get operatingSystem =>
      defaultTargetPlatform.toOperatingSystem();
}
