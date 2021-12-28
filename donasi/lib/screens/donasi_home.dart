import 'package:donasi/models/all_message.dart';
import 'package:donasi/widgets/add_message.dart';
import 'package:donasi/widgets/card_donasi.dart';
import 'package:donasi/widgets/card_donasi_apd.dart';
import 'package:donasi/widgets/card_donasi_oksigen.dart';
import 'package:donasi/widgets/card_message.dart';
import 'package:donasi/widgets/carousel.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DonasiHomePage extends StatefulWidget {
  const DonasiHomePage({Key? key}) : super(key: key);

  @override
  _DonasiHomePageState createState() => _DonasiHomePageState();
}

class _DonasiHomePageState extends State<DonasiHomePage> {
  List<allMessage> data_message = [];

  fetchData() async {
    const url = 'https://hachoo.herokuapp.com/donasi/all-message';
    try {
      data_message = [];
      final response = await http.get(Uri.parse(url));
      final dataJson = jsonDecode(response.body);
      for (var i in dataJson) {
        Fields fields = Fields(
            tittle: i["fields"]["tittle"], message: i["fields"]["message"]);
        allMessage comment =
            allMessage(model: i["model"], pk: i["pk"], fields: fields);
        data_message.add(comment);
      }
      print(data_message.length);
      return data_message;
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Carousel(),
          const SizedBox(height: 18),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column (
              children: const [
                Text(
                  "Cara Mudah Untuk Membantu Sesama",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 32,
                      color: Colors.black),
                ),
              ],
            ),
          ),
          SizedBox(height: 18),
          CardDonasi(),
          SizedBox(height: 18),
          CardDonasiApd(),
          SizedBox(height: 18),
          CardDonasiOksigen(),
          SizedBox(height: 50),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Text(
                  "Pesan-Pesan Orang Baik",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 32,
                      color: Colors.black),
                ),
                FutureBuilder(
                  future: fetchData(),
                  builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    return const Center(
                      child: Text(
                        "Loading...",
                    ));
                  } else {
                    return Column(
                        children:
                        data_message.map((i) {
                          return CardMessage(
                            tittle : i.fields.tittle,
                            message : i.fields.message,
                          );
                        }).toList()
                    );
                  }
                }),
              ],
            )
          ),

          const SizedBox(height: 18),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column (
              children: const [
                Text(
                  "Tulis Pesanmu",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 32,
                      color: Colors.black),
                ),
              ],
            ),
          ),
          const AddMessage(),
        ]);
  }
}
