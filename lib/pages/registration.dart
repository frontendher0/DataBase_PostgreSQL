import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}


String _login = '';
TextEditingController _loginController = TextEditingController();
String _password = '';
TextEditingController _passwordController = TextEditingController();
String _repeatpassword = '';
TextEditingController _repeatpasswordController = TextEditingController();

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

  Widget _input(String hint, TextEditingController controller) {
      return Container(
          padding:
              const EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 15),
          child: TextField(
            controller: controller,
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
        child: _input("Введите ваш логин: ", _loginController),
      ),
     
      Padding(
        padding: const EdgeInsets.only(top: 5),
        child: _input("Введите ваш пароль: ", _passwordController),
      ),
     
      Padding(
        padding: const EdgeInsets.only(top: 5),
        child: _input("Повторите пароль: ", _repeatpasswordController),
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
      _login = _loginController.text;
      _loginController.clear();
      _password = _passwordController.text;
      _passwordController.clear();
      _repeatpassword = _repeatpasswordController.text;
      _repeatpasswordController.clear();
      //getData();
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














