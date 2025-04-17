import 'package:flutter/material.dart';
import 'package:my_flutter_app/Pages/choose_location.dart';
import 'package:my_flutter_app/Pages/home.dart';
import 'package:my_flutter_app/Pages/loading.dart';

void main() => runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => ChooseLocation(),
    },
  ));


