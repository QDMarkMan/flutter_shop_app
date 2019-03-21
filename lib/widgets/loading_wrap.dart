/* import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';


class LoadingWrap extends StatelessWidget {
  // 子组件
  @required
  final Widget child;
  @required
  bool loading =false;
  //自定义样式
  Offset offset = Offset(0, 0);
  double opactiy = 0.8;

  LoadingWrap({Key key, this.child, this.loading, this.offset, this.opactiy}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      progressIndicator:const CircularProgressIndicator(),
      child: child,
      color: Theme.of(context).primaryColor,
      offset: offset,
      opacity: 0.1,
      inAsyncCall: loading,
    );
  }
} */