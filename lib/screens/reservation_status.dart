import 'package:aiqal/add_post.dart';
import 'package:flutter/material.dart';
import 'package:aiqal/main.dart';
import 'package:aiqal/screens/home.dart';
import 'package:aiqal/widgets/appbar.dart';
import 'package:aiqal/widgets/drawer.dart';

class StatusScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MainAppBar(
          "Reservation Status",
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.all(13),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Reservation Status',
                style: TextStyle(fontSize: 23),
              ),
              Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text('Here is your Reservation ID: '),
                  SizedBox(
                    height: 20,
                  ),
                  Text('RW-9082516-23H', style: TextStyle(fontSize: 21)),
                  SizedBox(
                    height: 20,
                  ),
                  Text('Present this ID when checking in at the Farm'),
                  SizedBox(
                    height: 20,
                  ),
                  Text('Please screenshot this ID',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  SizedBox(
                    height: 20,
                  ),
                  Text('Thank you!'),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
              ElevatedButton(
                // color: Colors.blueGrey,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Go back to Confirm Details!'),
              ),
              RaisedButton(
                // color: Colors.blueGrey,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyHomePage(
                                title: '',
                              )));
                },
                child: Text('Main Menu'),
              ),
              RaisedButton(
                // color: Colors.blueGrey,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddPostScreen()));
                },
                child: Text('Save It!'),
              ),
            ],
          ),
        )));
  }
}
