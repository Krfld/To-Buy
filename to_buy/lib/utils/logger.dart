import 'dart:developer' show log;

class Log {
  static const String _tag = '+';
  static int _debugId = 0;

  static dynamic print(var msg, {String prefix = 'DEBUG', bool isError = false}) {
    if (isError) prefix = '{ERROR} ' + prefix;
    //debugPrint('$_tag[${prefix.toUpperCase()} (${_debugId++})] $msg');
    log('$msg', name: '$_tag ${prefix.toUpperCase()} (${_debugId++})');
    return msg;
  }
}
