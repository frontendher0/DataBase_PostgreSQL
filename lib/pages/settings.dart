import 'package:flutter/material.dart';
import 'authorization.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});


  
Future navigateToAuthorizationPage(context) async {
  Navigator.push(context,
      MaterialPageRoute(builder: (context) => const AuthorizationPage()));
}


  @override
  Widget build(BuildContext context) {
    Widget _logo() {
      return const Padding(
          padding: EdgeInsets.only(top: 70, bottom: 20),
          child: Align(
              child: Text('Настройки',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ))));
    }

    return Scaffold(
     body: Column(
      children: <Widget>[
        _logo(),
        const SizedBox(height: 20),
        ElevatedButton(onPressed:(){
          navigateToAuthorizationPage(context);
        } , child:const Text('Выйти из аккаунта'),
            )
      ],
     ),
    );
  }
}