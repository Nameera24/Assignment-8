import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_4a/main.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController txt = TextEditingController();
  var gettext = "";
  var lst = [];

  add() {
    setState(() {
      lst.add(gettext);
      print(lst);
    });
  }

  delete() {
    setState(() {
      lst.remove(gettext);
      print(lst);
    });
  }

  var index = 1;
  update() {
    setState(() {
      lst.insert(index, gettext);
      print(lst);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Title(
            color: Colors.white,
            child: Center(
              child: Text(
                "My ToDo App!",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            )),
        leading: CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(
                "https://tse1.mm.bing.net/th?id=OIP.Zz0Sl912dcHm9EQd5WX0ygHaHa&pid=Api&P=0&w=153&h=153")),
        actions: [
          Icon(
            Icons.search,
            color: Colors.white,
          ),
          Icon(
            Icons.more_vert,
            color: Colors.white,
          )
        ],
      ),
      backgroundColor: Colors.blueAccent,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 200,
            ),
            TextField(
                decoration: InputDecoration(
                    hintText: "Type Here!", border: OutlineInputBorder()),
                controller: txt,
                onChanged: (value) {
                  gettext = value;
                }),
            Padding(padding: EdgeInsets.all(10)),
            TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.white),
                onPressed: () {
                  add();
                  txt.clear();
                },
                child: Text(
                  "Add",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                  ),
                )),
            Padding(padding: EdgeInsets.all(10)),
            TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.white),
                onPressed: () {
                  delete();
                },
                child: Text(
                  'Delete',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                  ),
                )),
            Padding(padding: EdgeInsets.all(10)),
            TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.white),
                onPressed: () {
                  update();
                },
                child: Text(
                  'Update',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                  ),
                )),
            Padding(padding: EdgeInsets.all(10)),
            ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: lst.length,
                itemBuilder: (context, index) {
                  return Text(lst[index]);
                })
          ],
        ),
      ),
    );
  }
}
