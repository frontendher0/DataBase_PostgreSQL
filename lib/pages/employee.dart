import 'package:flutter/material.dart';
import 'package:database/pages/objectview.dart';
class Employee {
  int id;
  String name;
  String surname;
  String patronum;
  String specialization;
  String phoneNumber;
  String workplace;
  int workplaceId;
  Employee(
      {required this.id,
      required this.name,
      required this.surname,
      required this.patronum,
      required this.phoneNumber,
      required this.specialization,
      required this.workplace,
      required this.workplaceId
      });

  
  factory Employee.fromJson(Map<String, dynamic> parsedJson) {
    return Employee(
        id: parsedJson['id'],
        name: parsedJson['name'],
        surname: parsedJson['surname'],
        patronum: parsedJson['phone_number'],
        phoneNumber: parsedJson['patronum'],
        specialization: parsedJson['specialization'],
        workplace: parsedJson['workplace'],
        workplaceId: parsedJson['workplaceId'] );
  }
  
}

Future navigateToPrevPage(context) async {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => const Objectview()));
}

Employee employee =
    Employee(id: 0, name: '', surname: '', patronum: '', phoneNumber: '', specialization: '', workplace: '',workplaceId: 0);

  class EmployeeInfo extends StatelessWidget {
  const EmployeeInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget logo() {
      return const Padding(
          padding: EdgeInsets.only(top: 80),
          child: Align(
              child: Text('Информация о сотруднике:',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ))));
    }

  Widget information() {
      return Container(
        child: Column(children: [
          const Padding(
            padding: EdgeInsets.only(top: 45),
          ),
          Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Expanded(
                flex: 1,
                child: Text('ID Сотрудника: ${employee.id}',
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
                child: Text('Имя: ${employee.name}',
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
                child: Text('Фамилия: ${employee.surname}',
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
                child: Text('Отчество: ${employee.patronum}',
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
                child: Text('Номер телефона: ${employee.phoneNumber}',
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
                child: Text('Специализация: ${employee.specialization}',
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
                child: Text('Место работы: ${employee.workplace}',
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
                child: Text('ID Места работы: ${employee.workplaceId}',
                    textAlign: TextAlign.justify,
                    style:
                        const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)))
          ]), 
        ]),
      );
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
       
    
    ));
    


    
  }
}
