import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:database/pages/phoneaccept.dart';
import 'package:http/http.dart' as http;

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}


Future navigateToPhoneAcceptPage(context) async {
    Navigator.push(
      context, MaterialPageRoute(builder: (context) => const PhoneAcceptPage()));
}
Future<void> Register(String login, String password,String phone_number,String acceptCode,String hashCode) async {
  String url = 'http://192.168.100.26:5000/User';
  Map requestBody = {
"hashCode": hashCode,
"code": int.parse(acceptCode),
"login": login,
"password": password,
"phone_number": phone_number
};
final jsonString = json.encode(requestBody);
final Map<String, String> headers = {
    'Accept': '*/*',
    'Content-Type': 'application/json',
  };

  final response = await http.post(Uri.parse(url),body:jsonString, headers: headers);  
  if (response.statusCode == 200) {
    print(response.body);
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
}

String login = '';
TextEditingController _loginController = TextEditingController();
String password = '';
TextEditingController _passwordController = TextEditingController();
String _repeatpassword = '';
TextEditingController _repeatpasswordController = TextEditingController();
String phone_number = '';
TextEditingController _phone_numberController = TextEditingController();

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  Widget build(BuildContext context) {
    Widget _logo() {
      return const Padding(
          padding: EdgeInsets.only(top: 70,bottom: 20),
          child: Align(
              child: Text('Регистрация',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ))));
    }

  Widget _input(String hint, TextEditingController controller,bool obscure) {
      return Container(
          padding:
              const EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 15),
          child: TextField(
            controller: controller,
            obscureText: obscure,
            style: const TextStyle(fontSize: 20, color: Colors.black),
            decoration: InputDecoration(
              hintStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black38),
              hintText: hint,
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 3)),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black54, width: 1)),
            ),
          ));
    }

     Widget _button(String text, void Function() pressed) {
      return TextButton(
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(
                const Color.fromARGB(255, 255, 255, 255)),
            surfaceTintColor:
                MaterialStateProperty.all(const Color.fromARGB(255, 0, 0, 0)),
            backgroundColor:
                MaterialStateProperty.all(const Color.fromARGB(255, 0, 0, 0)),
          ),
          onPressed: () {
            pressed();
          },
          child: Text(
            text,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
          ));
    }

    Widget _form(String label, void pressed()) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(top: 5),
        child: _input("Введите ваш логин: ", _loginController,false),
      ),

      Padding(
        padding: const EdgeInsets.only(top: 5),
        child: _input("Введите ваш номер телефона: ", _phone_numberController,false),
      ),
     
      Padding(
        padding: const EdgeInsets.only(top: 5),
        child: _input("Введите ваш пароль: ", _passwordController,true),
      ),
     
      Padding(
        padding: const EdgeInsets.only(top: 5),
        child: _input("Повторите пароль: ", _repeatpasswordController,true),
      ),


     
      const SizedBox(
        height: 20
      ),
      Padding(
          padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
          child: SizedBox(
            height: 70,
            width: MediaQuery.of(context).size.width,
            child: _button(label, pressed),
          ))
        ],
      );
    }

  void _buttonAction() {
      login = _loginController.text;
      _loginController.clear();
      phone_number = _phone_numberController.text;
      _phone_numberController.clear();
      password = _passwordController.text;
      _passwordController.clear();
      _repeatpassword = _repeatpasswordController.text;
      _repeatpasswordController.clear();
      getData();
      navigateToPhoneAcceptPage(context);
      
      
    }
    return Scaffold(
       resizeToAvoidBottomInset: false,
        body: Column(
      children: [
        _logo(),
        _form('Зарегистрироваться', _buttonAction),
      ],
    ),
    );
  }
}














