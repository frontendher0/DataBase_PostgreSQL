import 'package:database/pages/authorization.dart';
import 'package:database/pages/registration.dart';
import 'package:flutter/material.dart';
import 'package:database/pages/objectview.dart';
import 'package:database/pages/factoryinfo.dart';
import 'package:database/pages/home.dart';
import 'package:database/pages/employee.dart';
import 'package:database/pages/clientinfo.dart';
import 'package:database/pages/serviceadding.dart';
import 'package:database/pages/companyregister.dart';
import 'package:database/mainpage/mainpage.dart';
import 'package:database/theme/app_colors.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'DataBase',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(

        appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black,
        titleTextStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.white,fontSize: 20)),


        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle : TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle : TextStyle(fontWeight: FontWeight.bold),
        type : BottomNavigationBarType.fixed,
            backgroundColor: AppColors.mainDarkPurple ),
          useMaterial3: true,
        ),
        home: MainPage()
    );
  }
}
