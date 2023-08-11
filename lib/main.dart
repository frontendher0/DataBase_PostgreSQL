import 'package:flutter/material.dart';
import 'package:database/pages/objectview.dart';
import 'package:database/pages/info.dart';
<<<<<<< HEAD
import 'package:postgres/postgres.dart';
import 'package:database/pages/home.dart';
=======

>>>>>>> f392d10d14b05deda32dcf98b2b228236bf51594
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
<<<<<<< HEAD
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 255, 255, 255)),
        useMaterial3: true,
      ),
      home: Home() 
    );
=======
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 255, 255, 255)),
          useMaterial3: true,
        ),
        home: Objectview());
>>>>>>> f392d10d14b05deda32dcf98b2b228236bf51594
  }
}
