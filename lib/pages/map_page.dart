/*
 * @Author: etongfu
 * @Email: 13583254085@163.com
 * @Version: 
 * @LastEditors: etongfu
 * @Description: 
 * @youWant: add you want info here
 * @Date: 2019-04-25 11:40:53
 * @LastEditTime: 2019-04-27 10:23:27
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
                  // 展示定位位置
                  /* await _controller.setMyLocationStyle(MyLocationStyle(
                    radiusFillColor: Colors.transparent,
                    locationDotBgColor: Colors.transparent,
                    strokeColor: Theme.of(context).primaryColor
                  )); */
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
                    _amapLocation.getLocation(options).then((Location location) async{
                      await _controller.addMarker(MarkerOptions(
                        position: LatLng(location.latitude, location.longitude),
                        icon: "images/default_marker.png"
                      ));
                    });
                  } else {
                    Scaffold.of(context).showSnackBar(SnackBar(content: Text('权限不足')));
                  }
                },
                child: Text('点击定位'),
              )
            ],)
          ],
        )
      );
  }
}