import 'package:flutter/material.dart';
import 'foodMenu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
   List<foodMenu> menu = [
      foodMenu("กุ้งเผา", "500"),
      foodMenu("กระเพราหมู", "80"),
      foodMenu("ปลาเผา", "50"),
      foodMenu("ข้าวมันไก่", "50"),
      foodMenu("ผัดไท", "90"),
    ];
  //int _counter = 0;

  /*void _incrementCounter() {
    setState(() {
     
      _counter++;
    });
  }*/
  List<Widget> getData(int count){
    List<Widget> data = [];

    //data.add(Text("กดปุ่ม เพิ่มค่า ตัวเลข",style: TextStyle(fontSize: 40,color: Colors.red),),);
    //data.add(Text(_counter.toString(),style: TextStyle(fontSize: 50),));
    for(var i = 1; i <= count; i++){
      var menu = ListTile(title: Text("เมนูที่ $i",style: TextStyle(fontSize: 20,color: Colors.red),
      ),
      subtitle: Text("หัวข้อย่อยที่ $i"),
      );
      data.add(menu);
      //data.add(Text("ListView List with รอบที่ $i"));
    }
    return data;
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body:ListView.builder(
        itemCount: 5,
        itemBuilder: (BuildContext context,int index){
        foodMenu food=menu[index];
        return ListTile(
          title: Text("เมนูที่ ${index + 1}"),
          subtitle: Text(food.foodname + "ราคา" + food.foodprice + "บาท"),
        );
      }),
      /*floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),*/
    );
  }
}
