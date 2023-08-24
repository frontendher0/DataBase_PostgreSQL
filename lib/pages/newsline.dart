import 'package:flutter/material.dart';

class NewslinePage extends StatefulWidget {
  const NewslinePage({super.key});

  @override
  State<NewslinePage> createState() => _NewslinePageState();
}
class Factory{
    Image avatar;
    String name;
    Factory({required this.avatar,required this.name});
  }
class Service{
  String name;
  String price;
  Service({required this.name,required this.price});
}
class PostInfo{
  Factory factory;
  Image postPhoto;
  String description;
  Service service; 
  PostInfo({required this.factory,required this.service,required this.description,required this.postPhoto});
}






class _NewslinePageState extends State<NewslinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,title: const Text('Новости',style: TextStyle(fontSize:25,fontWeight:FontWeight.bold))),
      body: Container()
             /* margin: EdgeInsets.only(top:10,left:25,bottom:5,right:25),
              decoration: BoxDecoration(
              color: const Color.fromARGB(137, 255, 255, 255),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
              color: Colors.black,
              width: 5,
                      )),
                  width: 500,
                  height: 500,
                  child: Column(children: [
                    const Row(children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: FittedBox(
                                      fit: BoxFit.contain,
                                      child: CircleAvatar(
                                        radius: 28,
                                        backgroundImage: 
                      NetworkImage('https://sun9-41.userapi.com/impg/QI3IOaeR64pJ4TZBj3_Pw8rLkZTXMHNjy3hOKg/SSHuuO1fBiE.jpg?size=1620x2160&quality=96&sign=f321b05075b0b58814a742dd989f42dd&type=album'),
                      ))),
                      Padding (padding: EdgeInsets.only(top:8,left:20),
                      child: Text('Ноготочки Многопоточки',style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold)) 
                      )
                      ],),
                 const Image(image: NetworkImage('https://almode.ru/uploads/posts/2020-01/medium/1579837735_9-p-samii-khudshii-manikyur-instagramm-16.jpg',scale:5)),
                    const Padding(
                      padding: EdgeInsets.all(5),
                      child: Text('Ребята,сделала охуенный маникюр xD Максимально накиньте актива лютой',style:TextStyle(fontSize: 13,fontWeight: FontWeight.bold)),
                    ),
                    const Padding(padding: EdgeInsets.all(5),
                        child:Row(
                          children: [
                            Text('Услуга:',
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                          ],
                        )),
                    const Padding(padding: EdgeInsets.all(5),
                        child:Row(
                          children: [
                            Text('Супер хуевый маникюр "Вагинальный волосок"',
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10.8),),
                            Padding(padding: EdgeInsets.only(left:25),
                        child:Text('999999 BYN',
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10),))
                          ],
                        )),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconButton(onPressed:(){}, icon: const Icon(Icons.heart_broken,size: 50)),
                        )
                    ])
  ));*/
    );
  }
}