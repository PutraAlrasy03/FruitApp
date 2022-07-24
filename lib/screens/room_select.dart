import 'package:flutter/material.dart';
import 'package:aiqal/widgets/appbar.dart';
import 'package:aiqal/widgets/drawer.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class RoomSelectionScreen extends StatefulWidget {
  @override
  State<RoomSelectionScreen> createState() => _RoomSelectionScreenState();
}

class _RoomSelectionScreenState extends State<RoomSelectionScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  final singleroomcontroller = TextEditingController()..text = '0';
  final doubleroomcontroller = TextEditingController()..text = '0';
  final executiveroomcontroller = TextEditingController()..text = '0';
  String dateRange = '', adults = '', children = '';
  Map data = {};

  getData() {
    dateRange = data['dateRange'] as String;
    adults = data['adults'] as String;
    children = data['children'] as String;
  }

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)!.settings.arguments as Map;
    getData();
    return Scaffold(
      resizeToAvoidBottomInset: false, // set it to false
      appBar: MainAppBar(
        "Package Selection",
      ),

      body: SingleChildScrollView(
        child: FormBuilder(
          key: _formKey,
          initialValue: {
            'noOfSingleRoom': '0',
            'noOfDoubleRoom': '0',
            'noOfExecutiveRoom': '0',
          },
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // TextField(
              //   decoration: const InputDecoration(
              //       border: OutlineInputBorder(),
              //       hintText: 'Search for the perfect room'),
              // ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Select Package',
                style: TextStyle(fontSize: 23),
              ),
              Container(
                child: Padding(
                  padding: EdgeInsets.all(13),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text('Package Type'),
                          SizedBox(
                            width: 60,
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Text('Total Package')
                        ],
                      ),
                      Row(children: [
                        Column(
                          children: [
                            Image.asset(
                              'assets/images/manga.jpg',
                              height: 100,
                              width: 100,
                            ),
                            Text('Mango package'),
                          ],
                        ),
                        SizedBox(
                          width: 55,
                        ),
                        SizedBox(
                          width: 80,
                        ),
                        Container(
                          width: 50,
                          child: FormBuilderTextField(
                            name: 'noOfSingleRoom',
                            controller: singleroomcontroller,
                            // decoration: InputDecoration(
                            //   labelText: 'Number of Children',
                            //   helperText: 'Enter the number of children',
                            // ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ]),
                      Row(children: [
                        Column(
                          children: [
                            Image.asset(
                              'assets/images/red.jpg',
                              height: 100,
                              width: 100,
                            ),
                            Text('Red grape package'),
                          ],
                        ),
                        SizedBox(
                          width: 55,
                        ),
                        SizedBox(
                          width: 80,
                        ),
                        Container(
                          width: 50,
                          child: FormBuilderTextField(
                            name: 'noOfDoubleRoom',
                            controller: doubleroomcontroller,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ]),
                      Row(children: [
                        Column(
                          children: [
                            Image.asset(
                              'assets/images/grape.jpg',
                              height: 100,
                              width: 100,
                            ),
                            Text('Blue grape package'),
                          ],
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        SizedBox(
                          width: 80,
                        ),
                        Container(
                          width: 50,
                          child: FormBuilderTextField(
                            name: 'noOfExecutiveRoom',
                            controller: executiveroomcontroller,
                            // decoration: InputDecoration(
                            //   labelText: 'Number of Children',
                            //   helperText: 'Enter the number of children',
                            // ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ]),
                      SizedBox(
                        height: 25,
                      ),
                      Divider(
                        color: Colors.black,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: 67,
                          ),
                          SizedBox(
                            width: 76,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  ElevatedButton(
                    // color: Colors.blueGrey,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Go back'),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  ElevatedButton(
                    child: Text('Add Personal Details'),
                    // color: Colors.orangeAccent,
                    onPressed: () {
                      checkUser();
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
            ],
          )),
        ),
      ),
    );
  }

  void checkUser() {
    // if (noOfSingleRoom != '') {
    //   Navigator.pushNamed(context, '/payment');
    // } else
    //   Navigator.pushNamed(context, '/personal_details');

    Navigator.pushNamed(context, '/personal_details', arguments: {
      'noOfSingleRoom': singleroomcontroller.text,
      'noOfDoubleRoom': doubleroomcontroller.text,
      'noOfExecutiveRoom': executiveroomcontroller.text,
      'dateRange': dateRange,
      'adults': adults,
      'children': children,
    });
  }
}
