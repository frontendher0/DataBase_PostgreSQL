import 'package:flutter/material.dart';
import 'package:postgres/postgres.dart';

class Objectview extends StatefulWidget {
  const Objectview({ Key? key }) : super(key: key);

  @override
  _ObjectviewState createState() => _ObjectviewState();
}

TextEditingController _idController = TextEditingController();
String _id = '';

class _ObjectviewState extends State<Objectview>{
    @override
  Widget build(BuildContext context) {
    Widget logo(){
    return Padding(
    padding: const EdgeInsets.only(top: 100),
    child: Container(
      child: const Align(
        child: Text('Информация об объекте:',
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        )
        )
      ) 
      )
    );
  }

  Widget input(String hint,TextEditingController controller){

    return Container(
      padding: const EdgeInsets.only(
          top: 25,
          left: 25,
          right: 25,
          bottom: 25
        ),
      child: TextField(
        controller: controller,
        style: const TextStyle(
          fontSize: 20, color: Colors.black
        ),
        decoration: InputDecoration(
          hintStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black38
          ),
          hintText: hint,
          focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 3)),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black54, width: 1)),
          
        ),
      )
    );
}

Widget button (String text, void Function() pressed) {
  return ElevatedButton(
    style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(
                const Color.fromARGB(255, 255, 255, 255)),
            surfaceTintColor: MaterialStateProperty.all(
                Color.fromARGB(255, 0, 0, 0)),
            backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 0, 0, 0)),
          ),
          onPressed: () {
            pressed();
          },
          child: Text(
            text,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 20),
          )
        );
}

Widget form(String label, void pressed()) {
  return Container(
          child: Column(
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
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: button(label, pressed),
              )
            ) 
        ], 
      ));
}
void buttonAction() {
      _id = _idController.text;
      _idController.clear();
    }
          

  return Scaffold(
    body: Column(children: [
      logo(),
      form('Поиск', buttonAction),
      ],
      )
  );
 }
}