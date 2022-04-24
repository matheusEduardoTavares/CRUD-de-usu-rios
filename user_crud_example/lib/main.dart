import 'package:flutter/material.dart';
import 'package:user_crud_example/app/core/theme/default_theme_data.dart';
import 'package:user_crud_example/app/core/utils/definition_pages.dart';
import 'package:user_crud_example/app/core/utils/routes_name.dart';

void main() {
  runApp(
    MaterialApp(
      routes: DefinitionPages.pages,
      initialRoute: RoutesName.splashPage,
      theme: DefaultThemeData.defaultThemeData,
    ),
  );
}