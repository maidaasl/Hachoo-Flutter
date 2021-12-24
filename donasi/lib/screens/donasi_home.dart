import 'package:donasi/widgets/add_message.dart';
import 'package:donasi/widgets/card_donasi.dart';
import 'package:donasi/widgets/card_donasi_apd.dart';
import 'package:donasi/widgets/card_donasi_oksigen.dart';
import 'package:donasi/widgets/carousel.dart';
import 'package:flutter/material.dart';

class DonasiHomePage extends StatefulWidget {
  const DonasiHomePage({Key? key}) : super(key: key);

  @override
  _DonasiHomePageState createState() => _DonasiHomePageState();
}

class _DonasiHomePageState extends State<DonasiHomePage> {

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget> [
          Carousel(),
          SizedBox(height: 18),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text("Cara Mudah Untuk Membantu Sesama",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 32,
                  color: Colors.black
              ),
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
            child: Text("Pesan-Pesan Orang Baik",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 32,
                  color: Colors.black
              ),
            ),
          ),
          SizedBox(height: 18),
          // CardMessage(),
          SizedBox(height: 18),
          // CardMessage(),
          SizedBox(height: 18),
          // CardMessage(),
          SizedBox(height: 18),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text("Tulis Pesanmu",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Colors.black
              ),
            ),
          ),
          AddMessage(),
        ]
    );
  }
}
