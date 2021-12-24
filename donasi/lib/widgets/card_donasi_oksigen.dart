import 'package:flutter/material.dart';

class CardDonasiOksigen extends StatefulWidget {
  const CardDonasiOksigen({Key? key}) : super(key: key);

  @override
  _CardDonasiOksigenState createState() => _CardDonasiOksigenState();
}

class _CardDonasiOksigenState extends State<CardDonasiOksigen> {

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
                      Image.network("https://awsimages.detik.net.id/community/media/visual/2021/06/23/ilustrasi-tabung-oksigen_169.jpeg?w=700&q=90"),
                      const SizedBox(height: 10.0),
                      const Text("Donasi Oksigen",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Text("Bantu pasien Covid-19 yang memerlukan oksigen",
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
