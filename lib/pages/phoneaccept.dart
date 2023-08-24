import 'package:flutter/material.dart';
import 'package:database/mainpage/mainpage.dart';
import 'package:database/pages/registration.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

getData() async {
  String url = 'http://192.168.100.26:5000/Confirmation';
    final response = await http.get(Uri.parse(url));  
    var data = json.decode(response.body);
    _codes = Codes.fromJson(data);
  print(_codes!.acceptCode);
}

Codes? _codes;

class Codes{
  String acceptCode;
  String hashcode;
  Codes({required this.acceptCode,required this.hashcode});
  factory Codes.fromJson(Map<String, dynamic> json) {
    return Codes(
      acceptCode: json['code'],
      hashcode: json['hashed code']
    );
}
}





class PhoneAcceptPage extends StatefulWidget {
  const PhoneAcceptPage({super.key});
  @override
  State<PhoneAcceptPage> createState() => _PhoneAcceptPageState();
}


String _acceptCode = '';
TextEditingController _acceptCodeController = TextEditingController();

Future navigateToMainPage(context) async {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => const MainPage()));
}

class _PhoneAcceptPageState extends State<PhoneAcceptPage> {
  @override
    Widget build(BuildContext context) {
   
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
      return  Center(
        heightFactor: 1.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            const Padding(
          padding: EdgeInsets.only(top: 70,bottom: 20),
          child: Align(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Подтверждение номера телефона',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )),
              ))),


        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: _input("Введите код подтверждения ", _acceptCodeController,false)
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
          ]
        ),
      );
    }

    void _buttonAction(){
      _acceptCode = _acceptCodeController.text;
      _acceptCodeController.clear();
      Register(login,password,phone_number,_acceptCode,_codes!.hashcode);
      navigateToMainPage(context);
    }

    return  Scaffold(
      resizeToAvoidBottomInset: false,
        body: Column(
      children: [
        _form('Отправить код', _buttonAction),
      ],
    ),
    );

      
    
  }}
