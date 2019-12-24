// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// MinAppRouterGenerator
// **************************************************************************

// **************************************************************************
// 注意：生成的代码，请勿手动修改
// 如果存在新文件需要更新，建议先执行清除命令：
// flutter packages pub run build_runner clean
// 然后执行下列命令重新生成相应文件：
// flutter packages pub run build_runner build --delete-conflicting-outputs
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:min_router/min_router.dart';
import 'package:example/home.dart';

class MinAppRoutes {
  MinAppRoutes._();
  static const String HOME = 'home';
  static final Map<String, RouteFactory> _appRouterMap = {
    'home': (RouteSettings settings) {
      final Map<String, dynamic> arguments =
          settings.arguments as Map<String, dynamic>;
      return MinSlideAnimation(Home(
        title: arguments['title'],
      ));
    },
  };

  static RouteFactory onGenerateRoute =
      (settings) => _appRouterMap[settings.name](settings);

  static void pop<T extends Object>([T result]) {
    MinNavigatorObserver.instance.navigator.pop(result);
  }

  static void popUntilHome<T extends Object>() {
    MinNavigatorObserver.instance.navigator.popUntil(ModalRoute.withName(HOME));
  }

  static Future<T> pushHome<T extends Object>({Object arguments}) {
    return MinNavigatorObserver.instance.navigator
        .pushNamed<T>(HOME, arguments: arguments);
  }

  static Future<T> popAndPushHome<T extends Object>({Object arguments}) {
    return MinNavigatorObserver.instance.navigator
        .popAndPushNamed(HOME, arguments: arguments);
  }

  static Future<T> pushReplacementHome<T extends Object>({Object arguments}) {
    return MinNavigatorObserver.instance.navigator
        .pushReplacementNamed(HOME, arguments: arguments);
  }

  static Future<T> pushHomeAndRemoveUntil<T extends Object>(
      {Object arguments}) {
    return MinNavigatorObserver.instance.navigator.pushNamedAndRemoveUntil(
        HOME, (Route<dynamic> route) => false,
        arguments: arguments);
  }
}
