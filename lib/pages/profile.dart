// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:database/pages/companyregister.dart';
import 'package:database/pages/settings.dart';
import 'package:image_cropper/image_cropper.dart';
import 'dart:io';
import 'package:database/pages/utils.dart';

Future navigateToAddingCompanyPage(context) async {
  Navigator.push(context,
      MaterialPageRoute(builder: (context) => const CompanyRegisterPage()));
}

Future navigateSettingsPage(context) async {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => const SettingsPage()));
}

class Client {
  //image avatar
  String login;
  String name;
  String surname;
  String patronum;
  Client(
      {required this.login,
      required this.name,
      required this.surname,
      required this.patronum});
}

final imageHelper = ImageHelper();

Client nekit = Client(
    login: '@nekitsmer4',
    surname: 'Студеничник',
    name: 'Никита',
    patronum: 'Игоревич');

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? _image;

  @override
  Widget build(BuildContext context) {
    _buttonaction() {
      navigateToAddingCompanyPage(context);
    }

    Widget _button(String text, void Function() pressed) {
      return TextButton(
          style: ButtonStyle(
            alignment: Alignment.bottomCenter,
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
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 22),
          ));
    }

    Widget _settingsButton(IconData icon, void Function() pressed) {
      return IconButton(
          onPressed: pressed, icon: Icon(icon, color: Colors.white));
    }

    _settingsButtonAction() {
      navigateSettingsPage(context);
    }



    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Профиль',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        leading: _settingsButton(Icons.settings, _settingsButtonAction),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 25),
            Center(
                child: Stack(children: [
              FittedBox(
                fit: BoxFit.contain,
                child: CircleAvatar(
                  radius: 58,
                  backgroundImage: const NetworkImage(
                      'https://stickerswiki.ams3.cdn.digitaloceanspaces.com/roflanHD/6680083.512.webp'),
                  foregroundImage: _image != null ? FileImage(_image!) : null,
                ),
              ),
              Positioned(
                  bottom: -10,
                  left: 80,
                  child: IconButton(
                      icon: const Icon(Icons.add_a_photo),
                      onPressed: () async {
                        final files = await imageHelper.pickImage();
                        if (files.isNotEmpty) {
                          final croppedFile = await imageHelper.crop(
                              file: files.first, cropStyle: CropStyle.circle
                          );
                          if (croppedFile != null) {
                            setState(() => _image = File(croppedFile.path));
                          }
                        }
                      },))
            ])),
            Text('${nekit.login}',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            Text('${nekit.surname} ${nekit.name} ${nekit.patronum}',
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey)),
            const Row(children: [
              Padding(
                padding: EdgeInsets.only(left: 20, top: 15.0),
                child: Text('Мои объекты:',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ]),

            Container(
              margin: EdgeInsets.only(top:10,left:15,bottom:5,right:15),
              decoration: BoxDecoration(
              color: const Color.fromARGB(137, 255, 255, 255),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
              color: Colors.black,
              width: 5,
                      )),
                  width: 500,
                  height: 300,
                  child:  Column(children: [
                    Text('Остров чистоты',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                    SizedBox(height: 10),
                    Image(image: NetworkImage('https://outleto.by/assets/components/phpthumbof/cache/ostrov-chistoty-new.10242b36569edc3db2545da7c1cac150.jpg',
                    scale: 10)),
                    SizedBox(height: 15),
                    Row(children: const [
                      Padding(
                        padding: EdgeInsets.only(left:10),
                        child: Text('Количество сотрудников: 54',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600)),
                      ),
                    ],),
                    SizedBox(height: 3),
                    Padding(
                      padding: const EdgeInsets.only(left:10),
                      child: Row(
                        children: const [
                          Text('Адресс: Пушкина 14.1 ',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                    SizedBox(height: 3),
                    Padding(
                      padding: const EdgeInsets.only(left:10),
                      child: Row(
                        children: const [
                          Text('Количество услуг: 18 ',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    _button('Добавить услугу',_buttonaction)
                    
                  ],)
            ),
             Container(
              margin: EdgeInsets.only(top:10,left:15,bottom:5,right:15),
              decoration: BoxDecoration(
              color: const Color.fromARGB(137, 255, 255, 255),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
              color: Colors.black,
              width: 5,
                      )),
                  width: 500,
                  height: 300,
                  child:  Column(children: [
                    Text('Евроопт',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                    SizedBox(height: 10),
                    Image(image: NetworkImage('https://ftime.by/sites/default/files/news/evroopt_socialnaya_skidka.jpg',
                    scale: 5.6)),
                    SizedBox(height: 15),
                    Row(children: const [
                      Padding(
                        padding: EdgeInsets.only(left:10),
                        child: Text('Количество сотрудников: 228',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600)),
                      ),
                    ],),
                    SizedBox(height: 3),
                    Padding(
                      padding: const EdgeInsets.only(left:10),
                      child: Row(
                        children: const [
                          Text('Адресс: Ленина 15 ',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                    SizedBox(height: 3),
                    Padding(
                      padding: const EdgeInsets.only(left:10),
                      child: Row(
                        children: const [
                          Text('Количество услуг: 55 ',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    _button('Редактировать объект',_buttonaction)
                    
                  ],)
            ),

            Padding(
                padding: const EdgeInsets.only(top: 10, left: 10, right: 10,bottom: 10),
                child: SizedBox(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  child: _button('Добавить объект', _buttonaction),
                )),
          ],
        ),
      ),
    );
  }
}
