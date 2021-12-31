import 'package:flutter/material.dart';
import 'package:homepage/aboutus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hachoo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: BelajarForm(),
    );
  }
}

class BelajarForm extends StatefulWidget {
  @override
  _BelajarFormState createState() => _BelajarFormState();
}

class _BelajarFormState extends State<BelajarForm> {
  final _formKey = GlobalKey<FormState>();

  double nilaiSlider = 1;
  bool nilaiCheckBox = false;
  bool nilaiSwitch = true;

  String formFeedback = '';
  bool submittedSuccessfully = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 5, 20, 5),
                child: Image.network(
                    'https://media.discordapp.net/attachments/865544823435821067/926388422212452392/Atas-Hachoo.png?width=810&height=162'),
              ),
              Text(
                  "Hachoo adalah website dengan bantuan herokuapp yang memiliki tujuan untuk mengurangi penyebaran Covid-19 di daerah DKI Jakarta. Hachoo sendiri telah menjadi layanan.."),
              SizedBox(height: 15),
              RaisedButton(
                child: const Text(
                  "Selengkapnya Di Sini",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return aboutuspage();
                      },
                    ),
                  );
                },
              ),
              SizedBox(height: 30),
              TextFormField(
                decoration: new InputDecoration(
                  labelText: "Feedback Form",
                  icon: Icon(Icons.people),
                  contentPadding: new EdgeInsets.symmetric(
                      vertical: 25.0, horizontal: 10.0),
                  border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0)),
                ),
                minLines: 10,
                maxLines: 20,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Silahkan berikan Feedback-mu terlebih dahulu';
                  }
                  setState(() {
                    formFeedback += value + "\n";
                  });
                },
              ),
              SizedBox(height: 30),
              RaisedButton(
                child: Text(
                  "Submit",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      submittedSuccessfully = true;
                    });
                  }
                },
              ),
              SizedBox(height: 30),
              LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                if (submittedSuccessfully) {
                  return Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 5, 20, 5),
                      child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(15)),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 5, 20, 5),
                            child: Text("${formFeedback}"),
                          )));
                } else {
                  return SizedBox(
                    height: 0,
                  );
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}
