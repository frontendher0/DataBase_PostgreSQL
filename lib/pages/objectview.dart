import 'dart:convert';
import 'package:database/pages/employee.dart';
import 'package:database/pages/factoryinfo.dart';
import 'package:flutter/material.dart';
import 'package:database/pages/home.dart';
import 'package:database/pages/clientinfo.dart';
import 'package:http/http.dart' as http;

class Objectview extends StatefulWidget {
  const Objectview({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ObjectviewState createState() => _ObjectviewState();
}

Future navigateToSubPage(context) async {
  switch(choise)
  {
    case 'Factories':  Navigator.push(
      context, MaterialPageRoute(builder: (context) => const FactoryInfo()));
    case 'Client':  Navigator.push(
      context, MaterialPageRoute(builder: (context) => const ClientInfo()));
    case 'Employee':  Navigator.push(
      context, MaterialPageRoute(builder: (context) => const EmployeeInfo()));
  }
}
Future navigateToPrevPage(context) async {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => const Home()));
}


TextEditingController _idController = TextEditingController();
String _id = '';

class _ObjectviewState extends State<Objectview> {
  @override
  Widget build(BuildContext context) {
    Widget logo() {
      return const Padding(
          padding: EdgeInsets.only(top: 100),
          child: Align(
              child: Text('Информация об объекте:',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ))));
    }

    Widget input(String hint, TextEditingController controller) {
      return Container(
          padding:
              const EdgeInsets.only(top: 25, left: 25, right: 25, bottom: 25),
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

    Widget button(String text, void Function() pressed) {
      return ElevatedButton(
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

    Widget form(String label, void pressed()) {
      return Column(
        children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(bottom: 25, top: 25),
        child: input("Введите ID: ", _idController),
      ),
      const SizedBox(
        height: 15,
      ),
      Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: SizedBox(
            height: 50,
            width: MediaQuery.of(context).size.width,
            child: button(label, pressed),
          ))
        ],
      );
    }

    Future<void> getData(String id) async {
      String url = 'http://10.0.2.2:5000/$choise?id=$id';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        String jsonString = response.body;
        final jsonResponse = json.decode(jsonString);
        object = Factory.fromJson(jsonResponse);
        navigateToSubPage(context);
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    }

    void buttonAction() {
      _id = _idController.text;
      _idController.clear();
      getData(_id);
    }

    return Scaffold(
        body: Column(
      children: [
        logo(),
        form('Поиск', buttonAction),
      ],
    ),
    floatingActionButton: FloatingActionButton(
        onPressed:(){
          navigateToPrevPage(context);
        },
        tooltip: 'Вернуться назад',
        backgroundColor: Colors.black,
        child: const Icon(Icons.backspace,color: Colors.white,),
       
    
    ));
  }
}