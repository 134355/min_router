import 'package:source_gen/source_gen.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'router.dart';
import 'template.dart';
import 'explanation.dart';

class MinRouterGenerator extends GeneratorForAnnotation<MinRouter> {
  static List<RouterInfo> routes = List();

  @override
  generateForAnnotatedElement(Element element, ConstantReader annotation, BuildStep buildStep) {
    String url = annotation.peek('url')?.stringValue;
    String name = annotation.peek('name')?.stringValue;
    String transition = annotation.peek('transition')?.stringValue;
    final List<String> params = annotation.peek('params')?.listValue?.map((name) {
      return name.toStringValue();
    })?.toList();
    List<String> navigator = annotation.peek('navigator')?.listValue?.map((name) {
      return name.toStringValue();
    })?.toList();

    final String className = element.displayName;
    final String path = buildStep.inputId.path;
    final String package = buildStep.inputId.package;
    final String filePath = '${path.replaceFirst('lib/', '')}';
    final String routerPath = filePath.replaceFirst('.dart', '');

    if (url == null) {
      url = routerPath;
    }

    if (name == null) {
      name = className.toUpperCase();
    }

    if (transition == null) {
      transition = 'MinSlideAnimation';
    }

    final import = 'import \'package:$package/$filePath\';';
    final constant = 'static const String ${name.toUpperCase()} = \'$url\';';

    routes.add(RouterInfo(import: import, constant: constant, className: className, params: params, url: url, name: name, transition: transition, navigator: navigator));

    return null;
  }
}

class MinAppRouterGenerator extends GeneratorForAnnotation<MinAppRouter> {

  final String explanation = explanationContent;

  List<RouterInfo> getRouterInfoList() {
    return MinRouterGenerator.routes;
  }

  @override
  generateForAnnotatedElement(Element element, ConstantReader annotation, BuildStep buildStep) {
    final className = element.displayName;
    final List<RouterInfo> routerInfoList = getRouterInfoList();

    final Set<String> importContent = Set(); 
    final Set<String> constContent = Set();
    final Set<String> mapContent = Set();
    final Set<String> funcContent = Set();

    routerInfoList.forEach((RouterInfo routerInfo) {
      importContent.add(routerInfo.import);
      constContent.add(routerInfo.constant);
      mapContent.add(handleMap(routerInfo.url, routerInfo.className, routerInfo.params, routerInfo.transition));
      funcContent.add(handleFun(routerInfo.className, routerInfo.name, routerInfo.navigator));
    });

    return '''
      $explanation
      import 'package:flutter/material.dart';
      import 'package:min_router/min_router.dart';
      ${importContent.join('\n')}
      class $className {
        $className._();
        ${constContent.join('\n')}
        static final Map<String, RouteFactory> _appRouterMap = {
          ${mapContent.join('\n')}
        };

        static RouteFactory onGenerateRoute = (settings) => _appRouterMap[settings.name](settings);

        static void pop<T extends Object>([ T result ]) {
          MinNavigatorObserver.instance.navigator.pop(result);
        }

        ${funcContent.join('\n')}
      }''';
  }
}
