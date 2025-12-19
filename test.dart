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
      home: const MyHomePage(title: 'Food management system'),
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
   List<foodMenu> foodNames = [
      foodMenu("กุ้งเผา", "500"),
      foodMenu("กระเพราหมู", "80"),
      foodMenu("ปลาเผา", "50"),
      foodMenu("ข้าวมันไก่", "50"),
      foodMenu("ผัดไท", "90"),
    ];
   List<foodMenu> menu = []; // สร้าง listว่างเพื่อเก็บข้อมูล
    void _addMenu(){
      setState(() {
        if (menu.length < foodNames.length){
          int nextNum = menu.length +1;
          menu.add(foodNames[menu.length]);
        }
        
      });
     
    }
    void _deleteMenu(){
      setState(() {
        if(menu.isNotEmpty){
          menu.removeLast();
        }
      });
    }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true, // ใส่พื้นหลัง
        title: Text(widget.title),),

      body:menu.isEmpty?
      const Center(child: Text("ไม่มีเมนู",style: TextStyle(fontSize: 20,color: Colors.red),),) 
      : ListView.builder(
        itemCount: menu.length,
        itemBuilder: (context,int index){
          foodMenu food = menu[index];
          return ListTile(
            //leading: Icon(Icons.restaurant_menu),
            leading: CircleAvatar(child: Text("${index+1}")),
            title: Text(food.foodname),
            subtitle: Text("ราคา ${food.foodprice}"),
          );
        }),

    floatingActionButton: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          onPressed: _addMenu,
          child: Icon(Icons.add),),
          SizedBox(height: 10,),
          FloatingActionButton(
            onPressed: _deleteMenu,
            child: Icon(Icons.remove),),
      ],
    ), 
    );
  }
}
