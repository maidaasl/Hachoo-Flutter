import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';


void main() {
  runApp(MaterialApp(
    title: "CS Hachoo",
    home: BelajarForm(),
  ));
}

class BelajarForm extends StatefulWidget {
  @override
  _BelajarFormState createState() => _BelajarFormState();
}

class _BelajarFormState extends State<BelajarForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controllerNama = TextEditingController();
  String pilihan = "";
  int _value = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Homepage   Vaksin   Informasi   Layanan Pengguna   Donasi',
          style: TextStyle(
            color: Colors.grey,
            fontFamily: 'Times New Roman',
          ),
        ),
        backgroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Text('Customer Service\n',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Times New Roman',
                      fontSize: 30),
                ),

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

                Row(children: <Widget>[
                  Radio(
                    value:4,
                    groupValue: _value,
                    onChanged: (value){
                      setState(() {
                        pilihan = "Semua";
                        _value = 4;
                      });
                    },
                  ),
                  SizedBox(width: 10.0,),
                  Text("Semua‏‏‎ ‎‏‏‎ ‎‏‏‎ ‏‏‎ ‎‏‏‎ ‎‎‏‏‎ ‎ ‏‏‎ ‏‏‎  ‏‏‎ ‏‏‏"),
                ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),

                Padding(
                  padding: const EdgeInsets.all(8),
                  child: ElevatedButton(

                      child: const Text('Submit'),
                      onPressed: () async {
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

                        Map<String, dynamic> data = jsonDecode(response.body);
                        print(data);
                        if (data['media'] == 'Instagram'){
                          child: Container(
                              color: Colors.black,
                              width: 200,
                              height: 200,
                              child: const Image(
                                  image: AssetImage('assets/images/insta.png')
                              )
                          );
                        }
                        else if (data['media'] == 'Twitter') {
                          print("twit");
                          child: Container(
                              color: Colors.black,
                              width: 200,
                              height: 200,
                              child: const Image(
                                  image: AssetImage('assets/images/twit.png')
                              )
                          );
                        }

                        else if (data['media'] == 'WA/Telepon') {
                          print("wa");
                          child: Container(
                              color: Colors.black,
                              width: 200,
                              height: 200,
                              child: const Image(
                                  image: AssetImage('assets/images/wa.png')
                              )
                          );
                        }

                        else if (data['media'] == 'Semua') {
                          print("semua");
                        }

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