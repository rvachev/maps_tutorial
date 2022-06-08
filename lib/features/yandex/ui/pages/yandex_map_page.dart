import 'dart:async';

import 'package:flutter/material.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class YandexMapPage extends StatefulWidget {
  static const routeName = 'yandex-map';

  const YandexMapPage({Key? key}) : super(key: key);

  @override
  State<YandexMapPage> createState() => _YandexMapPageState();
}

class _YandexMapPageState extends State<YandexMapPage> {
  final _initialCoords = const Point(latitude: 54.946571, longitude: 73.377869);
  final _animatedCoords =
      const Point(latitude: 55.008806, longitude: 73.351148);
  final _controller = Completer<YandexMapController>();

  List<MapObject> mapObjects = [];

  @override
  void initState() {
    mapObjects.addAll([
      PlacemarkMapObject(
        mapId: const MapObjectId('1'),
        point: _initialCoords,
        opacity: 1.0,
        isDraggable: true,
        icon: PlacemarkIcon.single(
          PlacemarkIconStyle(
            anchor: const Offset(0.5, 1),
            image: BitmapDescriptor.fromAssetImage('assets/map_pin.png'),
          ),
        ),
      ),
      PlacemarkMapObject(
        mapId: const MapObjectId('2'),
        point: _animatedCoords,
        opacity: 1.0,
        isDraggable: true,
        icon: PlacemarkIcon.single(
          PlacemarkIconStyle(
            anchor: const Offset(0.5, 1),
            image: BitmapDescriptor.fromAssetImage('assets/map_pin.png'),
          ),
        ),
      )
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Yandex Map')),
      body: YandexMap(
        mapObjects: mapObjects,
        onMapCreated: (controller) {
          _controller.complete(controller);
          moveCamera(_initialCoords);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => moveCamera(_animatedCoords),
        child: const Icon(Icons.location_disabled),
      ),
    );
  }

  void moveCamera(Point position) async {
    final controller = await _controller.future;
    controller.moveCamera(
      CameraUpdate.newCameraPosition(CameraPosition(target: position)),
      animation:
          const MapAnimation(type: MapAnimationType.linear, duration: 0.5),
    );
  }
}
