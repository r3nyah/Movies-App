import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'Src/Screen/Page/Main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color(0xFF36333E),
      ),
    );
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF36333E),
        textTheme: const TextTheme(
          bodyText1: TextStyle(
            color: Colors.white,
            fontFamily: 'Poppins',
          ),
          bodyText2: TextStyle(
            color: Colors.white,
            fontFamily: 'Poppins',
          )
        ),
      ),
      home: Main(),
    );
  }
}
