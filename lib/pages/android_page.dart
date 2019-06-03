import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


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
            // 传递给原生组件的参数
            creationParams: {
              "myContent": "通过参数传入的文本内容",
            },
            //
            creationParamsCodec: const StandardMessageCodec(),
          ),
        ),
      ),
    );
  }
}