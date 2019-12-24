import 'router.dart';

String handleFun(name, url, navigator) {
  if (navigator == null) {
    return hanlePushNamed('push$name', url);
  } else {
    if (navigator.isEmpty) {
      return hanlePushNamed('push$name', url);
    } else {
      final StringBuffer buffer = StringBuffer();
      navigator.forEach((funcName) {
        String name1 = funcName.replaceFirst('Named', name);

        switch (funcName) {
          case MinNavigatorType.popUntil:
            buffer.write(handlePopUntil(name, url));
            break;
          case MinNavigatorType.pushNamed:
            buffer.write(hanlePushNamed(name1, url));
            break;
          case MinNavigatorType.popAndPushNamed:
            buffer.write(handlePopAndPushNamed(name1, url));
            break;
          case MinNavigatorType.pushReplacementNamed:
            buffer.write(handlePushReplacementNamed(name1, url));
            break;
          case MinNavigatorType.pushNamedAndRemoveUntil:
            buffer.write(handlePushNamedAndRemoveUntil(name1, url));
            break;
          default:
        }
      });
      return buffer.toString();
    }
  }
}

String hanlePushNamed(name, url) {
  return '''
    static Future<T> $name<T extends Object>({Object arguments}) {
      return MinNavigatorObserver.instance.navigator.pushNamed<T>(${url.toUpperCase()}, arguments: arguments);
    }
  ''';
}

String handlePopAndPushNamed(name, url) {
  return '''
    static Future<T> $name<T extends Object>({Object arguments}) {
      return MinNavigatorObserver.instance.navigator.popAndPushNamed(${url.toUpperCase()}, arguments: arguments);
    }
  ''';
}

String handlePushReplacementNamed(name, url) {
  return '''
    static Future<T> $name<T extends Object>({Object arguments}) {
      return MinNavigatorObserver.instance.navigator.pushReplacementNamed(${url.toUpperCase()}, arguments: arguments);
    }
  ''';
}

String handlePopUntil(name, url) {
  return '''
    static void popUntil$name<T extends Object>() {
      MinNavigatorObserver.instance.navigator.popUntil(ModalRoute.withName(${url.toUpperCase()}));
    }
  ''';
}

String handlePushNamedAndRemoveUntil(name, url) {
  return '''
    static Future<T> $name<T extends Object>({Object arguments}) {
      return MinNavigatorObserver.instance.navigator.pushNamedAndRemoveUntil(${url.toUpperCase()}, (Route<dynamic> route) => false, arguments: arguments);
    }
  ''';
}

String handleArgs(params) {
  if (params.isEmpty) {
    return '';
  } else {
    final StringBuffer buffer = StringBuffer();
    params.forEach((name) {
      buffer.write("$name : arguments['$name'],");
    });
    return buffer.toString();
  }
}

String handleMap(url, widget, params, transition) {
  if (params == null) {
    return'''
    '$url': (RouteSettings settings) => $transition($widget()),''';
  } else {
    String param = handleArgs(params);
    return'''
    '$url': (RouteSettings settings) {
      final Map<String, dynamic> arguments = settings.arguments as Map<String, dynamic>;
      return $transition($widget($param));
    },
    ''';
  }
}