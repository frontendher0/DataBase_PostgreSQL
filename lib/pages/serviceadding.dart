import 'package:flutter/material.dart';
import 'package:database/pages/companyregister.dart';

Future navigateToCompanyRegisterPage(context) async {
    Navigator.push(
      context, MaterialPageRoute(builder: (context) => const CompanyRegisterPage()));
 }

class NewService{
String name;
String price;
String description;
//image

NewService({required this.name, required this.price, required this.description});
}





TextEditingController _serviceNameController = TextEditingController();
TextEditingController _servicePriceController = TextEditingController();
TextEditingController _serviceDescriptionController = TextEditingController();



class serviceAddingPage extends StatefulWidget {
  const serviceAddingPage({super.key});

  @override
  State<serviceAddingPage> createState() => _serviceAddingPageState();
}

class _serviceAddingPageState extends State<serviceAddingPage> {
  @override
  Widget build(BuildContext context) {
    Widget _logo() {
      return const Padding(
          padding: EdgeInsets.only(top: 70,bottom: 20),
          child: Align(
              child: Text('Создание новой услуги:',
                  style: TextStyle(
                    fontSize: 18,
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


    Widget _inputdescription(String hint, TextEditingController controller) {
      return Container(
          padding:
              const EdgeInsets.only(top: 15, left: 15, right: 5, bottom: 25 ),
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
       SizedBox(
            height: 15,
          ),
          Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: _button(label, pressed),
              ))
      ]
      );
   }


   
   void _buttonAction() async {
      servicesNames.add(_serviceNameController.text);
      NewService(name: _serviceNameController.text, price: _servicePriceController.text, description: _serviceDescriptionController.text);
       _serviceNameController.clear();
       _servicePriceController.clear();
       _serviceDescriptionController.clear();
      
      //post
   navigateToCompanyRegisterPage(context);
    }
    return Scaffold(
      resizeToAvoidBottomInset: false,
        body: Column(
      children: [
        _logo(),
        _form('Создать новую услугу', _buttonAction),
      ],
    ),
    );
    
 }
}