import 'package:flutter/material.dart';
import 'package:database/pages/companyregister.dart';
import 'package:database/pages/settings.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:typed_data';
import 'package:database/pages/utils.dart';

Future navigateToAddingCompanyPage(context) async {
  Navigator.push(context,
      MaterialPageRoute(builder: (context) => const CompanyRegisterPage()));
}
Future navigateSettingsPage(context) async {
  Navigator.push(context,
      MaterialPageRoute(builder: (context) => const SettingsPage()));
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
  Uint8List? _image;
  void selectImage() async {
    Uint8List? img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }
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
        onPressed: pressed, 
        icon: Icon(icon,color:Colors.white) );
    }

    _settingsButtonAction(){
        navigateSettingsPage(context);
    }


    return Scaffold(
      appBar: AppBar(title: const Text('Профиль',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25),),
      leading: _settingsButton(Icons.settings, _settingsButtonAction),),


    

      body: Column(
        
        children: [
          SizedBox(height: 25),
           Center(
            child: Stack(
            children:[ 
               _image != null
                      ? CircleAvatar(
                          radius: 64,
                          backgroundImage: MemoryImage(_image!),
                        )
                      : 
              const CircleAvatar(
                radius: 58,
                backgroundImage: NetworkImage('https://stickerswiki.ams3.cdn.digitaloceanspaces.com/roflanHD/6680083.512.webp'),
              ),
            Positioned(
              bottom: -10,
              left: 80,
              child: IconButton(
            onPressed: selectImage, icon: Icon(Icons.add_a_photo),
            ))
            ]
            )
          ),
          Text('${nekit.login}',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          Text('${nekit.surname} ${nekit.name} ${nekit.patronum}',
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey)),
          const Row(children: [
            Padding(
              padding: EdgeInsets.only(left: 20,top:35.0),
              child: Text('Мои объекты:',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ]),
          const SizedBox(height: 230),
          
              Padding(
              padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
              child: SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: _button('Добавить объект', _buttonaction),
              )),
        ],
      ),
    );
  }
}
