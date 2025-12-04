import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String output = "0";
  Color getButtonColor(String buttonLabel) {
    if (["/", "x", "-", "+", "=","%"].contains(buttonLabel)) {
      return Colors.deepOrange.shade700; 
    } else if (["CLEAR", "C"].contains(buttonLabel)) {
      return Colors.red.shade700;
    }
    return Colors.black; 
  }

  // **ฟังก์ชัน myButton ที่ปรับปรุงขอบมน, สี่เหลี่ยมจัตุรัส, และมี Padding**
  Widget myButton(String buttonLabel) {
    final buttonTextColor = getButtonColor(buttonLabel);

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(5.0), 
        child: AspectRatio(
          aspectRatio: 1.0, 
          child: OutlinedButton(
            onPressed: () {
              print("Button pressed: $buttonLabel");
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: buttonTextColor,
              backgroundColor: Colors.white,
              elevation: 2.0, 
              // กำหนดเส้นขอบ
              side: BorderSide(color: Colors.grey.shade300, width: 1.0), 
              // ทำให้ปุ่มมีขอบมน
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0), 
              ),
              textStyle: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            child: Text(
              buttonLabel,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("Calculator",),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 236, 113, 191),
          elevation: 0,
          foregroundColor: Colors.black,
        ),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(12, 24, 12, 12),
                alignment: Alignment.centerRight,
                child: Text(
                  output,
                  style: const TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const Expanded(
              child: SizedBox(), // ใช้ Expanded เปล่า ๆ เพื่อกินพื้นที่ว่างทั้งหมด
            ),
              const Divider(color: Colors.grey), 
              Expanded(
                child: Column(
                  children: [
                    Flexible(child: Row(children: [myButton("7"), myButton("8"), myButton("9"), myButton("%")])),
                  
                  // แถวที่ 2: 4, 5, 6, /
                  Flexible(child: Row(children: [myButton("4"), myButton("5"), myButton("6"), myButton("/")])),
                  
                  // แถวที่ 3: 1, 2, 3, x
                  Flexible(child: Row(children: [myButton("1"), myButton("2"), myButton("3"), myButton("x")])),
                  
                  // แถวที่ 4: C, 0, -, +
                  Flexible(child: Row(children: [myButton("."), myButton("0"), myButton("-"), myButton("+")])),
                  
                  // แถวที่ 5: . , = และปุ่มว่าง 2 ปุ่ม
                  Flexible(child: Row(children: [myButton("C"), myButton("=")])),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}