import 'package:flutter/material.dart';
import 'package:aiqal/widgets/appbar.dart';
import 'package:aiqal/widgets/drawer.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String fullName = '';
  DateTime selectedStartDate = DateTime.now();
  DateTime selectedendDate = DateTime.now().add(const Duration(days: 2));
  final _formKey = GlobalKey<FormBuilderState>();
  final childerncontrollter = TextEditingController()..text = '0';
  final adultcontroller = TextEditingController()..text = '0';
  final datecontroller = TextEditingController();

  @override
  void initState() {
    getData();
  }

  getData() async {
    SharedPreferences data = await SharedPreferences.getInstance();
    setState(() {
      fullName = data.getString('fullName') ?? '';
    });
  }

  showName() {
    if (fullName != '')
      return Text(
        'Welcome back, ' + fullName + '! Make A Reservation',
        style: TextStyle(fontSize: 23),
      );
    else
      return Text(
        'Welcome, Make A Reservation',
        style: TextStyle(fontSize: 23),
      );
  }

  // getval(){

  // }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        "Reservation",
      ),
      body: SingleChildScrollView(
        child: FormBuilder(
          key: _formKey,
          onChanged: getData,
          initialValue: {
            'stayDateRange':
                DateTimeRange(start: selectedStartDate, end: selectedendDate),
            'noOfAdults': '0',
            'noOfChildren': '0',
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(13),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: showName(),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        FormBuilderDateRangePicker(
                          name: 'stayDateRange',
                          controller: datecontroller,
                          firstDate: selectedStartDate,
                          lastDate: selectedendDate,
                          // onChanged: getval(),
                          decoration: InputDecoration(
                            labelText: 'Select Date Range',
                            helperText: 'Select Your Start and End Dates',
                            // hintText: 'Hint text',
                          ),
                        ),
                        FormBuilderTextField(
                          name: 'noOfAdults',
                          controller: adultcontroller,
                          decoration: InputDecoration(
                            labelText: 'Number of Adults',
                            helperText: 'Enter the number of adults',
                          ),
                          keyboardType: TextInputType.number,
                        ),
                        FormBuilderTextField(
                          name: 'noOfChildren',
                          controller: childerncontrollter,
                          decoration: InputDecoration(
                            labelText: 'Number of Children',
                            helperText: 'Enter the number of children',
                          ),
                          keyboardType: TextInputType.number,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          child: Text('Select Package'),
                          // color: Colors.orangeAccent,
                          onPressed: () {
                            Navigator.pushNamed(context, '/room_selection',
                                arguments: {
                                  "dateRange": datecontroller.text,
                                  "adults": adultcontroller.text,
                                  "children": childerncontrollter.text,
                                });
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
