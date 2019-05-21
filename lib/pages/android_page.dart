import 'package:flutter/material.dart';


class AndroidPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Android View')
      ),
      body: Container(
        color: Color(0xff0000ff),
        child: SizedBox(
          // width: 200,
          height: 200,
          child: AndroidView(
            viewType: 'plugins.views/myView',
          ),
        ),
      ),
    );
  }
}