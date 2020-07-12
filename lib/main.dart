import 'package:flutter/material.dart';

import 'strings.dart';
import 'ghflutter.dart';

// Укороченная точка входа
void main()
{
  runApp(GHFlutterApp());
}

// Виджет-приложение
class GHFlutterApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp
      (
        title: Strings.appTitle,
        // Тема
        theme: ThemeData(primaryColor: Colors.lightBlueAccent),
        // Домашний экран
        home: GHFlutter(),
      );
  }
}



