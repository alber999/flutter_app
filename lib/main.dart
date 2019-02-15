import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/app/app.dart';

void main() {
  //SystemChrome.setEnabledSystemUIOverlays([]);
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(statusBarColor: const Color(0xFFFFFF)));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(App());
}
