import 'package:flutter/material.dart';

import 'screens/home.dart';
import 'screens/room_select.dart';
import 'screens/confirm_details.dart';
import 'screens/personal_details.dart';
import 'screens/reservation_status.dart';

class reservation extends StatefulWidget {
  const reservation({Key? key}) : super(key: key);

  @override
  State<reservation> createState() => _reservationState();
}

class _reservationState extends State<reservation> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => HomeScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/room_selection': (context) => RoomSelectionScreen(),
        '/personal_details': (context) => PersonalDetailsScreen(),
        '/confirm_details': (context) => DetailsConfirmationScreen(),
        '/status': (context) => StatusScreen(),
      },
    );
  }
}
