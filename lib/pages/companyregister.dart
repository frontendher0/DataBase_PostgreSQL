import 'package:flutter/material.dart';
import 'package:database/pages/serviceadding.dart';

Future navigateToServiceAddingPage(context) async {
    Navigator.push(
      context, MaterialPageRoute(builder: (context) => const serviceAddingPage()));
 }

 

final List<String> servicesNames = [];


class CompanyRegisterPage extends StatefulWidget {
  const CompanyRegisterPage({super.key});

  @override
  State<CompanyRegisterPage> createState() => _CompanyRegisterPageState();
}

class ServiceName extends StatelessWidget {
  final String text;
  const ServiceName({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text);
  }
}


String _companyName = '';
TextEditingController _companyNameController = TextEditingController();
String _companyDescription = '';
TextEditingController _companyDescriptionController = TextEditingController();
String _companyPhoneNumber = '';
TextEditingController _companyPhoneNumberController = TextEditingController();


class _CompanyRegisterPageState extends State<CompanyRegisterPage> {
  @override
  Widget build(BuildContext context) {
    Widget _logo() {
      return const Padding(
          padding: EdgeInsets.only(top: 70,bottom: 20),
          child: Align(
              child: Text('Регистрация Компании',
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


    


    Widget nameServices(){
      Padding (padding:EdgeInsets.only(left:5));
      return Text('${servicesNames}');

    }

    Widget _form(String label, void pressed()) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(top: 5),
        child: _input("Введите название компании: ", _companyNameController),
      ),
     
      Padding(
        padding: const EdgeInsets.only(top: 5),
        child: _input("Введите описание компании: ", _companyDescriptionController),
      ),
     
      Padding(
        padding: const EdgeInsets.only(top: 5),
        child: _input("Введите номер телефона: ", _companyPhoneNumberController),
      ),

      Padding(
        
        padding: EdgeInsets.only(top: 5),
        child: Column(
         mainAxisAlignment : MainAxisAlignment.start,
         children: [
          Text('Ваши услуги:',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
          nameServices()     
         ])
      ),
     
      const SizedBox(
        height: 10
      ),
      Padding(
          padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
          child: SizedBox(
            height: 70,
            width: MediaQuery.of(context).size.width,
            child: _button(label, pressed),
          ))
        ],
      );
    }

    _addServicebuttonAction(){
      navigateToServiceAddingPage(context);
    }

     return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            _logo(),
            _form('Добавить услугу',_addServicebuttonAction),
           
          ],
        ));

      



  }
}