import 'package:flutter/material.dart';
import 'package:postgres/postgres.dart';

class Info extends StatelessWidget {
  const Info({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget logo() {
      return Padding(
          padding: const EdgeInsets.only(top: 80),
          child: Container(
              child: const Align(
                  child: Text('Информация об объекте:',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )))));
    }

    Widget information() {
      return Container(
        child: Column(children: [
          Padding(
            padding: EdgeInsets.only(top:20),),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            Expanded(
                flex: 1,
                child: Text('ID Объекта:', textAlign: TextAlign.justify ,  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)))
          ]),
          Padding(
            padding: EdgeInsets.only(top:45),),
           Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            Expanded(
                flex: 1,
                child: Text('Имя проекта:', textAlign: TextAlign.justify ,  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)))
          ]),
          Padding(
            padding: EdgeInsets.only(top:45),),
           Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            Expanded(
                flex: 1,
                child: Text('Описание проекта:', textAlign: TextAlign.justify ,  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)))
          ]),
          Padding(
            padding: EdgeInsets.only(top:45),),
           Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            Expanded(
                flex: 1,
                child: Text('Номер телефона:', textAlign: TextAlign.justify ,  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)))
          ]),
          Padding(
            padding: EdgeInsets.only(top:45),),
           Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            Expanded(
                flex: 1,
                child: Text('Фотография:', textAlign: TextAlign.justify ,  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)))
          ])
          
        ]),
      );
    }
    return Scaffold(
    body: Column(children: [logo(),information()],)
    );
  
  }

  
}



