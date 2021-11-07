import 'package:rocket_apps_flutter/binding/bindable.dart';
import 'package:rocket_apps_flutter/movement/mover.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ViewModel extends Bindable {
  BuildContext context;
  late Mover mover;

  ViewModel(this.context) {
    mover = Mover(context);
  }

  Future? loaded() {}

  Future? didBack() {}

  Future? didLeft() {}

  Future goTo(String route, {bool animate = true}) {
    return mover.go(route, animate: animate).then((value) => didLeft());
  }

  Future goToWithArguments(String route, Object arguments,
      {bool animate = true}) {
    return mover.goWithArguments(route, arguments, animate: animate);
  }

  Future popAndGoToWithArguments(String route, Object arguments,
      {bool animate = true}) {
    return mover.popAndGoWithArguments(route, arguments, animate: animate);
  }

  void goBack() {
    mover.goBack();
  }

  Future goToSilently(Widget widget) {
    return mover.goSilently(widget).then((value) => didLeft());
  }

  Object? getArgs() {
    return ModalRoute.of(this.context)!.settings.arguments;
  }
}