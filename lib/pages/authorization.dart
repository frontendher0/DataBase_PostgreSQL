import 'package:database/pages/registration.dart';
import 'package:flutter/material.dart';
import 'package:database/mainpage/mainpage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



Future<void> postData() async {
  final url = Uri.parse('http://10.0.2.2:5000/User/');

  final Map<String, String> data = {
    'email': _loginController.text,
    'password': _passwordController.text,
  };

  final response = await http.post(
    url,
    headers: {'Authorization': 'authorization/json'},
    body: json.encode(data),
  );

  if (response.statusCode == 201) {

    print('Data posted successfully');


  } else {

    print('Request failed with status: ${response.statusCode}');
  }
}




 Future navigateToSubPage(context) async {
    Navigator.push(
      context, MaterialPageRoute(builder: (context) => const RegistrationPage()));
 }
 Future navigateToHomePage(context) async {
    Navigator.push(
      context, MaterialPageRoute(builder: (context) => const MainPage()));
 }

class AuthorizationPage extends StatefulWidget {
  const AuthorizationPage({super.key});

  @override
  State<AuthorizationPage> createState() => _AuthorizationPageState();
}


TextEditingController _loginController = TextEditingController();
TextEditingController _passwordController = TextEditingController();

String _login = '';
String _password = '';
bool showLogin = true;

class _AuthorizationPageState extends State<AuthorizationPage> {
  @override
  Widget build(BuildContext context) {
    Widget _logo() {
      return const Padding(
          padding: EdgeInsets.only(top: 100,bottom: 40),
          child: Align(
              child: Text("Авторизация",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ))));
    }
    
  Future<void> getToken(String login, String password) async {
  String url = 'http://192.168.100.26:5000/Auth/login?login=$login&password=$password';
  final response = await http.post(Uri.parse(url));

  if (response.statusCode == 200) {
    print(response.body);
    navigateToHomePage(context);

  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
}

    Widget _input(Icon icon, String hint, TextEditingController controller,
        bool obscure) {
      return Container(
        padding: const EdgeInsets.only(
          bottom: 10,
          left: 20,
          right: 20,
        ),
        child: TextField(
          controller: controller,
          obscureText: obscure,
          style: const TextStyle(fontSize: 20, color: Color.fromARGB(255, 0, 0, 0)),
          decoration: InputDecoration(
              hintStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black26),
              hintText: hint,
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0), width: 3)),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0), width: 1)),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: IconTheme(
                    data: const IconThemeData(color: Color.fromARGB(255, 0, 0, 0)),
                    child: icon),
              )),
        ),
      );
    }

    Widget _button(String text, void Function() pressed) {
      return ElevatedButton(
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(
                Color.fromARGB(255, 0, 0, 0)),
            surfaceTintColor: MaterialStateProperty.all(
                Color.fromARGB(255, 0, 0, 0)),
            backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 0, 0, 0)),
          ),
          onPressed: () {
            pressed();
          },
          child: Text(
            text,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 20),
          ));
    }

    Widget _form(String label, void pressed()) {
      return Container(
          child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 25, top: 13),
            child: _input(
                const Icon(Icons.person), "Логин", _loginController, false),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: _input(
                const Icon(Icons.lock), "Пароль", _passwordController, true),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: _button(label, pressed),
              ))
        ],
      ));
    }


    


    Widget _unregistred(String label, void pressed()){
      return Container(
            child: Column(
            children: <Widget>[
            const Padding(padding:EdgeInsets.only(top:200),
            child: Text('Нет аккаунта?',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
           )
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: _button(label, pressed),
              ))
         ]
        ),
      );
    }
    
    

      void _buttonAction() {
      _login = _loginController.text;
      _password = _passwordController.text;
      _loginController.clear();
      _passwordController.clear();
      getToken(_login, _password);
    }


    void _newaccountbuttonAction(){
      navigateToSubPage(context);
   
}

    

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            _logo(),
            _form('Войти', _buttonAction),
            _unregistred('Создать аккаунт',_newaccountbuttonAction)
          ],
        ));
  }
}
