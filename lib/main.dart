import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_api/controller/appState/app_state.dart';
import 'package:provider_api/view/home_screen/home_screen.dart';

void main() {
  runApp( ChangeNotifierProvider<AppState>(create: (BuildContext context)=>AppState(),child: MaterialApp(

    home: MyApp(),
  ),));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

