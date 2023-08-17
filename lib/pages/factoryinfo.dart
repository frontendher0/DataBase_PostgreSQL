
import 'dart:convert';
import 'package:flutter/material.dart';


class Factory {
  int id;
  String name;
  String description;
  String phoneNumber;
  String picture;
  Factory(
      {required this.id,
      required this.name,
      required this.description,
      required this.phoneNumber,
      required this.picture});
  factory Factory.fromJson(Map<String, dynamic> parsedJson) {
    return Factory(
        id: parsedJson['id'],
        name: parsedJson['name'],
        description: parsedJson['description'],
        phoneNumber: parsedJson['phone_number'],
        picture: parsedJson['picture']);
  }
}

Image imageDecoder(String base64String) {
  return Image.memory(base64Decode(base64String));
}

Factory object =
    Factory(id: 0, name: '', description: '', phoneNumber: '', picture: '');

class FactoryInfo extends StatelessWidget {
  const FactoryInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget logo() {
      return const Padding(
          padding: EdgeInsets.only(top: 80),
          child: Align(
              child: Text('Информация об объекте:',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ))));
    }

    Widget information() {
      return Column(children: [
        const Padding(
          padding: EdgeInsets.only(top: 20),
        ),
        Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Expanded(
              flex: 1,
              child: Text('ID Объекта: ${object.id}',
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
              child: Text('Имя проекта: ${object.name}',
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
              child: Text('Описание проекта: ${object.description}',
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
              child: Text('Номер телефона: ${object.phoneNumber}',
                  textAlign: TextAlign.justify,
                  style:
                      const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)))
        ]),
        const Padding(
          padding: EdgeInsets.only(
            top: 45,
          ),
        ),
        Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Expanded(flex: 1, child: imageDecoder(object.picture))
        ])
      ]);
    }

    return Scaffold(
        body: Column(
      children: [logo(), information()],
    ));
  }
}
