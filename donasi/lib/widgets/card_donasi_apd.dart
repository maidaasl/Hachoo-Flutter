import 'package:flutter/material.dart';

class CardDonasiApd extends StatefulWidget {
  const CardDonasiApd({Key? key}) : super(key: key);

  @override
  _CardDonasiApdState createState() => _CardDonasiApdState();
}

class _CardDonasiApdState extends State<CardDonasiApd> {

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
            // height: 200,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Image.asset('assets/images/apd.jpeg'),
                      const SizedBox(height: 10.0),
                      const Text("Donasi APD",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Text("Bantu para tim medis terhindar dari paparan Covid-19",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                        ),
                      )
                    ],
                  ),
                ),
                ElevatedButton(onPressed: () {}, child: Text("Donasi Sekarang"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
