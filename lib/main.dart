import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Corps(),
    );
  }
}

class Corps extends StatefulWidget {
  const Corps({super.key});

  @override
  State<Corps> createState() => _CorpsState();
}

class _CorpsState extends State<Corps> {
  var message1 = "";
  var message2 = "";

  onClick(btn){
    setState(() {
      if(btn == "btn1"){
        message1="Btn 1";
      }else{
        message2="Btn 2";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Tester les Buttons"),
        ),
        body: Column(children: [
          ElevatedButton(
            onPressed: () {
              onClick("btn1");
            },
            child: Text("Btn 1"),
          ),
          Text(message1 , style: TextStyle(
            fontSize: 20,
            color: Colors.blue,
          ),),
          Divider(height: 30,),

          ElevatedButton(
            onPressed: () =>onClick("btn2"),
            child: Text("Btn 2"),
          ),
          Text(message2,
            style: TextStyle(
            fontSize: 20,
            color: Colors.red,
          ),),

        ]));
  }
}
