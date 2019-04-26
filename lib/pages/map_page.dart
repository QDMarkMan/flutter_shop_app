/*
 * @Author: etongfu
 * @Email: 13583254085@163.com
 * @Version: 
 * @LastEditors: etongfu
 * @Description: 
 * @youWant: add you want info here
 * @Date: 2019-04-25 11:40:53
 * @LastEditTime: 2019-04-26 14:22:34
 */
import 'package:flutter/material.dart';
import 'package:amap_base/amap_base.dart';


class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final _amapLocation = AMapLocation();
  List<Location> _result = [];
  @override
  void initState() {
    super.initState();

    _amapLocation.init();
  }
  AMapController _controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('地图测试'),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: Column(
          children: <Widget>[
            Container(
              height: 300,
              child: AMapView(
                onAMapViewCreated: (controller) async {
                  _controller = controller;
                  await _controller.setMyLocationStyle(MyLocationStyle(
                    showMyLocation: true
                  ));
                },
                amapOptions: AMapOptions(
                  compassEnabled: false,
                  zoomControlsEnabled: true,
                  logoPosition: LOGO_POSITION_BOTTOM_LEFT,
                  camera: CameraPosition(
                    target: LatLng(41.851827, 112.801637),
                    zoom: 4,
                  ),
                ),
              ),
            ),
            Wrap(children: <Widget>[
              FlatButton(
                onPressed: () async{
                  final options = LocationClientOptions(
                    isOnceLocation: true,
                    locatingWithReGeocode: true,
                  );

                  if (await Permissions().requestPermission()) {
                    await _controller.setZoomLevel(13);
                    _amapLocation.getLocation(options).then(_result.add).then((_) => setState(() {}));
                  } else {
                    Scaffold.of(context).showSnackBar(SnackBar(content: Text('权限不足')));
                  }
                },
                child: Text('定位'),
              )
            ],)
          ],
        )
      );
  }
}