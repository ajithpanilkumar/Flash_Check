import 'package:fast_check/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
void main(){
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: const Color.fromARGB(0, 193, 30, 190)));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FLASH_CHECK',
      home: Home(),
    );
  }
  }

