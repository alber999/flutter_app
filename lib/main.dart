import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/resources/bloc_provider.dart';
import 'package:flutter_app/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      initialRoute: Routes.initialRoute,
      routes: Routes.routes,
    ));
  }
}
