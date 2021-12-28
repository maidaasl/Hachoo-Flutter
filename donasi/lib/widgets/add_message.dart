import 'package:donasi/models/all_message.dart';
import 'package:donasi/widgets/add_message_api.dart';
import 'package:flutter/material.dart';

class AddMessage extends StatefulWidget {
  const AddMessage({Key? key}) : super(key: key);

  @override
  _AddMessageState createState() => _AddMessageState();
}

class _AddMessageState extends State<AddMessage> {
  final _formKey = GlobalKey<FormState>();
  String titleFieldsValue = "";
  String messageFieldsValue = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: Column(
                  children: [
                    Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Column(
                              children: [
                                const SizedBox(height: 18,),
                                const Text("Title",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
                                        // color: Color(0xff59A5D8)
                                    )
                                ),
                                TextFormField(
                                  autofocus: true,
                                  decoration: InputDecoration(
                                    hintText: "Title",
                                    labelText: "Title",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.circular(5.0)),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter the title';
                                    }
                                    titleFieldsValue = value;
                                    return null;
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(height: 18),
                            TextFormField(
                              autofocus: true,
                              decoration: InputDecoration(
                                hintText: "Message",
                                labelText: "Message",
                                border: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.circular(5.0)),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter some text";
                                }
                                messageFieldsValue = value;
                                return null;
                              },
                            ),

                            const SizedBox(height: 12),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 13),
                                  primary: Colors.blueGrey,
                                  onPrimary: Colors.white,
                                  padding: const EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 8),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),),

                              onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                      Fields newMessages = Fields(
                                        tittle: titleFieldsValue,
                                        message: messageFieldsValue,
                                      );
                                      addNewMessage(newMessages).then((value) {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              value,
                                            ),
                                          ),
                                        );
                                      });
                                      // If the form is valid, display a snackbar. In the real world,
                                      // you'd often call a server or save the information in a database.
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(content: Text('Processing Data')),
                                      );
                                      print(titleFieldsValue);
                                      print(messageFieldsValue);
                                }
                              },
                              child: const Text('Tambahkan Pesan'),
                            ),
                          ],
                        )
                    )
                  ],
                )
            )
    );
  }
}