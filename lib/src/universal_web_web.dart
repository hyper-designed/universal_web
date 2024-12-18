import 'dart:js_interop';

import 'package:flutter/foundation.dart';
import 'package:web/web.dart';

import 'utils.dart';

@JS('window.navigator.userAgent')
external String get ua;

@JS('window.flutterCanvasKit')
external JSObject? get canvasKit;

/// Represents the web platform.
class UniversalWeb {
  UniversalWeb._();

  /// Removes the loading layout from the index.html file.
  static void removeLoadingLayout() {
    // Remove HTML loading layout.
    final HTMLCollection loadingLayout =
        document.getElementsByClassName('loading-layout');
    loadingLayout.item(0)?.remove();
  }

  /// Reloads the browser tab/window.
  static void reloadWindow() => window.location.reload();

  /// Returns the rendering engine for the web platform.
  static WebRenderer get renderer =>
      canvasKit != null ? WebRenderer.canvasKit : WebRenderer.html;

  /// Returns the platform where the application is running.
  static Platform get platform {
    if (kIsWeb) return kIsWasm ? Platform.webWasm : renderer.toPlatform();
    return defaultTargetPlatform.toPlatform();
  }

  static String get userAgent => ua;

  /// Returns the operating system where the application is running.
  static OperatingSystem get operatingSystem =>
      defaultTargetPlatform.toOperatingSystem();
}
