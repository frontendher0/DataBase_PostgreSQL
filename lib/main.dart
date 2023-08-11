import 'package:flutter/material.dart';
import 'package:database/pages/objectview.dart';
import 'package:database/pages/factoryinfo.dart';
import 'package:database/pages/home.dart';
import 'package:database/pages/employee.dart';
import 'package:database/pages/clientinfo.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 255, 255, 255)),
          useMaterial3: true,
        ),
        home: Home()
    );
  }
}
