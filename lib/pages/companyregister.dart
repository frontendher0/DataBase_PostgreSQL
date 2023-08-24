import 'package:flutter/material.dart';
import 'package:database/pages/serviceadding.dart';
import 'dart:convert';
import 'dart:typed_data';
import 'dart:io';
import 'package:http/http.dart' as http;




Future navigateToServiceAddingPage(context) async {
  Navigator.push(context,
      MaterialPageRoute(builder: (context) => const ServiceAddingPage()));
}

List parseFiles(List files) {
List stringList = [];
for (var file in files) {
if (file.existsSync()) {
Uint8List content = file.readAsBytesSync();
stringList.add(base64Encode(content));
}
}
return stringList;
}


class CompanyRegisterPage extends StatefulWidget {
  const CompanyRegisterPage({super.key});

  @override
  State<CompanyRegisterPage> createState() => _CompanyRegisterPageState();
}


void postData() async {
String apiUrl = 'http://192.168.100.26:5000/factories';

Map<String, dynamic>? requestBody = {
'name': _companyNameController.text,
'description': _companyDescriptionController.text,
'phone_number': _companyPhoneNumberController.text,
'pictures': _companyImages
};
final jsonString = json.encode(requestBody);
final Map<String, String> headers = {
    'Accept': '*/*',
    'Content-Type': 'application/json',
  };
// Отправка POST-запроса
var response = await http.post(Uri.parse(apiUrl), body:jsonString, headers: headers);

// Обработка ответа
if (response.statusCode == 200) {
print('Успешный POST-запрос');
print(response.body);
} else {
print('Ошибка POST-запроса: ${response.statusCode}');
}
}

List _companyImages = [];


String _companyName = '';
TextEditingController _companyNameController = TextEditingController();
String _companyDescription = '';
TextEditingController _companyDescriptionController = TextEditingController();
String _companyPhoneNumber = '';
TextEditingController _companyPhoneNumberController = TextEditingController();

class _CompanyRegisterPageState extends State<CompanyRegisterPage> {
  List<File> _images = [];

  @override
  Widget build(BuildContext context) {
    Widget _logo() {
      return const Padding(
          padding: EdgeInsets.only(top: 70, bottom: 20),
          child: Align(
              child: Text('Регистрация объекта',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ))));
    }

    Widget _input(String hint, TextEditingController controller) {
      return Container(
          padding:
              const EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 15),
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

    Widget _button(String text, void Function() pressed) {
      return TextButton(
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

    List stringList = parseFiles(_images); 

   

    Widget _form(String label, void pressed()) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: _input("Введите название объекта: ", _companyNameController),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: _input(
                "Введите описание объекта: ", _companyDescriptionController),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: _input(
                "Введите номер телефона: ", _companyPhoneNumberController),
          ),
          Column(children: [
            const Row(
              children: [
                Padding(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      'Фотографии объекта:',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                Container(
                  margin: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: Colors.black,
                        width: 5,
                      )),
                  width: 100,
                  height: 100,
                  child: IconButton(
                    icon: const Icon(
                      Icons.add_a_photo,
                      color: Colors.white,
                    ),
                    onPressed: () async {
                      final files = await imageHelper.pickImage(multiple: true);
                      setState(() =>
                          _images = files.map((e) => File(e.path)).toList());
                    },
                  ),
                ),
                Wrap(
                  spacing: 4,
                  runSpacing: 4,
                  children: _images
                      .map((e) => Image.file(e,
                          height: 100, width: 100, fit: BoxFit.cover))
                      .toList(),
                ),
              ]),
            ),
          ]),
          const SizedBox(height: 20),
          Padding(
              padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
              child: SizedBox(
                height: 70,
                width: MediaQuery.of(context).size.width,
                child: _button(label, pressed),
              )),
             
        ],
      );
    }
    

    _addCompanybuttonAction() {
      
     _companyName = _companyNameController.text;
     _companyDescription = _companyDescriptionController.text;
     _companyPhoneNumber = _companyPhoneNumberController.text;
     _companyImages = stringList;
     postData();
     _companyNameController.clear();
     _companyDescriptionController.clear();
     _companyPhoneNumberController.clear();

    }

    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _logo(),
              _form('Создать объект', _addCompanybuttonAction),
            ],
          ),
        ));
  }
}
