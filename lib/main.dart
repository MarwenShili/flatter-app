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
  var nbLike = 0;
  var nbDisLikes = 0;
  String inputTxt = "";

  onClick(btn) {
    setState(() {
      if (btn == "btn1") {
        message1 = "Btn 1 clicked";
      } else {
        message2 = "Btn 2 clicked";
      }
    });
  }

  onLikeDislike(type) {
    setState(() {
      if (type == "add") {
        nbLike = nbLike + 1;
      } else {
        nbDisLikes = nbDisLikes + 1;
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
          Text(
            message1,
            style: TextStyle(
              fontSize: 20,
              color: Colors.blue,
            ),
          ),
          Divider(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () => onClick("btn2"),
            child: Text("Btn 2"),
          ),
          Text(
            message2,
            style: TextStyle(
              fontSize: 20,
              color: Colors.red,
            ),
          ),
          Divider(height: 30),
          IconButton(
            onPressed: () {
              onLikeDislike("add");
            },
            icon: Icon(Icons.thumb_up),
            color: Colors.green,
          ),
          Text(nbLike.toString()),
          SizedBox(width: 20),
          IconButton(
            onPressed: () {
              onLikeDislike("remove");
            },
            icon: Icon(Icons.thumb_down),
            color: Colors.red,
          ),
          Text(nbDisLikes.toString()),
          SizedBox(height: 20),
          Container(
            width: 400,
            child: TextField(
                onChanged: (value) {
                  setState(() {
                    inputTxt = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Enter text',
                  labelText: 'Text',
                  border: OutlineInputBorder(),
                ),
                style: TextStyle(color: Colors.black)),
          ),
          Text(inputTxt),
        ]));
  }
}
