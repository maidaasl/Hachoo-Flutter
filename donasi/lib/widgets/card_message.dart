import 'package:flutter/material.dart';

class CardMessage extends StatefulWidget {
  const CardMessage({Key? key, required this.tittle, required this.message}) : super(key: key);

  final String tittle;
  final String message;

  @override
  _CardMessageState createState() => _CardMessageState();
}

class _CardMessageState extends State<CardMessage> {
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
                          children: [
                            Text(widget.tittle,
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(widget.message,
                          style: const TextStyle(
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
