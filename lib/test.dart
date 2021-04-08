import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

void main() => runApp(MaterialApp(
    title: "map application",
    home: Scaffold(
      appBar: new AppBar(
        title: new Text("map demo"),
      ),
      body: Stack(
        children: <Widget>[
          new FlutterMap(
              options: new MapOptions(
                minZoom: 10.0,
                center: new LatLng(40.71, -74.00),
                onLongPress: (point) => print("la postion est " +
                    point.latitude.toString() +
                    " et la latitude est: " +
                    point.longitude.toString()),
              ), //first view

              layers: [
                new TileLayerOptions(
                    urlTemplate:
                        'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                    subdomains: ['a', 'b', 'c']),
                new MarkerLayerOptions(markers: [
                  new Marker(
                      width: 45.0,
                      height: 45.0,
                      point: new LatLng(40.71, -74.00),
                      builder: (context) => new Container(
                            child: IconButton(
                                icon: Icon(Icons.flag),
                                onPressed: () {
                                  print('Marker tapped!');
                                }),
                          ))
                ])
              ])
        ],
      ),
    )));
