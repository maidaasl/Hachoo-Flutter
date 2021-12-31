import 'package:flutter/material.dart';

import '../donasi.dart';

class Konfirmasi extends StatefulWidget {
  const Konfirmasi({Key? key}) : super(key: key);

  @override
  _KonfirmasiState createState() => _KonfirmasiState();
}

class _KonfirmasiState extends State<Konfirmasi> {

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
                            Text('Terima Kasih sudah Berdonasi 😊 melalui\n Hachoo'
                                ' Semoga apa yang telah \n kamu berikan bisa bermanfaat'
                                ' \n bagi semua masyarakat ✨'
                                ' \n Stay safe and stay healthy 😷',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 18,),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 15),
                            primary: Colors.blueGrey,
                            onPrimary: Colors.white,
                            padding: const EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 8),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),),

                          onPressed: () {
                            Route route = MaterialPageRoute(
                                builder: (context) => Donasi());
                            Navigator.push(context, route);
                          },
                          child: const Text('Done'),
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
