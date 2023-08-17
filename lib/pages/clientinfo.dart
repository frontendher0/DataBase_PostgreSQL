import 'package:flutter/material.dart';
import 'package:database/pages/objectview.dart';
class Client {
  int id;
  String name;
  String surname;
  String patronum;
  String phoneNumber;
 
  Client(
      {required this.id,
      required this.name,
      required this.surname,
      required this.patronum,
      required this.phoneNumber,
      });

  
  factory Client.fromJson(Map<String, dynamic> parsedJson) {
    return Client(
        id: parsedJson['id'],
        name: parsedJson['name'],
        surname: parsedJson['surname'],
        patronum: parsedJson['phone_number'],
        phoneNumber: parsedJson['patronum']); 
  }
  
}

Future navigateToPrevPage(context) async {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => const Objectview()));
}


Client client =
    Client(id: 0, name: '', surname: '', patronum: '', phoneNumber: '');

  class ClientInfo extends StatelessWidget {
  const ClientInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget logo() {
      return const Padding(
          padding: EdgeInsets.only(top: 80),
          child: Align(
              child: Text('Информация о клиенте:',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ))));
    }

  Widget information() {
      return Column(children: [
        const Padding(
          padding: EdgeInsets.only(top: 45),
        ),
        Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Expanded(
              flex: 1,
              child: Text('Имя: ${client.name}',
                  textAlign: TextAlign.justify,
                  style:
                      TextStyle(fontSize: 15, fontWeight: FontWeight.bold)))
        ]),
        const Padding(
          padding: EdgeInsets.only(top: 45),
        ),
        Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Expanded(
              flex: 1,
              child: Text('Фамилия: ${client.surname}',
                  textAlign: TextAlign.justify,
                  style:
                      const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)))
        ]),
        const Padding(
          padding: EdgeInsets.only(top: 45),
        ),
        Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Expanded(
              flex: 1,
              child: Text('Отчество: ${client.patronum}',
                  textAlign: TextAlign.justify,
                  style:
                      const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)))
        ]),
        const Padding(
          padding: EdgeInsets.only(top: 45),
        ),
        Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Expanded(
              flex: 1,
              child: Text('Номер телефона: ${client.phoneNumber}',
                  textAlign: TextAlign.justify,
                  style:
                      const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)))
        ]),
        ]);
    }

return Scaffold(
        body: Column(
      children: [logo(), information()],
    ),
     floatingActionButton: FloatingActionButton(
        onPressed:(){
          navigateToPrevPage(context);
        },
        tooltip: 'Вернуться назад',
        backgroundColor: Colors.black,
        child: const Icon(Icons.backspace,color: Colors.white,),
    )
    );
  }
}



