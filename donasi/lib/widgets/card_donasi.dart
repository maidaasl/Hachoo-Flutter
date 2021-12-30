import 'package:flutter/material.dart';

import 'form_donasi.dart';

class CardDonasi extends StatefulWidget {
  const CardDonasi({Key? key}) : super(key: key);

  @override
  _CardDonasiState createState() => _CardDonasiState();
}

class _CardDonasiState extends State<CardDonasi> {

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
                      Image.asset('assets/images/donasi/hospital.jpeg'),
                      const SizedBox(height: 10.0),
                      const Text("Donasi",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Text("Mari saling berbagi kebahagiaan dengan membantu sesama",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                        ),
                      )
                    ],
                  ),
                ),
                ElevatedButton(onPressed: () {
                  Route route = MaterialPageRoute(
                      builder: (context) => FormDonasi());
                  Navigator.push(context, route);
                }, child: Text("Donasi Sekarang"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
