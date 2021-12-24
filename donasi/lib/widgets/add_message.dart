import 'package:flutter/material.dart';

class AddMessage extends StatefulWidget {
  const AddMessage({Key? key}) : super(key: key);

  @override
  _AddMessageState createState() => _AddMessageState();
}

class _AddMessageState extends State<AddMessage> {

  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  String textFieldsValue = "";
  String textFieldsValue2 = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child:
        Column(
          children: <Widget>[
            const SizedBox(height: 18,),
            const Text("Title", style:
            TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 13,
            ),
                textAlign: TextAlign.center
            ),
            // const SizedBox(height: 18),
            Padding(padding: EdgeInsets.all(20.0),
              child: Form (
                key: _formKey,
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    textFieldsValue = value;
                    return null;
                  },
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      hintText: "Title",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      )
                  ),
                ),
              ),
            ),

            const SizedBox(height: 18,),
            const Text("Message:", style:
            TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 13,
            ),
              textAlign: TextAlign.left,
            ),
            // const SizedBox(height: 18),
            Padding(padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey2,
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    textFieldsValue2 = value;
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: "Message",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      )
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 13),
                primary: Colors.blueGrey,
                onPrimary: Colors.white,
                padding: const EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 8),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),),
              onPressed: () {
                if (_formKey.currentState!.validate() && _formKey2.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                  print(textFieldsValue);
                  print(textFieldsValue2);
                }
              },
              child: const Text('Tambahkan Pesan'),
            ),
            const SizedBox(height: 18,),
          ],
        )
    );
  }
}