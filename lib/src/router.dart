class MinAppRouter {
  const MinAppRouter();
}

class MinRouter {
  final String url;
  final String name;
  final List<String> params;
  final String transition;
  final List<String> navigator;
  
  const MinRouter({this.url, this.name, this.params, this.transition, this.navigator});
}

class MinTransitionType {
  MinTransitionType._();

  static const String fade = 'MinFadeAnimation';  
  static const String slide = 'MinSlideAnimation';
}

class MinNavigatorType {
  MinNavigatorType._();

  static const String popUntil = 'popUntil';
  static const String pushNamed = 'pushNamed';
  static const String popAndPushNamed = 'popAndPushNamed';
  static const String pushReplacementNamed = 'pushReplacementNamed';
  static const String pushNamedAndRemoveUntil = 'pushNamedAndRemoveUntil';
}

class RouterInfo {
  final String import;
  final String constant;
  final String className;
  final List<String> params;
  final String url;
  final String name;
  final String transition;
  final List<String> navigator;

  RouterInfo({this.import, this.constant, this.className, this.params, this.url, this.name, this.transition, this.navigator});
}