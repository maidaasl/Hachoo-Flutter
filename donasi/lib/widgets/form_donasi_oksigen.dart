import 'package:flutter/material.dart';

class FormDonasiOksigen extends StatefulWidget {
  const FormDonasiOksigen({Key? key}) : super(key: key);
  static const routeName = '/oksigen';

  @override
  _FormDonasiOksigenState createState() => _FormDonasiOksigenState();
}

class _FormDonasiOksigenState extends State<FormDonasiOksigen> {
  final _formKey = GlobalKey<FormState>();
  String titleFieldsValue = "";
  String messageFieldsValue = "";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            print('Card tapped.');
          },
          child: SizedBox(
            width: 300,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child:
                  Column(
                      children: [
                        const SizedBox(height: 8),
                        Row(
                          children: const [
                            Text("lalala",
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        const Text("hehehe",
                          style: TextStyle(
                            fontSize: 13,
                          ),
                        ),
                      ]
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
