import 'package:source_gen/source_gen.dart';
import 'package:build/build.dart';
import 'generator.dart';

Builder minRouterBuilder(BuilderOptions options) =>
  LibraryBuilder(MinRouterGenerator(), generatedExtension: '.routes.dart');
Builder minAppRouterBuilder(BuilderOptions options) =>
  LibraryBuilder(MinAppRouterGenerator(), generatedExtension: '.router.dart');
