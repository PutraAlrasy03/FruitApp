import 'package:flutter/material.dart';

import 'package:aiqal/components/travel_blog.dart';

class fruit extends StatefulWidget {
  const fruit({Key? key}) : super(key: key);

  @override
  State<fruit> createState() => _fruitState();
}

class _fruitState extends State<fruit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(5),
            child: Text(
              'Farm Location and Information',
              style: TextStyle(fontSize: 30),
            ),
          ),
          Expanded(
            flex: 2,
            child: TravelBlog(),
          ),
        ],
      ),
    );
  }
}
