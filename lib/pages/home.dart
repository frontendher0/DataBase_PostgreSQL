import 'package:database/pages/objectview.dart';
import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}
String choise = '';


class _HomeState extends State<Home> {
  
Future navigateToSubPage(context) async {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => const Objectview()));
}

  
  String client = 'Client';
  String factory = 'Factories';
  String employee = 'Employee';

  @override
  Widget build(BuildContext context) {
   Widget logo() {
      return  const Padding(
          padding: EdgeInsets.only(top: 100),
              child: Align(
                  child: Text('Выберите объект,информацию о котором Вы хотите узнать:',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ))));
    }

     Widget factorybutton(String text, void Function() pressed) {
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

     Widget employeebutton(String text, void Function() pressed) {
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

     Widget clientbutton(String text, void Function() pressed) {
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
    Widget factoryform(String label, void pressed()) {
      return Container(
              padding: const EdgeInsets.only( top:50 , left: 20, right: 20),
              child: SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: factorybutton(label, pressed)
      ));  
    }

     Widget employeeform(String label, void pressed()) {
      return Container(
              padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
              child: SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: employeebutton(label, pressed)
      ));
    }

     Widget clientform(String label, void pressed()) {
      return Container(
              padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
              child: SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: clientbutton(label, pressed)
      ));
    }

    void factorybuttonAction(){
      choise = factory;
      navigateToSubPage(context);
    }

    void employeebuttonAction(){
      choise = employee;
      navigateToSubPage(context);
    }

    void clientbuttonAction(){
      choise = client;
      navigateToSubPage(context);
    }


      return Scaffold(
        body: Column(
      children: [
        logo(),
        factoryform('Поиск Объекта',factorybuttonAction),
        employeeform('Поиск сотрудника', employeebuttonAction),
        clientform('Поиск клиента', clientbuttonAction),
      ],
    ));


  }
}