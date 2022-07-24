import 'package:flutter/material.dart';
import 'package:aiqal/widgets/card2.dart';

class farm extends StatefulWidget {
  const farm({Key? key}) : super(key: key);

  @override
  State<farm> createState() => _farmState();
}

class _farmState extends State<farm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [],
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 100,
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Text(
                      "Fruit List and Information",
                      style: TextStyle(
                          fontFamily: 'poppins',
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(flex: 1, child: CardTwo()),
          ],
        ),
      ),
    );
  }
}
