import 'package:flutter/material.dart';
import 'package:database/pages/serviceadding.dart';
import 'package:image_picker/image_picker.dart';


/*Future<void> getLostData() async {
  final ImagePicker picker = ImagePicker();
  final LostDataResponse response = await picker.retrieveLostData();
  if (response.isEmpty) {
    return;
  }
  final List<XFile>? files = response.files;
  if (files != null) {
    _handleLostFiles(files);
  } else {
    _handleError(response.exception);
  }
}*/


List<Widget> picrures = [];



Future navigateToServiceAddingPage(context) async {
    Navigator.push(
      context, MaterialPageRoute(builder: (context) => const serviceAddingPage()));
 }

 


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

  Widget _pictureholder(){
    return Image(image:
     Image.network('https://sun9-45.userapi.com/impg/ijywhzCK8DCTXTwNfu_3W2NQpULk-5Flggfptw/bTLO4oZDljo.jpg?size=960x1280&quality=95&sign=dcb8013a412192bca0857a9b93223879&type=album').image ,
     fit: BoxFit.cover);
  }
    


 

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
        child: _input("Введите описание объекта: ", _companyDescriptionController),
      ),
     
      Padding(
        padding: const EdgeInsets.only(top: 5),
        child: _input("Введите номер телефона: ", _companyPhoneNumberController),
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

            Row(
              children:[
                Container(
                  margin: EdgeInsets.all(15),
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
                  onPressed: () { },),
                ),
                Container(
                  margin: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                  image: Image.network(
                  'https://sun9-62.userapi.com/impg/EiKJC5UOufKH8PBCFG05hBPkQtcYZw_RmyUhgg/PcQKTI7ux44.jpg?size=200x150&quality=95&sign=4f630ec31f1c6416bbdd957f0e4336bd&c_uniq_tag=sj412vCUV-wqlNYsfWXeRKJrmEEF3_t_eTVqm43QtVI&type=album').image ,
                  fit: BoxFit.cover)
                  ),
                  
                  width: 100,height: 100,
                ),
                Container(
                  margin: EdgeInsets.all(15),
                  width: 100,height: 100,
                  decoration: BoxDecoration(
                  image: DecorationImage(
                  image: Image.network(
                  'https://sun9-41.userapi.com/impg/ED-kO-7BHALE5vJxUGeMJINq-yLXKXWuqDUcDQ/MwgkrmkxTnc.jpg?size=605x807&quality=96&sign=378478c15d2d3fbae198f377039ea475&c_uniq_tag=ZfMpR0O8cuiPrayud9dV-QH0bKa4j6RykBBTBUd00Nc&type=album').image ,
                  fit: BoxFit.cover),
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(15),
                  ))
                  
                  
                
            ],),
            const Row(
            children: [
              Padding(
                padding: EdgeInsets.all(15),
                child: Text ('Добавить услуги:',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
              ),
            ],),
        ]),

     




     
      
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
            _form('Редактор услуг',_addServicebuttonAction),
           
          ],
        ));

      



  }
}