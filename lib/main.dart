import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_tutorial/features/google/ui/pages/google_map_page.dart';
import 'package:maps_tutorial/features/home/ui/pages/home_page.dart';
import 'package:maps_tutorial/features/yandex/ui/pages/yandex_map_page.dart';

void main() {
  if (Platform.isAndroid) {
    AndroidGoogleMapsFlutter.useAndroidViewSurface = true;
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        HomePage.routeName: (context) => const HomePage(),
        GoogleMapPage.routeName: (context) => const GoogleMapPage(),
        YandexMapPage.routeName: (context) => const YandexMapPage(),
      },
    );
  }
}
