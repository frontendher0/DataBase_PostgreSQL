import 'package:flutter/material.dart';
import 'package:database/pages/companyregister.dart';
import 'package:database/pages/settings.dart';

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
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
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
          const SizedBox(height: 20),
          Center(
            child: Container(
              width: 100,
              height: 100,
              child: const Placeholder(),
            ),
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
              child: Text('Мои компании:',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ]),
          const SizedBox(height: 300),
          
              Padding(
              padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
              child: SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: _button('Добавить компанию', _buttonaction),
              )),
        ],
      ),
    );
  }
}
