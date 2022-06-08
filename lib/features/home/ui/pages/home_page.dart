import 'package:flutter/material.dart';
import 'package:maps_tutorial/features/google/ui/pages/google_map_page.dart';
import 'package:maps_tutorial/features/yandex/ui/pages/yandex_map_page.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/';

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(GoogleMapPage.routeName),
              child: const Text('Google Map'),
            ),
            ElevatedButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(YandexMapPage.routeName),
              child: const Text('Yandex Map'),
            ),
          ],
        ),
      ),
    );
  }
}
