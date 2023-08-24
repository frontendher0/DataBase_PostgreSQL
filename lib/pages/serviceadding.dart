import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:database/pages/companyregister.dart';
import 'dart:io';
import 'package:database/pages/utils.dart';
import 'package:http/http.dart' as http;


Future navigateToCompanyRegisterPage(context) async {
    Navigator.push(
      context, MaterialPageRoute(builder: (context) => const CompanyRegisterPage()));
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


void postData() async {
String apiUrl = 'https://api.example.com/post';

Map requestBody = {
'name': _serviceNameController.text,
'cost': _servicePriceController.text,
'description': _serviceDescriptionController.text,
'images': _serviceImages
};

// Отправка POST-запроса
var response = await http.post(Uri.parse(apiUrl), body: requestBody);

// Обработка ответа
if (response.statusCode == 200) {
print('Успешный POST-запрос');
print(response.body);
} else {
print('Ошибка POST-запроса: ${response.statusCode}');
}
}




String _serviceName = '';
String _servicePrice = '';
String _serviceDescription = '';
List _serviceImages = [];


TextEditingController _serviceNameController = TextEditingController();
TextEditingController _servicePriceController = TextEditingController();
TextEditingController _serviceDescriptionController = TextEditingController();

final imageHelper = ImageHelper();

class ServiceAddingPage extends StatefulWidget {
  const ServiceAddingPage({super.key});

  @override
  State<ServiceAddingPage> createState() => _ServiceAddingPageState();
}

class _ServiceAddingPageState extends State<ServiceAddingPage> {
  List<File> _images = [];


  @override
  Widget build(BuildContext context) {
    Widget _logo() {
      return const Padding(
          padding: EdgeInsets.only(top: 70,bottom: 20),
          child: Align(
              child: Text('Создание новой услуги:',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ))));
    }


    Widget _input(String hint, TextEditingController controller) {
      return Container(
          padding:
              const EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 15),
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


    Widget _inputdescription(String hint, TextEditingController controller) {
      return Container(
          padding:
              const EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 5 ),
          child: TextField(
            maxLines: 4,
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



    Widget _form(String label, void pressed()) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(top: 5),
        child: _input("Введите название услуги: ", _serviceNameController),
      ),
     
      Padding(
        padding: const EdgeInsets.only(top: 5),
        child: _input("Укажите стоимость услуги: ", _servicePriceController),
      ),
     
      Padding(
        padding: const EdgeInsets.only(top: 5,bottom: 5),
        child: _inputdescription("Введите описание услуги: ", _serviceDescriptionController)
      ),


        Column(
        children: [
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.all(15),
                child: Text ('Фотографии объекта:',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
              ),
            ],),

           
               SingleChildScrollView(
                scrollDirection: Axis.horizontal,  
                 child: 
                 Row(
                  children:[
                     Container(
                    margin: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: Colors.black,
                      width: 5,
                     )
                    ),
                    width: 100,height: 100,
                    child: IconButton(icon: const Icon(Icons.add_a_photo,color: Colors.white,), 
                    onPressed: () async {
                      final files = await imageHelper.pickImage(multiple:true);
                      setState(() => _images = files.map((e) => File(e.path)).toList());
                     },
                     ),
                  ),
                  Wrap(
                    spacing:4,runSpacing:4,
                    children:
                   _images.map((e) => Image.file(
                    e,
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover
                    )
                    ).toList(),
                  ),
                 ]
          ),
               ),
       
          Padding(
              padding: const EdgeInsets.only(top: 25,left: 15, right: 15),
              child: Container(
                height: 70,
                width: MediaQuery.of(context).size.width,
                child: _button(label, pressed),
              ))
      
      ])]);
      
   }



List stringList = parseFiles(_images); 
   
   void _buttonAction() async {
      
      _serviceName = _serviceNameController.text;
      _servicePrice = _servicePriceController.text;
      _serviceDescription = _serviceDescriptionController.text;
      _serviceImages = stringList;
       postData();
       _serviceNameController.clear();
       _servicePriceController.clear();
       _serviceDescriptionController.clear();
      _images.clear();
      
   navigateToCompanyRegisterPage(context);
    }
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
              children: [
          _logo(),
          _form('Создать новую услугу', _buttonAction),
              ],
            ),
        ),
    );
    
 }
}