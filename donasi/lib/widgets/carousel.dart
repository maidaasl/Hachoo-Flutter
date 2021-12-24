import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Carousel extends StatefulWidget {
  const Carousel({Key? key}) : super(key: key);

  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {

  final List<Widget> myData = [
    Stack(
        children: [
          Image.asset('assets/images/masker.jpg'),
          const Positioned(
            child: Text("Donasi", style:
            TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            ),
            bottom: 50,
            left: 90,
            right: 90,
          )
        ]
    ),
    Stack(
      children: [
        Image.asset('assets/images/data.jpg'),
        const Positioned(
          child: Text("Donasi", style:
          TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          ),
          bottom: 50,
          left: 90,
          right: 90,
        ),
      ],
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarouselSlider(
              options: CarouselOptions(
                height: 225.0,
                viewportFraction: 1,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
              ),
              items: myData
          ),
        ]
    );
  }
}
