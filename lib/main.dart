import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:faq/models/question.dart';
import 'package:faq/api/api_faq.dart';
import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';

Future<List<Question>?> futureQuestion = fetchQuestion();
List<String> list = ["gambar 1","gambar 2","gambar 3"];
void main() => runApp(FaqListScreen());

class FaqListScreen extends StatelessWidget {
  static const routeName = 'faq/';

  @override
  Widget build(BuildContext context) {
    return FutureBuilder (
      future: futureQuestion,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text('Tidak ada FAQ'),
          );
        } else if (snapshot.hasData) {
          var data = snapshot.data as List<Question>;
          List<MyTile> listOfTiles = <MyTile> [
            for(var q in data)
              new MyTile(q.fields!.pertanyaan ,
                  <MyTile>[
                    new MyTile(q.fields!.jawaban)
                  ])
          ];
          return Scaffold(
            appBar: AppBar(title: Text('Frequently Asked Question'),),
            body: SingleChildScrollView(
              physics: ScrollPhysics(),
              child: Column(
                children: <Widget>[
                  Text(""),
                  Center(
                    child: Text(
                      "FAQ",
                      style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(15.0),
                    itemBuilder: (BuildContext context, int index) {
                      return new StuffInTiles(listOfTiles[index]);
                    },
                    itemCount: listOfTiles.length,),
                  Center(
                    child: FormScreen(),
                  ),
                  Center(
                    child: Container(
                        child: CarouselSlider(
                          options: CarouselOptions(),
                          items: list.map((item) => Container(
                            child: Center(
                                child: Text(item.toString())
                            ),
                            color: Colors.green,
                          )).toList(),
                        )
                    ),
                  )
                ],
              ),
            ),
            drawer: NavigationDrawerWidget(),
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }
}


class StuffInTiles extends StatelessWidget {
  final MyTile myTile;
  StuffInTiles(this.myTile);

  @override
  Widget build(BuildContext context) {
    return _buildTiles(myTile);
  }

  Widget _buildTiles(MyTile t) {
    if (t.children.isEmpty)
      return new ListTile(
          dense: true,
          enabled: true,
          isThreeLine: false,
          onLongPress: () => print("long press"),
          onTap: () => print("tap"),
          title: new Text(t.title, style: TextStyle(fontSize: 17.0)));

    return new ExpansionTile(
      key: new PageStorageKey<int>(3),
      backgroundColor: Colors.white70,
      collapsedBackgroundColor: Colors.white,
      collapsedTextColor: Color(0xff0c0c0c),
      title: new Text(t.title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
      children: t.children.map(_buildTiles).toList(),
    );
  }
}


class MyTile {
  String title;
  List<MyTile> children;
  MyTile(this.title, [this.children = const <MyTile>[]]);
}

class FormScreen extends StatelessWidget {
  String pertanyaan = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 20.0),
        Center(
          child: Container(
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                  color: Color(0xffc3f1fc),
                  borderRadius: BorderRadius.all(Radius.circular(5.0))),
              child: new Center (
                  child: Text(
                    "Ada Pertanyaan?",
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Color(0xff374ABE),
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  )
              )
          ),
        ),

        SizedBox(height: 20.0),

        new Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsetsDirectional.only(top: 25.0, bottom: 8.0, start: 16.0, end: 16.0),
            child: Text(
              "Pertanyaan:",
              softWrap: true,
              style: new TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff374ABE)),
            ),
          ),
        ),

        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: <Widget>[
                TextFormField(
                  onChanged: (String value) {
                    pertanyaan = value;
                  },
                  maxLines: 7,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Tuliskan pertanyaan Anda...",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 0.3, color: Colors.blue),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                )
              ],
            ),

          ),
        ),

        SizedBox(height: 20.0),
        MaterialButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            padding: EdgeInsets.all(15.0),

            color: Color(0xff78d9ea),
            hoverColor: Color(0xff9decf6),

            onPressed: () async {
              final response = await http.post(Uri.parse('http://127.0.0.1:8000/Faq/json'),
                  headers: <String, String>{
                    'Content-Type': 'application/json; charset=UTF-8'
                  },
                  body: jsonEncode(<String, String>{
                    'pertanyaan': pertanyaan,
                  }));
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => FaqListScreen()),
              );
              futureQuestion = fetchQuestion();
            },
            child: Text(" Kirimkan pertanyaan ", style: TextStyle(
              // fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 17.0
            ))
        ),
        SizedBox(height: 20.0),
      ],
    );
  }
}






