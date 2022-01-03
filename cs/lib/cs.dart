import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

void main() {
  runApp(MaterialApp(
    title: "Belajar Form Flutter",
    home: CSapi(),
  ));
}

class CSapi extends StatefulWidget {
  @override
  _CSapiState createState() => _CSapiState();
}

class _CSapiState extends State<CSapi> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controllerNama = TextEditingController();
  String pilihan = "";
  int _value = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Customer Service',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Times New Roman',
          ),
        ),
        backgroundColor: Colors.blueGrey,
      ),

      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 20, 8,8),
                  child: TextFormField(
                    controller: _controllerNama,
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: "Nama",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                  ),
                ),

                Container(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                    child: const Text('Silahkan pilih media untuk menghubungi kami: ', textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Times New Roman',
                          fontSize: 20),
                    )
                ),

                Row(children: <Widget>[
                  Radio(
                    value: 1,
                    groupValue: _value,
                    onChanged: (value){
                      setState(() {
                        pilihan = "Instagram";
                        _value = 1;
                      });
                    },
                  ),
                  SizedBox(width: 10.0,),
                  Text("Instagramㅤ‏‏‎ ‏‏‎"),
                ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),

                Row(children: <Widget>[
                  Radio(
                    value:2,
                    groupValue: _value,
                    onChanged: (value){
                      setState(() {
                        pilihan = "Twitter";
                        _value = 2;
                      });
                    },
                  ),
                  SizedBox(width: 10.0,),
                  Text("Twitter ‏‏‎ ‏‏‎ ‏‏‎ ‏‏‎ ‏‏‎ ‏‏‎ ‏‏‎ ‏‏‎ ‏‏‎ ‏‏‎ ‏‏‎‏‏‎‏‏‎"),
                ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),

                Row(children: <Widget>[
                  Radio(
                    value:3,
                    groupValue: _value,
                    onChanged: (value){
                      setState(() {
                        pilihan = "WA/Telepon";
                        _value = 3;
                      });
                    },
                  ),
                  SizedBox(width: 10.0,),
                  Text("WA/Telepon‏‏‎ ‏‏‎"),
                ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),

                Padding(
                  padding: const EdgeInsets.all(8),
                  child: ElevatedButton(

                      child: const Text('Submit'),


                      onPressed: () async {
                        print(_value);
                        if (_value == 1) {
                          print("insta");
                          showAlertDialog(context);
                        }

                        else if (_value == 2) {
                          print("twit");
                          showAlertDialog2(context);
                        }

                        else if (_value == 3) {
                          print("wa");
                          showAlertDialog3(context);
                        }

                        const url = "https://hachoo.herokuapp.com/cs/tambahFlutter";
                        final response = await http.post(Uri.parse(url),
                            headers: <String, String>{
                              'Content-Type': 'application/json; charset=UTF-8',
                            },
                            body: jsonEncode(<String, String>{
                              'nama': _controllerNama.text,
                              'media': pilihan,
                            })
                        );

                        //Map<String, dynamic> data = jsonDecode(response.body);
                      },
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(500, 50),
                          primary: Colors.grey,
                          textStyle: const TextStyle(
                            color: Colors.black,
                          )
                      )
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// dialog IG
showAlertDialog(BuildContext context) {
  // set up the button
  Widget okButton = TextButton(
    child: Text("Kembali"),
    onPressed: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CSapi()
          )
      );
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Silakan hubungi kontak di bawah untuk segera menghubungi kami"),
    content: Column (
      children: <Widget>[
        Image.asset('assets/images/cs/insta.png'),
        Text("\n@hachoo"),
      ],
    ),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

// dialog twitter
showAlertDialog2(BuildContext context) {
  // set up the button
  Widget okButton = TextButton(
    child: Text("Kembali"),
    onPressed: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CSapi()
          )
      );
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Silakan hubungi kontak di bawah untuk segera menghubungi kami"),
    content: Column (
      children: <Widget>[
        Image.asset('assets/images/cs/twit.png'),
        Text("\n@hachoo"),
      ],
    ),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

// dialog WA
showAlertDialog3(BuildContext context) {
  // set up the button
  Widget okButton = TextButton(
    child: Text("Kembali"),
    onPressed: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CSapi()
          )
      );
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Silakan hubungi kontak di bawah untuk segera menghubungi kami"),
    content: Column (
      children: <Widget>[
        Image.asset('assets/images/cs/wa.png'),

        Text("\n080012345678"),
      ],
    ),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}