import 'package:flutter/material.dart';
import 'package:homepage/main.dart';

class aboutuspage extends StatefulWidget {
  @override
  _aboutusState createState() => _aboutusState();
}

class _aboutusState extends State<aboutuspage> {
  final _formKey = GlobalKey<FormState>();

  double nilaiSlider = 1;
  bool nilaiCheckBox = false;
  bool nilaiSwitch = true;

  String formFeedback = '';
  bool submittedSuccessfully = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hachoo"),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                Image.network(
                    'https://media.discordapp.net/attachments/865544823435821067/926387636053086238/AboutUs-Flutter.png?width=810&height=310'),
                SizedBox(height: 15),
                RaisedButton(
                  child: const Text(
                    "Kembali",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.blue,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return BelajarForm();
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
