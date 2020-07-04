import 'package:flutter/material.dart';
import 'package:flutter_app_provider_tutorial/CountTapModel.dart';
import 'package:flutter_app_provider_tutorial/Homepage.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:ChangeNotifierProvider(
          create: (context)=> CountTapModel(),
          child: Homepage()),
    );
  }
}
