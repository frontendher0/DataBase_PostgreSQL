import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  String choise = '';
  String client = 'client';
  String factory = 'factory';
  String employee = 'employee';

  @override
  Widget build(BuildContext context) {
   Widget logo() {
      return Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Container(
              child: const Align(
                  child: Text('Выберите объект,информацию о котором вы хотите узнать:',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )))));
    }

     Widget factorybutton(String text, void Function() pressed) {
      return Padding(
        padding: EdgeInsets.only(top:10),
        child: ElevatedButton(
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(
                const Color.fromARGB(255, 255, 255, 255)),
            surfaceTintColor:
                MaterialStateProperty.all(Color.fromARGB(255, 0, 0, 0)),
            backgroundColor:
                MaterialStateProperty.all(const Color.fromARGB(255, 0, 0, 0)),
          ),
          onPressed: () {
            pressed();
          },
          child: Text(
            text,
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
          )));
    }

     Widget employeebutton(String text, void Function() pressed) {
    return Padding(
        padding: EdgeInsets.only(top: 10),
        child: ElevatedButton(
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(
                const Color.fromARGB(255, 255, 255, 255)),
            surfaceTintColor:
                MaterialStateProperty.all(Color.fromARGB(255, 0, 0, 0)),
            backgroundColor:
                MaterialStateProperty.all(const Color.fromARGB(255, 0, 0, 0)),
          ),
          onPressed: () {
            pressed();
          },
          child: Text(
            text,
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
          )));
    }

     Widget clientbutton(String text, void Function() pressed) {
      return Padding(
        padding: EdgeInsets.only(top: 10),
        child: ElevatedButton(
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(
                const Color.fromARGB(255, 255, 255, 255)),
            surfaceTintColor:
                MaterialStateProperty.all(Color.fromARGB(255, 0, 0, 0)),
            backgroundColor:
                MaterialStateProperty.all(const Color.fromARGB(255, 0, 0, 0)),
          ),
          onPressed: () {
            pressed();
          },
          child: Text(
            text,
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
          )));
    }
    Widget factoryform(String label, void pressed()) {
      return Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: factorybutton(label, pressed)
      ));  
    }

     Widget employeeform(String label, void pressed()) {
      return Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: employeebutton(label, pressed)
      ));
    }

     Widget clientform(String label, void pressed()) {
      return Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: clientbutton(label, pressed)
      ));
    }

    void factorybuttonAction(){
      choise = factory;
      
    }

    void employeebuttonAction(){
      choise = employee;
    }

    void clientbuttonAction(){
      choise = client;
    }


      return Scaffold(
        body: Column(
      children: [
        logo(),
        factoryform('Поиск Объекта',factorybuttonAction),
        employeeform('Поиск сотрудника', employeebuttonAction),
        clientform('Поиск клиента', clientbuttonAction)

      ],
    ));


  }
}