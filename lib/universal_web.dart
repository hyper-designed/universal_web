library;

export 'src/universal_web_io.dart'
    if (dart.library.js_interop) 'src/universal_web_web.dart';
export 'src/utils.dart';