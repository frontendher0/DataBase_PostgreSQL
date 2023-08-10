import 'package:flutter/material.dart';
import 'package:postgres/postgres.dart';

class Info extends StatelessWidget {
const Info({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
     Widget logo(){
    return Padding(
    padding: const EdgeInsets.only(top: 80),
    child: Container(
      child: const Align(
        child: Text('Информация об объекте:',
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Colors.black,
         )
        )
       ) 
      )
    );
  }


Widget information(){
  return Padding(
    padding: EdgeInsets.only (top: 20, left: 20),
    child: Container(
      child: const Align(
      child: Text('ID: $Jopa.name ', )

      )

}

 return Scaffold(
    body: Column(children: [
      logo()],
      )
      return Card()
  );
 

    
  }
}

class Object{
  int id;
  String name;
  String description;
  //Byte picture[];
  Object({ required this.id, required this.name, required this.description, /*required this.picture*/});
}

Object Jopa = Object(id: 228, name : 'jopa', description: 'idite');
